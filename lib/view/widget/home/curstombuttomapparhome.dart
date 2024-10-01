import 'package:delivery/controller/homescreen_controller.dart';
import 'package:delivery/view/widget/home/custombuttomappar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Curstombuttomapparhome extends GetView<HomescreenController> {
  const Curstombuttomapparhome({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      // shape: CircularNotchedRectangle(),
      // notchMargin: 10,
       child: SingleChildScrollView(
      
        child: Row(
          children: [
            ...List.generate(controller.list.length, (index) {
              int i = index;
              return Expanded(
                  child: Custombuttomappar(
                textappar: controller.mp.keys.elementAt(i),
                iconData: controller.mp[controller.mp.keys.elementAt(i)]!,
                color: controller.changeColor(controller.currentindex, i),
                onPressed: () {
                  controller.changePage(i);
                },
              ));
            }),
          ],
        ),
      ),
    );
  }
}
