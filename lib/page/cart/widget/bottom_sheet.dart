import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/controller/controller_bottom_nav.dart';
import 'package:test_flutter_app2/controller/controller_cart.dart';
import 'package:test_flutter_app2/custom/button.dart';
import 'package:test_flutter_app2/firebase/authentication.dart';
import 'package:test_flutter_app2/page/order_accepted.dart';
import 'package:test_flutter_app2/page/select_location.dart';

Widget BottomSheetCheck(BuildContext context,int total,ControllerCart data) {

  return Wrap(
    children: [
      Container(
        height: MediaQuery.of(context).size.height*0.63,
        decoration:const BoxDecoration(
            color: Color(0xffF2F3F2),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Checkout',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Gilroy-ExtraBold',
                          fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset('assets/images/cancel1.svg'),
                  )
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffF2F3F2),
                  border: Border.all(color: Color.fromARGB(180, 226, 226, 226))),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Delivery",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff7C7C7C),
                              fontFamily: 'Gilroy-Light',
                              fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SelectLocation(checkIndex: '',));
                        },
                        child: Row(
                          children: [
                            StreamBuilder(
                                stream:FirebaseFirestore.instance
                                    .collection('user')
                                    .doc(AuthenticationHelper().userId)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Text("Loading");
                                  }
                                  if (!snapshot.hasData) {
                                    return Text("Loading");
                                  }
                                  try {
                                    data.userDocument =
                                    snapshot.data as dynamic;
                                    return Text(
                                        '${data.userDocument !["zone"]}, ${data.userDocument !["area"]}',style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontFamily: 'Gilroy-Light',
                                        fontWeight: FontWeight.bold));
                                  } on StateError catch (e) {
                                    return const Text('Thêm địa chỉ',style:  TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontFamily: 'Gilroy-Light',
                                        fontWeight: FontWeight.bold));
                                  }
                                }),
                            Padding(padding: EdgeInsets.only(right: 5)),
                            SvgPicture.asset('assets/images/next.svg')
                          ],
                        ),
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF2F3F2),
                        border: Border.all(color: Color.fromARGB(180, 226, 226, 226))),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Pament",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff7C7C7C),
                              fontFamily: 'Gilroy-Light',
                              fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SelectLocation(checkIndex: '',));
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/images/card.svg'),
                            Padding(padding: EdgeInsets.only(right: 5)),
                            SvgPicture.asset('assets/images/next.svg')
                          ],
                        ),
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF2F3F2),
                        border: Border.all(color: Color.fromARGB(180, 226, 226, 226))),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Promo Code",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff7C7C7C),
                              fontFamily: 'Gilroy-Light',
                              fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SelectLocation(checkIndex: '',));
                        },
                        child: Row(
                          children: [
                            const  Text('Pick discount',style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: 'Gilroy-Light',
                                fontWeight: FontWeight.bold)),
                            Padding(padding: EdgeInsets.only(right: 5)),
                            SvgPicture.asset('assets/images/next.svg')
                          ],
                        ),
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF2F3F2),
                        border: Border.all(color: Color.fromARGB(180, 226, 226, 226))),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Cost",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff7C7C7C),
                              fontFamily: 'Gilroy-Light',
                              fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SelectLocation(checkIndex: '',));
                        },
                        child: Row(
                          children: [
                            Text('\$${total}',style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: 'Gilroy-Light',
                                fontWeight: FontWeight.bold)),
                            Padding(padding: EdgeInsets.only(right: 5)),
                            SvgPicture.asset('assets/images/next.svg')
                          ],
                        ),
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF2F3F2),
                        border: Border.all(color: Color.fromARGB(180, 226, 226, 226))),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  const Text('By placing an order you agree to our',style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff7C7C7C),
                      fontFamily: 'Gilroy-Light',
                      fontWeight: FontWeight.bold)),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  RichText(text: const TextSpan(
                      children: [
                        TextSpan(text: 'Terms',style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Gilroy-Light',
                            fontWeight: FontWeight.bold)),
                        TextSpan(text: 'And',style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff7C7C7C),
                            fontFamily: 'Gilroy-Light',
                            fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Conditions',style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Gilroy-Light',
                            fontWeight: FontWeight.bold))
                      ]
                  )),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Button(name: 'Place Order', ontap: (){
                    if((data.userDocument !["zone"]).toString().length>0 && total>0){
                      data.clear();
                      Get.back();
                      Get.to(()=>OrderAccepted());
                    }else{
                      Get.back();
                      Get.defaultDialog(
                          title: '',
                          contentPadding: EdgeInsets.only(left: 30,right: 30),
                          content: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/image13.png',),
                                  const Padding(padding: EdgeInsets.only(top: 20)),
                                  const Text('Oops! Order Failed',style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontFamily: 'Gilroy-Light',
                                      fontWeight: FontWeight.bold)),
                                  const Padding(padding: EdgeInsets.only(top: 20)),
                                  const Text('Something went tembly wrong.',style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff7C7C7C),
                                      fontFamily: 'Gilroy-Light',
                                      fontWeight: FontWeight.bold)),
                                  const Padding(padding: EdgeInsets.only(top: 30)),
                                  Button(name: 'Please Try Again', ontap: (){
                                    Get.back();
                                  }, context: context, total: total, check: false),
                                  GetBuilder<ControllerNav>(
                                      init: ControllerNav(),
                                      builder: (nav) => TextButton(
                                        onPressed: () {
                                          Get.back();
                                          nav.changeTabIndex(0);
                                        },
                                        child:const Text('Back to home',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontFamily: 'Gilroy-Light',
                                                fontWeight: FontWeight.bold)),
                                      ))
                                ],
                              ),
                              Positioned(
                                  child: InkWell(
                                    onTap: (){
                                      Get.back();
                                    },
                                    child: SvgPicture.asset('assets/images/cancel1.svg'),
                                  ))
                            ],
                          )
                      );
                    }

                  }, context: context, total: total, check: false),
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
