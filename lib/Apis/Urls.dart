class Urls {
   static const String domain = "https://khrejeen-back.icrcompany.net";
  // static const String domain = "http://192.168.1.17:8000";
  static const String baseUrl = "$domain/api/v1/";
  static const String storageBaseUrl = "$domain/storage/";
  static const String login = "${baseUrl}login";
  static const String signUp = "${baseUrl}register";
  static const String sendVerificationCode = "${baseUrl}send/verification-code";
  static const String checkVerificationCode =
      "${baseUrl}check/verification-code";
  static const String restPassword = "${baseUrl}reset-password";
  static const String profileInfo = "${baseUrl}profile";
  static const String updateProfile = "${baseUrl}profile/update";
  static const String changePassword = "${baseUrl}change-password";
  static const String offers = "${baseUrl}offers";
  static const String sections = "${baseUrl}sections";
  static const String teachers = "${baseUrl}teachers";
  static const String Home = "${baseUrl}home/mobile";
  static const String logout = "${baseUrl}logout";
  static const String librarySections = "${baseUrl}sections?type=book_section";
  static const String contactMessages = "${baseUrl}contact-messages";
   static const String infos = "${baseUrl}infos";

}
