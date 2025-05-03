class EndPoint {
  static String baseUrl = "https://bolder-temporal-palladium.glitch.me/api/";
  static String signIn = "auth/login";
  static String signUp = "auth/register";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String firstName = "firstName";
  static String lastName = "lastName";
  static String phone = "mobileNumber";
  static String gender = "gender";
  static String confirmPassword = "confirmPassword";
  static String profilePic = "profilePic";
}
