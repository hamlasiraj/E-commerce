import 'package:get/get.dart';
import 'package:store/Core/Constant/routes.dart';
import 'package:store/Core/MiddleWare/mymiddleware.dart';
import 'package:store/View/Screen/ForgetPassword/reset_password.dart';
import 'package:store/View/Screen/auth/signup.dart';
import 'package:store/View/Screen/ForgetPassword/verify_code.dart';
import 'package:store/View/Screen/auth/verify_email.dart';
import 'package:store/View/Screen/home.dart';
import 'package:store/View/Screen/language.dart';
import 'package:store/View/Screen/on_bording.dart';
import 'View/Screen/ForgetPassword/forgetpassword.dart';
import 'View/Screen/auth/singin_login.dart';
import 'View/Screen/ForgetPassword/success_resetpassword.dart';
import 'View/Screen/auth/success_signup.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleware()]),
  GetPage(name: AppRoutes.signup, page: () => const SignUp()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoutes.signin, page: () => const SignIn()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoutes.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoutes.onBording, page: () => const OnBording()),
  GetPage(name: AppRoutes.verifyEmail, page: () => const VerifyEmail()),
  GetPage(name: AppRoutes.home, page: () => const Home()),
];
