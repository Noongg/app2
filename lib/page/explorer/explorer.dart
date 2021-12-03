import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/controller/controller_home_screen.dart';
import 'package:test_flutter_app2/custom/search.dart';
import 'package:test_flutter_app2/page/explorer/find_product.dart';
import 'package:test_flutter_app2/page/explorer/widget/category_item.dart';
import 'package:test_flutter_app2/page/search/search_page.dart';

class Explorer extends StatelessWidget {
  const Explorer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerHomeScreen>(
      init: ControllerHomeScreen(),
      builder: (data) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('Find Products',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Gilroy-ExtraBold',
                  fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(right: 25, left: 25),
            child: Column(
              children: [
                Center(
                  child: Search(
                      context: context,
                      showCursor: false,
                      readOnly: true,
                      callback: () {
                        Get.to(SearchPage());
                      },
                      widthS: 0.85),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryItem(
                      callback: () {
                        data.filterProduct('Fresh Fruits & Vegetable');
                        Get.to(() => FindProduct(
                              title: 'Fresh Fruits & Vegetable',
                            ));
                      },
                      img: 'assets/images/1.png',
                      title: 'Fresh Fruits\n& Vegetable',
                      color: Color.fromARGB(25, 83, 177, 117),
                      colorBorder: Color.fromARGB(180, 83, 177, 117),
                    ),
                    CategoryItem(
                      callback: () {
                        data.filterProduct('Cooking Oil & Ghee');
                        Get.to(() => FindProduct(
                              title: 'Cooking Oil & Ghee',
                            ));
                      },
                      img: 'assets/images/2.png',
                      title: 'Cooking Oil\n& Ghee',
                      color: Color.fromARGB(25, 248, 164, 76),
                      colorBorder: Color.fromARGB(180, 248, 164, 76),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryItem(
                      callback: () {
                        data.filterProduct('Meat & Fish');
                        Get.to(() => FindProduct(
                              title: 'Meat & Fish',
                            ));
                      },
                      img: 'assets/images/3.png',
                      title: 'Meat & Fish',
                      color: Color.fromARGB(64, 247, 165, 147),
                      colorBorder: Color(0xffF7A59),
                    ),
                    CategoryItem(
                      callback: () {
                        data.filterProduct('Bakery & Snacks');
                        Get.to(() => FindProduct(
                              title: 'Bakery & Snacks',
                            ));
                      },
                      img: 'assets/images/4.png',
                      title: 'Bakery & Snacks',
                      color: Color.fromARGB(63, 211, 176, 224),
                      colorBorder: Color(0xffD3B0E0),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryItem(
                      callback: () {
                        data.filterProduct('Dairy & Eggs');
                        Get.to(() => FindProduct(
                              title: 'Dairy & Eggs',
                            ));
                      },
                      img: 'assets/images/5.png',
                      title: 'Dairy & Eggs',
                      color: Color.fromARGB(63, 253, 229, 152),
                      colorBorder: Color(0xffFDE598),
                    ),
                    CategoryItem(
                      callback: () {
                        data.filterProduct('Beverages');
                        Get.to(() => FindProduct(
                              title: 'Beverages',
                            ));
                      },
                      img: 'assets/images/6.png',
                      title: 'Beverages',
                      color: Color.fromARGB(63, 183, 223, 245),
                      colorBorder: Color(0xffB7DFF5),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
