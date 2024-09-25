class ApiConstants {
  static const String baseUrl = 'https://backend.phealthconn.com/api/';
  static const String webSocketUrl = 'ws://backend.phealthconn.com/ws';

  static const String profilePath = 'profile/';
  static const String signUpPath = '${profilePath}register';
  static const String signInPath = 'token';
  static const String signInWithGooglePath = '${profilePath}google-login/';
  static const String signInWithFacebookPath = '${profilePath}facebook-login/';
  static const String signInWithApplePath = '${profilePath}apple-login/';
  static const String logOutPath = 'token/blacklist';
  static const String resetPasswordPath = '${profilePath}password/reset/request';
  static const String confirmPasswordResetPath = '${profilePath}password/reset/confirm';
  static const String sendVerificationCodePath = '${profilePath}generate-code';
  static const String confirmVerificationCodePath = '${profilePath}verify-code';
  static const String setNewPasswordPath = '${profilePath}password/reset';
  static const String changePasswordPath = '$profilePath/password/change';
  static const String refreshToken = 'token/refresh';
  static const String fetchUserProfilePath = profilePath;
  static const String checkEmailPath = '$profilePath/check-email/';
  static const String ratingPath = 'rating/';
  static const String report = 'issue-report/';
  static const String legalDocs = 'legal-docs/';
  static const String reminders = 'reminders/';

  static const String chatsPath = 'chats/';
  static const String chatsConfigsPath = 'configs/';
  static const String deleteAllChatsPath = '${chatsPath}delete_all/';
  static const String chatRemainingLimits = 'user-limits/';
  static const String uploadFilePath = 'upload_file/';
  static const String chatsHistoryArg = 'is_translation_tool';
}
