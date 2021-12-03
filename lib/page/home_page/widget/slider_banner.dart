import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/controller/controller_home_screen.dart';

Widget SliderBanner({required BuildContext context}) {
  final List<String> imageList = [
    "https://mayfoods.vn/wp-content/uploads/2017/11/Banner-raucu-2.jpg",
    "https://file.hstatic.net/200000189007/file/rau_khc_banner_70debca12e734f5ca2bd3365178c22a7.jpg",
    "https://png.pngtree.com/thumb_back/fw800/back_our/20190620/ourmid/pngtree-fresh-and-simple-fruit-and-vegetable-cuisine-banner-image_171536.jpg",
    "https://www.bigc.vn/files/banners/2021/jun-21/nongsanxanh-1080x540-bigc-cover-blog.png"
  ];
  return GetBuilder<ControllerHomeScreen>(
      init: ControllerHomeScreen(),
      id: "slider",
      builder: (data) => Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: 120,
                width: MediaQuery.of(context).size.width * 0.85,
                child: CarouselSlider(
                  options: CarouselOptions(
                      onPageChanged: data.onChangedIndex,
                      viewportFraction: 1.0,
                      aspectRatio: 16 / 9,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      autoPlay: true),
                  items: imageList
                      .map((e) => ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              e,
                              fit: BoxFit.cover,
                              height: 120,
                              width: MediaQuery.of(context).size.width * 0.85,
                            ),
                          ))
                      .toList(),
                ),
              ),
              Positioned(
                  top: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.map((e) {
                      int index = imageList.indexOf(e);
                      return Container(
                        width: 8,
                        height: 8,
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: data.getCurrent == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4)),
                      );
                    }).toList(),
                  ))
            ],
          ));
}
