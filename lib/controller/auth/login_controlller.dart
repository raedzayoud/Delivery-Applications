
import 'package:delivery/core/class/statusrequest.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/function/handlingdata.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/data/datasource/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginControlller extends GetxController {
  Login();
  goToForgetPassword();
}

class LoginControlllerImp extends LoginControlller {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices services = Get.find();
  LoginData loginData = LoginData(Get.find());
  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  Login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(password.text, email.text);
      if (response == null) {
        statusRequest = StatusRequest.failed;
      }
      statusRequest = HandleData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          if (response['data']['delivery_appreove'].toString() == "1") {
            services.sharedPreferences
                .setString("id", response['data']['delivery_id'].toString());
            services.sharedPreferences
                .setString("username", response['data']['delivery_name']);
            services.sharedPreferences
                .setString("email", response['data']['delivery_email']);
            services.sharedPreferences
                .setString("phone", response['data']['user_phone'].toString());
            services.sharedPreferences
                .setString("age", response['data']['delivery_age'].toString());
            services.sharedPreferences.setString("step", "2");
            // FirebaseMessaging.instance.subscribeToTopic("users");
            // FirebaseMessaging.instance.subscribeToTopic(
            //     "users${services.sharedPreferences.getString("id")}");
             Get.offNamed(AppRoutes.home);
           // print("users${services.sharedPreferences.getString("id")}");
          } else {
            Get.snackbar(
              "Email Verification Required",
              "Please verify your email before proceeding. You will be redirected to the verification code check.",
              snackPosition:
                  SnackPosition.BOTTOM, // Optional: Adjust the position
              backgroundColor:
                  Colors.black, // Optional: Customize the background color
              colorText: Colors.white, // Optional: Customize the text color
              duration: Duration(seconds: 7), // Add duration for the Snackbar
              margin: EdgeInsets.all(10),
            );

            Get.offAllNamed(AppRoutes.verifycode,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Email or Password is not correct ! ");
          statusRequest = StatusRequest.failed;
        }
      }
      update();
    } else {}
  }

  

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print("-----------------------------------------------------------");
    //   print(value);
    // });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetpassword);
  }
}
