import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/view/screen/home.dart';
import 'package:delivery/view/screen/homescreen.dart';
import 'package:delivery/view/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomescreenController extends GetxController {
  int currentindex=0;
  Map<String, IconData> mp = {
    "Home": Icons.home,
    "Settings": Icons.settings,
  };

  List list = [
    Home(),
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
