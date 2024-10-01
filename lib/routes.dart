import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/middleware/mymiddleware.dart';
import 'package:delivery/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:delivery/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:delivery/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:delivery/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:delivery/view/screen/auth/login.dart';
import 'package:delivery/view/screen/homescreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? getPages = [
// GetPage(name: "/", page: () => Onborading(),middlewares: [Mymiddleware()]),
 // GetPage(name: AppRoutes.cart, page: () => Cart()),
 // GetPage(name: AppRoutes.productdetails, page: () => Productdetails()),
 //  GetPage(name: "/", page: () => Test()),
  GetPage(name: "/", page: () => Login(),middlewares: [Mymiddleware()]),
   GetPage(name: AppRoutes.forgetpassword, page: () => Forgetpassword()),
  GetPage(name: AppRoutes.resetpassword, page: () => Resetpassword()),
  GetPage(
      name: AppRoutes.successresetpassword, page: () => SuccessResetpassword()),
  GetPage(name: AppRoutes.home, page: () => Homescreen()),
  GetPage(name: AppRoutes.verifycode, page: () => Verifycode()),
  

];
