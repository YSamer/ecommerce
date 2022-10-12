class AppLinks {
  static const String server = 'https://ysflutter.000webhostapp.com/ecommerce';
  static const String test = '$server/test.php';
  // ==================== Authentication ==================== //
  static const String signup = '$server/auth/signup.php';
  static const String login = '$server/auth/login.php';
  static const String verifyCode = '$server/auth/verify_code.php';
  // ==================== Forget Password ==================== //
  static const String checkEmail =
      '$server/auth/forget_password/check_email.php';
  static const String resetPassword =
      '$server/auth/forget_password/reset_password.php';
  static const String verifyCodeForgetPassword =
      '$server/auth/forget_password/verify_code_forget_password.php';

  // ==================== Home ==================== //
  static const String homepage = '$server/home.php';
  static const String items = '$server/items/items.php';
}
