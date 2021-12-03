import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/controller/controller_home_screen.dart';
import 'package:test_flutter_app2/custom/search.dart';
import 'package:test_flutter_app2/page/home_page/widget/groceries_item.dart';
import 'package:test_flutter_app2/page/home_page/widget/listview_vegetables.dart';
import 'package:test_flutter_app2/page/home_page/widget/slider_banner.dart';
import 'package:test_flutter_app2/page/home_page/widget/title.dart';
import 'package:test_flutter_app2/router/router.dart';

class HomeScreen extends GetWidget<ControllerHomeScreen> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerHomeScreen>(
        init: ControllerHomeScreen(),
        builder: (data) => Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 25)),
                      SvgPicture.asset('assets/images/carot2.svg'),
                      const Padding(padding: EdgeInsets.only(top: 15)),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SELECTLOCATION, arguments: '');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/local.svg'),
                            Padding(padding: EdgeInsets.only(left: 5)),
                            StreamBuilder(
                                stream: data.documentStream,
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Text("Loading");
                                  }
                                  if (!snapshot.hasData) {
                                    return Text("Loading");
                                  }
                                  try {
                                    var userDocument = snapshot.data as dynamic;
                                    return Text(
                                        '${userDocument!["zone"]}, ${userDocument!["area"]}');
                                  } on StateError catch (e) {
                                    return Text('Thêm địa chỉ');
                                  }
                                })
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 25)),
                      Search(
                          context: context,
                          readOnly: true,
                          showCursor: false,
                          callback: () {
                            Get.toNamed(Routes.SEARCHPAGE);
                          },
                          widthS: 0.85),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      SliderBanner(context: context),
                      Container(
                        child: TitleCategories(title: "Exclusive Offer"),
                        padding: EdgeInsets.only(left: 25, right: 25),
                      ),
                      SizedBox(
                        height: 230,
                        width: MediaQuery.of(context).size.width,
                        child: ListViewVegetables(list: data.vegetablesList),
                      ),
                      Container(
                        child: TitleCategories(title: "Best Selling"),
                        padding: EdgeInsets.only(left: 25, right: 25),
                      ),
                      SizedBox(
                        height: 230,
                        width: MediaQuery.of(context).size.width,
                        child: ListViewVegetables(
                            list: data.vegetablesListSelling),
                      ),
                      Container(
                        child: TitleCategories(title: "Groceries"),
                        padding: EdgeInsets.only(left: 25, right: 25),
                      ),
                      SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          padding: EdgeInsets.only(left: 25),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            GroceriesItem(
                                color: Color(0xffF8A44C),
                                img: 'assets/images/pulses.png',
                                title: 'Pulses'),
                            const Padding(padding: EdgeInsets.only(left: 15)),
                            GroceriesItem(
                                color: Color(0xff53B175),
                                img: 'assets/images/rice.png',
                                title: 'Rice'),
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      SizedBox(
                        height: 230,
                        width: MediaQuery.of(context).size.width,
                        child:
                            ListViewVegetables(list: data.vegetablesListMeat),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                    ],
                  ),
                ),
              ),
            ));
  }
}
