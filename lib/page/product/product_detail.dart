import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/controller/controller_bottom_nav.dart';
import 'package:test_flutter_app2/controller/controller_cart.dart';
import 'package:test_flutter_app2/controller/controller_favourite.dart';
import 'package:test_flutter_app2/controller/controller_product_detail.dart';
import 'package:test_flutter_app2/custom/button.dart';
import 'package:test_flutter_app2/model/vegetables.dart';
import 'package:test_flutter_app2/page/product/widget/rating.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key}) : super(key: key);
  var vegetables=Get.arguments['vegetables'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xffF2F3F2),
        elevation: 0,
        actions: [
          Row(
            children: [
              SvgPicture.asset('assets/images/Vector.svg'),
              const Padding(padding: EdgeInsets.only(right: 20))
            ],
          )
        ],
      ),
      body: GetBuilder<ControllerProductDetail>(
        init: ControllerProductDetail(),
        builder: (data) => Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                    color: Color(0xffF2F3F2),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Image.network(
                      vegetables.img,
                      height: 200,
                      fit: BoxFit.cover,
                      width: 300,
                    )
                  ],
                )),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(vegetables.title,
                            style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontFamily: 'Gilroy-ExtraBold',
                                fontWeight: FontWeight.bold)),
                        GetBuilder<ControllerFavorite>(
                            init: ControllerFavorite(),
                            builder: (fav) => InkWell(
                                onTap: () {
                                  if(fav.itemsFavourite.containsKey(int.parse(vegetables.id))){
                                    fav.removeitem(
                                        int.parse(vegetables.id));
                                    fav.update();
                                  }
                                  else {
                                    fav.addItem(
                                        productId:
                                        int.parse(vegetables.id),
                                        price: vegetables.price,
                                        title: vegetables.title,
                                        unit: vegetables.unit,
                                        imageUrl: vegetables.img,
                                        id: vegetables.id,
                                        description:
                                        vegetables.description,
                                        category: vegetables.category,
                                        review: vegetables.review);

                                    fav.update();
                                  }
                                },
                                child: fav.itemsFavourite.containsKey(int.parse(vegetables.id))?
                                SvgPicture.asset('assets/images/tim.svg',width: 24,height: 24,color: Colors.red,):
                                SvgPicture.asset('assets/images/tim.svg',width: 24,height: 24,)
                            ))
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    Text("${vegetables.unit}, Priceg",
                        style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff7C7C7C),
                            fontFamily: 'Gilroy-Light',
                            fontWeight: FontWeight.bold)),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              child: SizedBox(
                                child: SvgPicture.asset(
                                    'assets/images/tru.svg'),
                                height: 25,
                                width: 25,
                              ),
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                data.decrement();
                              },
                            ),
                            const Padding(
                                padding: EdgeInsets.only(right: 10)),
                            Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(17),
                                    border: Border.all(
                                        color: Color(0xffE2E2E2),
                                        width: 1)),
                                child: Center(
                                  child: Text("${data.quantity}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff181725),
                                          fontFamily: 'Gilroy-Light',
                                          fontWeight: FontWeight.bold)),
                                )),
                            const Padding(
                                padding: EdgeInsets.only(left: 10)),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: SizedBox(
                                child: SvgPicture.asset(
                                    'assets/images/cong.svg'),
                                height: 25,
                                width: 25,
                              ),
                              onTap: () {
                                data.increment();
                              },
                            )
                          ],
                        ),
                        Text('\$${vegetables.price}',
                            style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontFamily: 'Gilroy-ExtraBold',
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Color(0xffE2E2E2))),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Product Detail",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff181725),
                                fontFamily: 'Gilroy-Light',
                                fontWeight: FontWeight.bold)),
                        InkWell(
                          onTap: () {
                            data.upDateDown();
                          },
                          child: SvgPicture.asset(
                            data.img,
                            height: data.heightimg,
                            width: data.widthimg,
                          ),
                        )
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    SizedBox(
                      height: data.height,
                      child: Text("${vegetables.description}",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              height: 1.4,
                              fontSize: 13,
                              color: Color(0xff7C7C7C),
                              fontFamily: 'Gilroy-Light',
                              fontWeight: FontWeight.bold)),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 15)),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Color(0xffE2E2E2))),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Nutritions",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff181725),
                                fontFamily: 'Gilroy-Light',
                                fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Container(
                              child: const Center(
                                child: Text("100gr",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xff7C7C7C),
                                        fontFamily: 'Gilroy-Light',
                                        fontWeight: FontWeight.bold)),
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xffEBEBEB),
                                  borderRadius: BorderRadius.circular(5)),
                              width: 33,
                              height: 18,
                            ),
                            const Padding(
                                padding: EdgeInsets.only(right: 20)),
                            SvgPicture.asset('assets/images/next.svg')
                          ],
                        )
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 15)),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Color(0xffE2E2E2))),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Review",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff181725),
                                fontFamily: 'Gilroy-Light',
                                fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            StarRating(
                                rating: double.parse(vegetables.review),
                                onRatingChanged: (rating) {
                                  data.rating = rating;
                                },
                                color: data.colors),
                            const Padding(
                                padding: EdgeInsets.only(right: 5)),
                            Text("${vegetables.review}",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff181725),
                                    fontFamily: 'Gilroy-Light',
                                    fontWeight: FontWeight.bold)),
                            const Padding(
                                padding: EdgeInsets.only(right: 20)),
                            SvgPicture.asset('assets/images/next.svg')
                          ],
                        )
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 15)),
                    GetBuilder<ControllerNav>(
                        init: ControllerNav(),
                        builder: (nav) => GetBuilder<ControllerCart>(
                            init: ControllerCart(),
                            builder: (cart)=>Button(
                            name: 'Add To Basket',
                            ontap: () {
                              cart.addItem(
                                  int.parse(vegetables.id),
                                  vegetables.price,
                                  vegetables.title,
                                  vegetables.unit,
                                  data.quantity,
                                  vegetables.img,
                                  vegetables.id);
                              Get.back();
                              nav.changeTabIndex(2);
                              data.resetQuantity();
                            },
                            context: context,
                            check: false,
                            total: 10)))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
