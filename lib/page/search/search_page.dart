import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/controller/controller_home_screen.dart';
import 'package:test_flutter_app2/custom/gridview.dart';
import 'package:test_flutter_app2/custom/search.dart';
import 'package:test_flutter_app2/page/search/filter_page.dart';
class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerHomeScreen>(
        init: ControllerHomeScreen(),
        builder: (search){
          search.filterVegetable();
         return Scaffold(
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.only(right: 20,left: 20,top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Search(context: context, showCursor: true, readOnly: false, callback: (){
                        },widthS: 0.8),
                        GestureDetector(
                          onTap: (){
                            Get.to(()=>FilterPage());
                          },
                          child: SvgPicture.asset('assets/images/Group6839.svg'),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Expanded(child: GridviewItem(search.listVegetable))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
