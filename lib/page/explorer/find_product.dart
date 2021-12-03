import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/controller/controller_home_screen.dart';
import 'package:test_flutter_app2/custom/gridview.dart';
import 'package:test_flutter_app2/page/product/product_detail.dart';

class FindProduct extends StatelessWidget {
  FindProduct({Key? key,required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme:const IconThemeData(
            color: Colors.black
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(title,style:const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: 'Gilroy-ExtraBold',
            fontWeight: FontWeight.bold),),
        actions: [
          Row(
            children: [
              SvgPicture.asset('assets/images/Group6839.svg'),
              const Padding(padding: EdgeInsets.only(right: 20))
            ],
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(right: 25, left: 25),
        child: GetBuilder<ControllerHomeScreen>(
          init: ControllerHomeScreen(),
          builder: (filter)=>GridviewItem(filter.listProduct),
        ),
      ),
    );
  }
}
