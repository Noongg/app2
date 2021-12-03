import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/model/cart_item.dart';
import 'package:test_flutter_app2/model/vegetables.dart';

class ControllerProductDetail extends GetxController{

  bool down =true;
  double height=60;
  double heightimg=10;
  double widthimg=8;
  String img='assets/images/down.svg';

  Color colors=Color(0xffF3603F);

  int quantity=1;

  double rating=0;

  void upDateDown(){
    if(down==true){
      down=false;
      height=0;
      heightimg=22;
      widthimg=8;
      img='assets/images/up.svg';
      update();
    }else{
      down =true;
      height=60;
      heightimg=10;
      widthimg=8;
      img='assets/images/down.svg';
      update();
    }
  }

  void decrement(){
    if(quantity==1){
      Get.back();
    }else{
      quantity--;
    }
    update();
  }
  void increment(){
    quantity++;
    update();
  }

  void resetQuantity(){
    quantity=1;
    update();
  }

}