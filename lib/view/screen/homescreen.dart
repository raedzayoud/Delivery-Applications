import 'package:delivery/controller/homescreen_controller.dart';
import 'package:delivery/view/widget/home/curstombuttomapparhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreenController());
    return GetBuilder<HomescreenController>(
        builder: (controller) => Scaffold(
              bottomNavigationBar: Curstombuttomapparhome(),
              body: controller.list.elementAt(controller.currentindex),
            ));
  }
}