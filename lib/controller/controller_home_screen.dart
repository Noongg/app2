import 'dart:math';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/firebase/authentication.dart';
import 'package:test_flutter_app2/model/vegetables.dart';
import 'package:test_flutter_app2/request_api/request_api.dart';

class ControllerHomeScreen extends GetxController {
  int current = 0;
  final CarouselController controller = CarouselController();
  late Map<String, dynamic> dataSnapshot;

  late Stream<DocumentSnapshot> documentStream;

  List<Vegetables> vegetablesList=<Vegetables>[];

  List<Vegetables> vegetablesListSelling=<Vegetables>[];

  List<Vegetables> vegetablesListMeat=<Vegetables>[];
  int get getCurrent {
    return current;
  }

  onChangedIndex(index, reason) {
    current = index;
    update(["slider"]);
  }

  @override
  void onInit() {
    super.onInit();
    getVegetables();
    documentStream = FirebaseFirestore.instance
        .collection('user')
        .doc(AuthenticationHelper().userId)
        .snapshots();
  }

  void getVegetables() async{
    var vegetables =await RequestApi.getVegetables();
    if(vegetables!=null){
      vegetablesList.addAll(vegetables);
      update();
      listSell();
      listMeat();
    }
  }
  void listSell(){
    vegetablesList.forEach((element) {
      if(element.price<40){
        vegetablesListSelling.add(element);
      }
    });
    update();
  }
  void listMeat(){
    vegetablesList.forEach((element) {
      if(element.category=="Meat & Fish"){
        vegetablesListMeat.add(element);
      }
    });
    update();
  }

  List<Vegetables> listProduct=[];
  void filterProduct(String title){
    listProduct=vegetablesList.where((element) {
      final category=element.category;
      return category.contains(title);
    }).toList();
  }

  TextEditingController textEditingController=TextEditingController();
  List<Vegetables> listVegetable=[];
  void filterVegetable(){
    listVegetable=vegetablesList.where((element) {
      final category=element.title.toLowerCase();
      return category.contains(textEditingController.text.toLowerCase());
    }).toList();
    textEditingController.clear();
  }

}
