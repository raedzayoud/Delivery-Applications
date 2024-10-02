import 'package:delivery/controller/accpted_controller.dart';
import 'package:delivery/controller/orders_controller.dart';
import 'package:delivery/core/class/handlingdataview.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/view/widget/order/cardorder.dart';
import 'package:delivery/view/widget/order/cartorderaccepted.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Accepted extends StatelessWidget {
  const Accepted({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AccptedController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Accepted Orders"),
          centerTitle: true,
        ),
        body: Container(
            color: AppColor.white,
            child: GetBuilder<AccptedController>(
                builder: (conttoller) => Handlingdataview(
                      statusRequest: conttoller.statusRequest,
                      widget: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          color: AppColor.white,
                          child: ListView.builder(
                              itemCount: conttoller.dataorders.length,
                              itemBuilder: (context, index) {
                                return Cartorderaccepted(
                                    ordermodel: conttoller.dataorders[index]);
                              })),
                    ))));
  }
}