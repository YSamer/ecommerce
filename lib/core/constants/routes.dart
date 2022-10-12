import 'package:ecommerce_1/core/middleware/middleware_app.dart';
import 'package:ecommerce_1/view/screens/auth/forget_password_screens/forget_password/forget_password.dart';
import 'package:ecommerce_1/view/screens/auth/forget_password_screens/reset_password/reset_password.dart';
import 'package:ecommerce_1/view/screens/auth/forget_password_screens/success_reset_password/success_reset_password.dart';
import 'package:ecommerce_1/view/screens/auth/forget_password_screens/verify_code_forget_password/verify_code_forget_password.dart';
import 'package:ecommerce_1/view/screens/auth/login/login.dart';
import 'package:ecommerce_1/view/screens/auth/signup/signup.dart';
import 'package:ecommerce_1/view/screens/auth/success_signup/success_signup.dart';
import 'package:ecommerce_1/view/screens/auth/verify_code_signup/verify_code_signup.dart';
import 'package:ecommerce_1/view/screens/home_screens/screens/home_page/home_page.dart';
import 'package:ecommerce_1/view/screens/home_screens/home_screens.dart';
import 'package:ecommerce_1/view/screens/items_page/items_page.dart';
import 'package:ecommerce_1/view/screens/languages/languages.dart';
import 'package:ecommerce_1/view/screens/onboarding/onboarding.dart';
import 'package:ecommerce_1/view/test_data/test_data_screen.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  //Onboarding
  static const String initial = '/';
  static const String onboarding = '/onboarding';
  //Auth
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgetPassword = '/forget_password';
  static const String verifyCode = '/verify_code';
  static const String verifyCodeSignUp = '/verify_code_signup';
  static const String resetPassword = '/reset_password';
  static const String successResetPassword = '/success_reset_password';
  static const String successSignup = '/success_signup';
  // static const String checkEmail = 'check_email';
  //Home
  static const String home = '/home';
  static const String itemsPage = '/items_page';
}

List<GetPage<dynamic>>? routes = [
  //Test
  // GetPage(name: AppRoutes.initial, page: () => const TestDataScreen()),
  //
  GetPage(
    name: AppRoutes.initial,
    page: () => const Languages(),
    middlewares: [AppMiddleware()],
  ),
  GetPage(name: AppRoutes.onboarding, page: () => const OnBoarding()),
  //
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signup, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(
      name: AppRoutes.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoutes.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoutes.successSignup, page: () => const SuccessSignUp()),
  //
  GetPage(name: AppRoutes.home, page: () => const HomeScreens()),
  GetPage(name: AppRoutes.itemsPage , page: ()=> const ItemsPage()),
  // GetPage(name: AppRoutes. , page: ()=> const ()),
];
