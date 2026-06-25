// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Lucy';

  @override
  String get splashLoading => 'Chargement…';

  @override
  String get authLoginBrandingTitle => 'Votre tuteur IA personnel';

  @override
  String get authLoginBrandingSubtitle =>
      'Progressez à votre rythme avec un accompagnement sur mesure.';

  @override
  String get authLoginTitle => 'Connexion';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authEmailHint => 'vous@exemple.com';

  @override
  String get authPasswordLabel => 'Mot de passe';

  @override
  String get authPasswordHint => 'Entrez votre mot de passe';

  @override
  String get authEmailRequired => 'L’email est requis.';

  @override
  String get authPasswordRequired => 'Le mot de passe est requis.';

  @override
  String get authLoginButton => 'Se connecter';

  @override
  String get authForgotPasswordPrompt => 'Mot de passe oublié ?';

  @override
  String get authForgotPasswordLink => 'Réinitialiser';

  @override
  String get authNoAccountPrompt => 'Pas encore de compte ?';

  @override
  String get authSignUpLink => 'Créer un compte';

  @override
  String get authSignUpBrandingTitle => 'Rejoignez Lucy';

  @override
  String get authSignUpBrandingSubtitle =>
      'Créez votre compte et commencez à apprendre avec votre tuteur IA.';

  @override
  String get authSignUpTitle => 'Créer un compte';

  @override
  String get authFullNameLabel => 'Nom complet';

  @override
  String get authFullNameHint => 'Votre nom';

  @override
  String get authFullNameRequired => 'Le nom complet est requis.';

  @override
  String get authSignUpButton => 'Créer mon compte';

  @override
  String get authAlreadyHaveAccountPrompt => 'Déjà un compte ?';

  @override
  String get authLoginLink => 'Se connecter';

  @override
  String get authResetBrandingTitle => 'Réinitialisez votre mot de passe';

  @override
  String get authResetBrandingSubtitle =>
      'Recevez un lien sécurisé par e-mail pour choisir un nouveau mot de passe.';

  @override
  String get authResetTitle => 'Mot de passe oublié';

  @override
  String get authResetSubtitle =>
      'Saisissez votre adresse e-mail pour recevoir un lien de réinitialisation.';

  @override
  String get authResetButton => 'Envoyer le lien';

  @override
  String get authResetSuccessTitle => 'Vérifiez votre e-mail';

  @override
  String authResetSuccessMessage(String email) {
    return 'Si un compte est associé à $email, vous recevrez un e-mail pour réinitialiser votre mot de passe.';
  }

  @override
  String get authResetTryAgain => 'Réessayer';

  @override
  String get authResetBackToLogin => 'Retour à la connexion';

  @override
  String get homeWelcome => 'Bienvenue sur Lucy';

  @override
  String get homeLogout => 'Se déconnecter';

  @override
  String get pageUnderDevelopment => 'En cours de réalisation';

  @override
  String get navDocuments => 'Documents';

  @override
  String get navChat => 'Chat';

  @override
  String get navQuiz => 'Quiz';

  @override
  String get navSettings => 'Paramètres';

  @override
  String get documentsTitle => 'Documents';

  @override
  String get chatTitle => 'Chat';

  @override
  String get quizTitle => 'Quiz';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsSectionAccount => 'Compte';

  @override
  String get settingsSectionLearnerProfile => 'Profil d\'apprentissage';

  @override
  String get settingsSectionApplication => 'Application';

  @override
  String get settingsUiLocaleLabel => 'Langue de l\'interface';

  @override
  String get settingsUiLocaleReadOnly =>
      'La langue de l\'interface est fixée pour le moment.';

  @override
  String get settingsLearnerProfileUnavailable =>
      'Aucun profil d\'apprentissage enregistré.';

  @override
  String get settingsGenericError =>
      'Impossible de charger les paramètres. Réessayez.';

  @override
  String get settingsErrorUnauthorized => 'Session expirée. Reconnectez-vous.';

  @override
  String get settingsThemeSituation => 'Votre situation';

  @override
  String get settingsThemeGoals => 'Objectifs';

  @override
  String get settingsThemeLucyStyle => 'Style Lucy';

  @override
  String get settingsLearnerDomainsHint =>
      'Sélectionnez un ou plusieurs domaines.';

  @override
  String get settingsSaveChanges => 'Enregistrer';

  @override
  String get settingsProfileSaved => 'Profil mis à jour';

  @override
  String get settingsProfileSaveFailed =>
      'Impossible d\'enregistrer le profil. Réessayez.';

  @override
  String get settingsProfileTitle => 'Profil';

  @override
  String get settingsHubSection => 'Menu';

  @override
  String get settingsProfileHubHint => 'Nom, email, mot de passe';

  @override
  String get settingsAiConfigTitle => 'Configuration Lucy';

  @override
  String get settingsAiConfigHubHint => 'Profil IA, langue';

  @override
  String get settingsAiConfigIntro =>
      'Personnalisez comment Lucy vous accompagne dans l\'apprentissage.';

  @override
  String get settingsFirstNameLabel => 'Prénom';

  @override
  String get settingsLastNameLabel => 'Nom';

  @override
  String get settingsFirstNameRequired => 'Le prénom est requis.';

  @override
  String get settingsFieldMinTwoChars => 'Au moins 2 caractères requis.';

  @override
  String get settingsSecuritySection => 'Sécurité';

  @override
  String get settingsChangePassword => 'Changer le mot de passe';

  @override
  String get settingsChangePasswordSubtitle =>
      'Saisissez votre mot de passe actuel puis le nouveau.';

  @override
  String get settingsCurrentPassword => 'Mot de passe actuel';

  @override
  String get settingsNewPassword => 'Nouveau mot de passe';

  @override
  String get settingsConfirmNewPassword => 'Confirmer le mot de passe';

  @override
  String get settingsPasswordChanged => 'Mot de passe mis à jour';

  @override
  String get settingsPasswordChangeFailed =>
      'Impossible de changer le mot de passe. Réessayez.';

  @override
  String get settingsInvalidCurrentPassword => 'Mot de passe actuel incorrect.';

  @override
  String get settingsPasswordMismatch =>
      'Les mots de passe ne correspondent pas.';

  @override
  String get settingsEmailReadOnly =>
      'L\'adresse email ne peut pas être modifiée ici.';

  @override
  String get shellMenu => 'Menu';

  @override
  String get authUnknownError => 'Une erreur est survenue. Réessayez.';

  @override
  String get authUserNotFound => 'Aucun compte ne correspond à cet email.';

  @override
  String get authWrongPassword => 'Mot de passe incorrect.';

  @override
  String get authInvalidCredentials => 'Email ou mot de passe incorrect.';

  @override
  String get authEmailAlreadyInUse => 'Cet email est déjà utilisé.';

  @override
  String get authWeakPassword => 'Le mot de passe est trop faible.';

  @override
  String get authInvalidEmail => 'Adresse email invalide.';

  @override
  String get authNetworkError =>
      'Problème de connexion. Vérifiez votre réseau.';

  @override
  String get authTooManyRequests => 'Trop de tentatives. Réessayez plus tard.';

  @override
  String get authUserDisabled => 'Ce compte a été désactivé.';

  @override
  String get authOperationNotAllowed => 'Cette opération n’est pas autorisée.';

  @override
  String get authProfileWriteFailed =>
      'Impossible d’enregistrer votre profil. Réessayez.';

  @override
  String get authUserProfileConflict =>
      'Cet email est déjà associé à un autre profil.';

  @override
  String get onboardingPlaceholderTitle =>
      'Configuration de votre profil apprenant';

  @override
  String get onboardingQuestionQRole =>
      'Parlez-moi de votre situation : êtes-vous étudiant·e, en reconversion, ou apprenez-vous de votre côté ?';

  @override
  String get onboardingQuestionQDomains =>
      'Quels sujets ou domaines allez-vous travailler avec moi ?';

  @override
  String get onboardingQuestionQGoal =>
      'Quel est votre objectif principal avec moi ?';

  @override
  String get onboardingQuestionQLevel =>
      'Comment décririez-vous votre niveau aujourd’hui ?';

  @override
  String get onboardingQuestionQStyle =>
      'Comment aimez-vous qu’on vous explique les notions ?';

  @override
  String get onboardingQuestionQTone =>
      'Quel ton préférez-vous pour les corrections et le feedback ?';

  @override
  String get onboardingQuestionQLanguage =>
      'Dans quelle langue dois-je vous expliquer les cours ?';

  @override
  String get onboardingSendAnswer => 'Envoyer';

  @override
  String onboardingStepProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get onboardingStepLocked =>
      'Terminez l’étape en cours avant de continuer.';

  @override
  String get onboardingLucyTyping => 'Lucy écrit…';

  @override
  String get onboardingStepReadOnly => 'Étape terminée — consultation seule.';

  @override
  String get onboardingStepEdit => 'Modifier cette étape';

  @override
  String get onboardingRegenerateProfile => 'Regénérer le profil';

  @override
  String get onboardingConfirmTurn => 'C’est bon';

  @override
  String get onboardingRejectTurn => 'Ce n’est pas ça';

  @override
  String get onboardingGenericError => 'Une erreur est survenue. Réessayez.';

  @override
  String get onboardingErrorUnauthorized =>
      'Votre session a expiré. Reconnectez-vous.';

  @override
  String get onboardingErrorValidation => 'Requête invalide. Réessayez.';

  @override
  String get onboardingErrorAlreadyComplete =>
      'Votre profil est déjà configuré.';

  @override
  String get onboardingErrorTranscriptIncomplete =>
      'Terminez les 7 questions avant de lancer l’analyse.';

  @override
  String get onboardingErrorProfileIncomplete =>
      'Le profil généré est incomplet. Réessayez ou modifiez vos réponses.';

  @override
  String get onboardingErrorPendingProfileMissing =>
      'Aucun profil en attente de validation. Relancez l’analyse.';

  @override
  String get onboardingErrorLlmInvalid =>
      'Lucy n’a pas pu interpréter la réponse. Réessayez dans un instant.';

  @override
  String get onboardingErrorLlmUnavailable =>
      'Lucy est temporairement indisponible. Réessayez plus tard.';

  @override
  String get onboardingErrorInternal => 'Une erreur est survenue. Réessayez.';

  @override
  String get onboardingAnswerRequired => 'Répondez avant d’envoyer.';

  @override
  String get onboardingAnswerTooLong =>
      'Votre réponse est trop longue (2000 caractères maximum).';

  @override
  String get onboardingAnswerHint => 'Votre réponse…';

  @override
  String get onboardingAnalysisReadyHint =>
      'Analyse terminée. L’écran de confirmation arrive bientôt.';

  @override
  String get onboardingConfirmTitle => 'Votre profil apprenant';

  @override
  String get onboardingConfirmSummaryHeading => 'Ce que Lucy a retenu';

  @override
  String get onboardingConfirmAccept => 'Valider et continuer';

  @override
  String get onboardingConfirmEdit => 'Modifier mes réponses';

  @override
  String get onboardingConfirmMissingAnalysis =>
      'Aucune analyse disponible. Terminez d’abord le questionnaire.';

  @override
  String get onboardingProfileLabelPrimaryRole => 'Situation';

  @override
  String get onboardingProfileLabelMainDomains => 'Domaines';

  @override
  String get onboardingProfileLabelLearningGoal => 'Objectif';

  @override
  String get onboardingProfileLabelSelfAssessedLevel => 'Niveau';

  @override
  String get onboardingProfileLabelExplanationStyle => 'Style d’explication';

  @override
  String get onboardingProfileLabelFeedbackTone => 'Ton du feedback';

  @override
  String get onboardingProfileLabelTutoringLanguage =>
      'Langue des explications';

  @override
  String get onboardingEnumPrimaryRoleStudent => 'Étudiant·e';

  @override
  String get onboardingEnumPrimaryRoleProfessional => 'Professionnel·le';

  @override
  String get onboardingEnumPrimaryRoleEducator => 'Enseignant·e';

  @override
  String get onboardingEnumPrimaryRoleSelfLearner => 'Apprentissage autonome';

  @override
  String get onboardingEnumPrimaryRoleOther => 'Autre';

  @override
  String get onboardingEnumDomainSciences => 'Sciences';

  @override
  String get onboardingEnumDomainLaw => 'Droit';

  @override
  String get onboardingEnumDomainMedicine => 'Médecine';

  @override
  String get onboardingEnumDomainLanguages => 'Langues';

  @override
  String get onboardingEnumDomainBusiness => 'Commerce / gestion';

  @override
  String get onboardingEnumDomainCs => 'Informatique';

  @override
  String get onboardingEnumDomainOther => 'Autre';

  @override
  String get onboardingEnumLearningGoalExam => 'Préparer un examen';

  @override
  String get onboardingEnumLearningGoalUnderstandCourse =>
      'Mieux comprendre un cours';

  @override
  String get onboardingEnumLearningGoalQuickReview => 'Révision rapide';

  @override
  String get onboardingEnumLearningGoalProfessional =>
      'Montée en compétences pro';

  @override
  String get onboardingEnumLearningGoalCertification => 'Certification';

  @override
  String get onboardingEnumLearningGoalOther => 'Autre';

  @override
  String get onboardingEnumLevelBeginner => 'Débutant';

  @override
  String get onboardingEnumLevelIntermediate => 'Intermédiaire';

  @override
  String get onboardingEnumLevelAdvanced => 'Avancé';

  @override
  String get onboardingEnumLevelVariable => 'Variable selon les sujets';

  @override
  String get onboardingEnumStyleStepByStep => 'Étape par étape';

  @override
  String get onboardingEnumStyleSummaryFirst => 'Résumé d’abord';

  @override
  String get onboardingEnumStyleAnalogies => 'Analogies';

  @override
  String get onboardingEnumStyleSocratic => 'Questions guidées';

  @override
  String get onboardingEnumToneEncouraging => 'Encourageant';

  @override
  String get onboardingEnumToneNeutral => 'Neutre';

  @override
  String get onboardingEnumToneStrict => 'Exigeant';

  @override
  String get onboardingEnumTutoringLangFr => 'Français';

  @override
  String get onboardingEnumTutoringLangEn => 'Anglais';

  @override
  String get onboardingEnumTutoringLangDe => 'Allemand';

  @override
  String get onboardingEnumTutoringLangMatchDocument => 'Langue du document';

  @override
  String get documentGenericError =>
      'Une erreur est survenue avec vos documents. Réessayez.';

  @override
  String get documentErrorValidation =>
      'Requête invalide. Vérifiez le fichier et réessayez.';

  @override
  String get documentErrorUnauthorized =>
      'Votre session a expiré. Reconnectez-vous.';

  @override
  String get documentErrorUploadNotReady =>
      'Le fichier n’est pas encore prêt. Patientez puis réessayez.';

  @override
  String get documentErrorUploadNetwork =>
      'Échec de l’envoi vers le stockage (réseau ou CORS). Configurez le CORS du bucket Firebase Storage pour le web.';

  @override
  String get documentErrorProcessingNoDelete =>
      'Traitement en cours. Vous ne pouvez pas supprimer ce document pour l’instant.';

  @override
  String get documentErrorOneUploadAtATime =>
      'Un autre téléversement est déjà en cours. Attendez la fin.';

  @override
  String get documentErrorSearchActiveLimit =>
      'Vous pouvez activer au maximum 5 documents pour la recherche.';

  @override
  String get documentErrorTypeNotAllowed =>
      'Ce type de fichier n’est pas pris en charge.';

  @override
  String get documentErrorTypeMismatch =>
      'Le contenu du fichier ne correspond pas au type indiqué.';

  @override
  String get documentErrorTooLarge =>
      'Ce fichier est trop volumineux (20 Mo maximum).';

  @override
  String get documentErrorEmptyExtraction =>
      'Lucy n’a pas pu extraire assez de texte de ce document.';

  @override
  String get documentErrorPasswordProtected =>
      'Ce PDF est protégé par mot de passe. Retirez la protection puis réessayez.';

  @override
  String get documentErrorOcrRequired =>
      'Ce document semble être un scan sans texte lisible.';

  @override
  String get documentErrorNotFound => 'Document introuvable.';

  @override
  String get documentProcessingFailed =>
      'Le traitement du document a échoué. Vous pouvez réessayer.';

  @override
  String get documentErrorUploadAbandoned =>
      'Le téléversement a expiré. Supprimez l’entrée et réessayez.';

  @override
  String get documentErrorEmbeddingUnavailable =>
      'L’indexation est temporairement indisponible. Réessayez plus tard.';

  @override
  String get documentsAdd => 'Ajouter';

  @override
  String get documentsAddTitle => 'Ajouter un document';

  @override
  String get documentsEmpty =>
      'Aucun document pour l’instant. Ajoutez un PDF, Word ou fichier texte pour commencer.';

  @override
  String documentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count documents',
      one: '$count document',
      zero: 'Aucun document',
    );
    return '$_temp0';
  }

  @override
  String get documentsProcessingHint =>
      'Lucy traite votre document. Cela peut prendre un moment.';

  @override
  String get documentsPickFile => 'Choisir un fichier';

  @override
  String get documentsPickFileRequired =>
      'Veuillez choisir un fichier à téléverser.';

  @override
  String get documentsFieldTitle => 'Titre';

  @override
  String get documentsUpload => 'Téléverser';

  @override
  String get documentsDownload => 'Télécharger';

  @override
  String get documentsDelete => 'Supprimer';

  @override
  String get documentsDialogCancel => 'Annuler';

  @override
  String get documentsDeleteConfirmTitle => 'Supprimer le document ?';

  @override
  String documentsDeleteConfirmMessage(String title) {
    return 'Supprimer « $title » ? Cette action est irréversible.';
  }

  @override
  String get documentsStatusUploading => 'Téléversement';

  @override
  String get documentsStatusProcessing => 'Traitement';

  @override
  String get documentsStatusReady => 'Prêt';

  @override
  String get documentsStatusFailed => 'Échec';

  @override
  String get chatDefaultTitle => 'Nouvelle conversation';

  @override
  String get chatNewConversation => 'Nouvelle conversation';

  @override
  String get chatConversationsTitle => 'Conversations';

  @override
  String get chatShowThreadList => 'Liste des conversations';

  @override
  String get chatSourcesTitle => 'Sources';

  @override
  String chatSourcePages(int pageStart, int pageEnd) {
    return 'Pages $pageStart–$pageEnd';
  }

  @override
  String get chatEmptyHint => 'Posez une question sur vos documents actifs.';

  @override
  String get chatEmptyDescription =>
      'Posez une question sur vos documents actifs et je réponds, sources à l\'appui.';

  @override
  String chatGreeting(String name) {
    return 'Bonjour $name';
  }

  @override
  String get chatGreetingFallback => 'Bonjour';

  @override
  String get chatConversationSubtitle =>
      'Réponses basées sur vos documents actifs';

  @override
  String get chatConversationSubtitleMobile => 'Réponses sourcées';

  @override
  String get chatSourceLabel => 'Source';

  @override
  String chatActiveDocumentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count documents actifs',
      one: '$count document actif',
      zero: 'Aucun document actif',
    );
    return '$_temp0';
  }

  @override
  String get chatSuggestionSummarize => 'Résume mes documents';

  @override
  String get chatSuggestionQuiz => 'Propose-moi un quiz';

  @override
  String get chatSuggestionExplain => 'Explique un concept clé';

  @override
  String get chatComposerHint => 'Posez une question sur vos documents actifs…';

  @override
  String get chatSend => 'Envoyer';

  @override
  String get chatRetry => 'Réessayer';

  @override
  String get chatLoading => 'Chargement…';

  @override
  String get chatOfflineBanner =>
      'Hors ligne — affichage du cache local. L’envoi est désactivé.';

  @override
  String get chatNoCorpusTitle => 'Aucun document actif';

  @override
  String get chatNoCorpusMessage =>
      'Activez la recherche sur au moins un document prêt dans l’onglet Documents.';

  @override
  String get chatNoCorpusCta => 'Aller aux documents';

  @override
  String get chatErrorNoActiveDocuments =>
      'Activez au moins un document pour discuter avec Lucy.';

  @override
  String get chatErrorLearnerProfileMissing =>
      'Terminez l’onboarding pour utiliser le chat.';

  @override
  String get chatErrorUnauthorized => 'Session expirée. Reconnectez-vous.';

  @override
  String get chatErrorNotFound => 'Conversation introuvable.';

  @override
  String get chatErrorInvalidMessage => 'Message invalide.';

  @override
  String get chatErrorLlmUnavailable =>
      'Lucy est temporairement indisponible. Réessayez plus tard.';

  @override
  String get chatErrorInvalidResponse =>
      'Réponse invalide du serveur. Réessayez.';

  @override
  String get chatErrorStreamInProgress =>
      'Un message est déjà en cours de génération.';

  @override
  String get chatGenericError => 'Une erreur est survenue. Réessayez.';

  @override
  String get quizEmptyHint =>
      'Demandez à Lucy dans le chat pour générer un quiz.';

  @override
  String get quizLibraryEmptyHint =>
      'Demandez à Lucy dans le chat pour générer un quiz ou des cartes mémoire.';

  @override
  String get quizLibraryHistoryTitle => 'Historique';

  @override
  String get quizLibraryTypeQuiz => 'Quiz';

  @override
  String get quizLibraryTypeFlashcards => 'Cartes';

  @override
  String get quizLibraryOpen => 'Ouvrir';

  @override
  String get quizLibraryDateToday => 'Aujourd\'hui';

  @override
  String get quizLibraryDateYesterday => 'Hier';

  @override
  String get quizLibraryDeleteConfirmTitle => 'Supprimer la session ?';

  @override
  String quizLibraryDeleteConfirmMessage(String title) {
    return 'Supprimer « $title » ? Cette action est irréversible.';
  }

  @override
  String get quizLibraryDeleteAction => 'Supprimer';

  @override
  String get quizLibraryDeleteCancel => 'Annuler';

  @override
  String get quizComingSoon => 'La génération de quiz arrive bientôt.';

  @override
  String quizSessionQuestionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count questions',
      one: '$count question',
    );
    return '$_temp0';
  }

  @override
  String quizSessionFlashcardCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cartes',
      one: '$count carte',
    );
    return '$_temp0';
  }

  @override
  String get quizSessionPlaceholderMessage =>
      'La session s\'ouvrira ici prochainement.';

  @override
  String get chatLearningSessionCardTitle => 'Quiz prêt';

  @override
  String get chatLearningSessionFlashcardsCardTitle => 'Cartes prêtes';

  @override
  String get chatLearningSessionQuizSubtitle =>
      'Révisez vos cours avec un quiz interactif.';

  @override
  String get chatLearningSessionFlashcardsSubtitle =>
      'Mémorisez les notions clés en un clin d\'œil.';

  @override
  String get chatLearningSessionStartQuiz => 'Commencer le quiz';

  @override
  String get chatLearningSessionStartFlashcards => 'Voir les cartes';

  @override
  String get chatLearningSessionOpen => 'Ouvrir';

  @override
  String flashcardsSessionProgress(int current, int total) {
    return 'Carte $current / $total';
  }

  @override
  String get flashcardsSessionFront => 'Recto';

  @override
  String get flashcardsSessionBack => 'Verso';

  @override
  String get flashcardsSessionTapToFlip => 'Appuyer pour retourner';

  @override
  String get flashcardsSessionPrevious => 'Précédente';

  @override
  String get flashcardsSessionNext => 'Suivante';

  @override
  String quizSessionProgress(int current, int total) {
    return 'Question $current / $total';
  }

  @override
  String quizSessionProgressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get quizSessionCorrect => 'Bonne réponse !';

  @override
  String get quizSessionIncorrect => 'Mauvaise réponse';

  @override
  String get quizSessionExplanationTitle => 'Explication';

  @override
  String get quizSessionNextQuestion => 'Question suivante';

  @override
  String get quizSessionFinish => 'Voir le score';

  @override
  String get quizSessionScoreTitle => 'Quiz terminé !';

  @override
  String quizSessionScoreSubtitle(int correct, int total) {
    return 'Vous avez répondu correctement à $correct question(s) sur $total.';
  }

  @override
  String get quizSessionClose => 'Fermer';

  @override
  String get quizSessionRetry => 'Recommencer';

  @override
  String quizSessionScore(int correct, int total) {
    return 'Score : $correct / $total';
  }

  @override
  String get quizNoCorpusTitle => 'Aucun document actif';

  @override
  String get quizNoCorpusMessage =>
      'Activez la recherche sur au moins un document prêt pour générer un quiz.';

  @override
  String get quizNoCorpusCta => 'Aller aux documents';

  @override
  String get quizLoading => 'Chargement…';

  @override
  String get quizGenericError => 'Une erreur est survenue. Réessayez.';

  @override
  String get learningSessionNotFound => 'Cette session est introuvable.';

  @override
  String get learningSessionGenerationFailed =>
      'La génération a échoué. Réessayez depuis le chat.';

  @override
  String get learningSessionValidationError =>
      'La demande de génération est invalide.';

  @override
  String get learningGenericError => 'Une erreur est survenue. Réessayez.';

  @override
  String get interfaceStyleSectionTitle => 'Style d\'interface';

  @override
  String get interfaceStyleSectionHint => 'Change l\'ambiance visuelle de Lucy';

  @override
  String get interfaceStyleAcademic => 'Académique';

  @override
  String get interfaceStyleAcademicDescription => 'Par défaut';

  @override
  String get interfaceStylePremiumDark => 'Premium sombre';

  @override
  String get interfaceStylePremiumDarkDescription => 'Lueur froide';

  @override
  String get interfaceStyleMotivant => 'Motivant';

  @override
  String get interfaceStyleMotivantDescription => 'Accents chaleureux';

  @override
  String get appearanceSectionTitle => 'Apparence';

  @override
  String get appearanceLight => 'Clair';

  @override
  String get appearanceDark => 'Sombre';

  @override
  String get appearanceSystem => 'Système';
}
