import 'package:delivery/core/class/statusrequest.dart';
import 'package:delivery/core/function/handlingdata.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/data/datasource/remote/accepted_data.dart';
import 'package:delivery/data/datasource/remote/orderpending_data.dart';
import 'package:delivery/data/model/catmodel.dart';
import 'package:delivery/data/model/ordermodel.dart';
import 'package:get/get.dart';

class AccptedController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AcceptedData ordersData = AcceptedData(Get.find());
  MyServices myServices = Get.find();
  List<orderModel> dataorders = [];

  orderModel? ordermodel;

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

  getordertype(val) {
    if (val == "0") {
      return "Delivery";
    } else if (val == "1") {
      return "Give Directy To Client ";
    }
  }

  getpayementmethod(val) {
    if (val == "0") {
      return "Cash on Delivery";
    } else if (val == "1") {
      return "Payement Card";
    }
  }

  getOrderStatus(val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepared ";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    dataorders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData
        .getDataAccepted(myServices.sharedPreferences.getString("id")!);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        dataorders.addAll(data.map((e) => orderModel.fromJson(e)));
      } else {
        // Get.defaultDialog(
        //   title: "Warning", middleText: "Email or Phone aleardy exists");
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  getDone(String ordersid, usersid) async {
    dataorders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getDone(ordersid, usersid);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // List data = response['data'];
        // dataorders.addAll(data.map((e) => orderModel.fromJson(e)));
        Get.defaultDialog(
            title: "Information",
            middleText: "Done the client get his delivery");
        getOrders();
      } else {
        // Get.defaultDialog(
        //   title: "Warning", middleText: "Email or Phone aleardy exists");
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }
}
