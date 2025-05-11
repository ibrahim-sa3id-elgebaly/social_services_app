class EndPoint {
  static String baseUrl = "https://bolder-temporal-palladium.glitch.me/api/";
  static String signIn = "auth/login";
  static String signUp = "auth/register";
  static String updateProfile = "auth/update-profile";
  static String forgotPassword = "auth/forgot-password";
  static String resetPassword = "auth/reset-password";

  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String status = "message";
  static String errorMessage = "message";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "_id";
  static String firstName = "firstName";
  static String lastName = "lastName";
  static String phone = "mobileNumber";
  static String gender = "gender";
  static String confirmPassword = "confirmPassword";
  static String profilePic = "profilePic";
  static String currentPassword = "currentPassword";
  static String newPassword = "newPassword";
  static String resetToken = "resetToken";
  static String otp = "otp";
}
