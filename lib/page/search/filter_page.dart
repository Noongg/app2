import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/controller/controller_checkbox.dart';
import 'package:test_flutter_app2/controller/controller_home_screen.dart';
import 'package:test_flutter_app2/custom/button.dart';
import 'package:test_flutter_app2/page/search/search_page.dart';
import 'package:test_flutter_app2/page/search/widget/list_checkbox.dart';
class FilterPage extends StatelessWidget {
  FilterPage({Key? key}) : super(key: key);
  ControllerHomeScreen homeScreen =ControllerHomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme:const IconThemeData(
            color: Colors.black
        ),
        leading: IconButton(
          icon: SvgPicture.asset('assets/images/cancel1.svg',height: 15,width: 15,),
          onPressed: (){
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title:const Text('Filters',style:TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: 'Gilroy-ExtraBold',
            fontWeight: FontWeight.bold),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 10),
        decoration:const BoxDecoration(
          color: Color(0xffF2F3F2),
          borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
        ),
        padding: EdgeInsets.only(left: 20,right: 20,top: 30),
        child: GetBuilder<ControllerCheckBox>(
          init: ControllerCheckBox(),
          builder: (ck)=>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily:
                    'Gilroy-Light',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                child: ListCheckBox(context,ck.values),
                height: 250,
                width: MediaQuery.of(context).size.width,
              ),
              const Text(
                'Brand',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily:
                    'Gilroy-Light',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                child: ListCheckBox(context,ck.values2),
                height: 250,
                width: MediaQuery.of(context).size.width,
              ),
              Button(name: 'Apply Filter', ontap: (){
                ck.getCheckboxItems();
                homeScreen.textEditingController.text=ck.tmpArray.first;
                Get.back();
              }, context: context, total: 10, check: false)
            ],
          ),
        )
      ),
    );
  }
}
