import 'package:delivery/core/class/statusrequest.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/function/handlingdata.dart';
import 'package:delivery/data/datasource/remote/forgetpassword/checkemail_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetpasswordController extends GetxController {
  Checkemail();
}

class ForgetpasswordControllerImp extends ForgetpasswordController {
  TextEditingController? email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest=StatusRequest.none;
  CheckemailData checkemailData = CheckemailData(Get.find());

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  Checkemail() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkemailData.postData(email!.text);
      if (response == null) {
        statusRequest = StatusRequest.failed;
      }
      statusRequest = HandleData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed(AppRoutes.verifycode,
              arguments: {"email": email!.text});
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Email is not found  ! ");
          statusRequest = StatusRequest.failed;
        }
      }
      update();
    } else {}
  }
}
