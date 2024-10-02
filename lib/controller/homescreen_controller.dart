import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/view/screen/accepted.dart';
import 'package:delivery/view/screen/home.dart';
import 'package:delivery/view/screen/homescreen.dart';
import 'package:delivery/view/screen/order/orders.dart';
import 'package:delivery/view/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomescreenController extends GetxController {
  int currentindex=0;
  Map<String, IconData> mp = {
    "Pending": Icons.pending,
    "Accepted": Icons.shopping_bag_outlined,
    "Settings": Icons.settings,
  };

  List list = [
    Orders(),
    Accepted(),
    Setting(),
  ];

  changeColor(currentindex, i){
    return currentindex==i?AppColor.primaycolor:AppColor.black;
  }

  changePage(i){
    currentindex=i;
    update();
  }

  


}
