# syntax=docker/dockerfile:1

# ---------- Stage 1: build the Flutter web bundle ----------
FROM debian:bookworm-slim AS build

ARG FLUTTER_VERSION=3.38.3
# Backend URL baked into the web build at compile time (see ApiEndpoints).
ARG LUCY_API_BASE_URL=http://localhost:3001

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
      git curl unzip xz-utils ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Flutter SDK at the pinned version.
RUN git clone --depth 1 --branch "${FLUTTER_VERSION}" \
      https://github.com/flutter/flutter.git /opt/flutter
ENV PATH="/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:${PATH}"
RUN git config --global --add safe.directory /opt/flutter && flutter precache --web

WORKDIR /app

# Cache dependencies first.
COPY pubspec.yaml pubspec.lock ./
RUN flutter pub get

# Build.
COPY . .
RUN flutter gen-l10n \
    && flutter build web --release \
       --dart-define=LUCY_API_BASE_URL="${LUCY_API_BASE_URL}"

# ---------- Stage 2: serve with nginx ----------
FROM nginx:1.27-alpine AS runtime
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
