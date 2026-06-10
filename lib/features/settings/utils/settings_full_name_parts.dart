/// Splits and joins [fullName] for profile first/last name fields.
abstract final class SettingsFullNameParts {
  static ({String firstName, String lastName}) split(String fullName) {
    final trimmed = fullName.trim();
    if (trimmed.isEmpty) {
      return (firstName: '', lastName: '');
    }
    final spaceIndex = trimmed.indexOf(' ');
    if (spaceIndex < 0) {
      return (firstName: trimmed, lastName: '');
    }
    return (
      firstName: trimmed.substring(0, spaceIndex).trim(),
      lastName: trimmed.substring(spaceIndex + 1).trim(),
    );
  }

  static String join({
    required String firstName,
    required String lastName,
  }) {
    return '${firstName.trim()} ${lastName.trim()}'.trim();
  }
}
