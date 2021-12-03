import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/controller/controller_home_screen.dart';
import 'package:test_flutter_app2/model/vegetables.dart';
import 'package:test_flutter_app2/page/product/product_detail.dart';
import 'package:test_flutter_app2/router/router.dart';

Widget ListViewVegetables({required List<Vegetables> list}){
  return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            Get.toNamed(Routes.PRODUCTDETAIL,arguments: {"vegetables": list[index]});
          },
          child: Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1,color: Color(0xffE2E2E2))
            ),
            height: 230,
            width: 150,
            child: Container(
              padding: const EdgeInsets.only(top: 20,right: 10,left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(list[index].img,height: 80,width: 90,fit: BoxFit.cover,),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Text(list[index].title,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Gilroy-Light',
                          fontWeight: FontWeight.bold)),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  Text("${list[index].unit}, Priceg",
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff7C7C7C),
                          fontFamily: 'Gilroy-Light',
                          fontWeight: FontWeight.bold)),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${list[index].price}',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Gilroy-Light',
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 45,
                        width: 45,
                        child: SvgPicture.asset('assets/images/add.svg'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}