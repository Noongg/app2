import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/controller/controller_bottom_nav.dart';
import 'package:test_flutter_app2/page/account/account.dart';
import 'package:test_flutter_app2/page/cart/cart.dart';
import 'package:test_flutter_app2/page/explorer/explorer.dart';
import 'package:test_flutter_app2/page/favourite/favourite.dart';
import 'package:test_flutter_app2/page/home_page/home_screen.dart';

class BottomNav extends GetView<ControllerNav> {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerNav>(
        init: ControllerNav(),
        builder: (data) => Scaffold(

              body: IndexedStack(
                index: data.currentIndex,
                children: [
                  HomeScreen(), //0
                  Explorer(), //1
                  Cart(),
                  Favourite(),
                  Account()//2
                ],
              ),
              bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, 1.00), //(x,y)
                          blurRadius: 4.00,
                          color: Colors.grey,
                          spreadRadius: 1.00),
                    ],
                  
                  ),

                child: BottomNavigationBar(
                  elevation: 0,

                  currentIndex: data.currentIndex,
                  onTap: (index) {
                    data.changeTabIndex(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/images/home.svg'),
                      label: 'Home',
                      activeIcon: SvgPicture.asset('assets/images/home.svg',color: Color(0xff53B175),),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/images/explore.svg'),
                      label: 'Explore',
                      activeIcon: SvgPicture.asset('assets/images/explore.svg',color: Color(0xff53B175),),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/images/cart.svg'),
                      label: 'Cart',
                      activeIcon: SvgPicture.asset('assets/images/cart.svg',color: Color(0xff53B175),),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/images/favourite.svg'),
                      label: 'Favourite',
                      activeIcon: SvgPicture.asset('assets/images/favourite.svg',color: Color(0xff53B175),),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/images/account.svg'),
                      label: 'Account',
                      activeIcon: SvgPicture.asset('assets/images/account.svg',color: Color(0xff53B175),),
                    ),
                  ],
                  backgroundColor: Colors.transparent,
                  selectedItemColor: Color(0xff53B175),
                  showUnselectedLabels: true,
                  selectedFontSize: 12,
                  unselectedItemColor: Colors.black,
                  showSelectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                ),
              ),
            ));
  }
}
