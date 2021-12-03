import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/controller/controller_bottom_nav.dart';
import 'package:test_flutter_app2/controller/controller_cart.dart';
import 'package:test_flutter_app2/controller/controller_favourite.dart';
import 'package:test_flutter_app2/custom/button.dart';
import 'package:test_flutter_app2/router/router.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerFavorite>(
        init: ControllerFavorite(),
        builder: (fav) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0.5,
                title: const Text('Favorurite',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'Gilroy-ExtraBold',
                        fontWeight: FontWeight.bold)),
              ),
              body: Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemCount: fav.itemCount,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed(Routes.PRODUCTDETAIL, arguments: {
                                "vegetables":
                                    fav.itemsFavourite.values.toList()[index]
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      '${fav.itemsFavourite.values.toList()[index].img}',
                                      width: 70,
                                      height: 64,
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 30)),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          fav.itemsFavourite.values
                                              .toList()[index]
                                              .title,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontFamily: 'Gilroy-ExtraBold',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5)),
                                        Text(
                                            "${fav.itemsFavourite.values.toList()[index].unit}, Priceg",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff7C7C7C),
                                                fontFamily: 'Gilroy-Light',
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\$${fav.itemsFavourite.values.toList()[index].price}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontFamily: 'Gilroy-ExtraBold',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    SvgPicture.asset('assets/images/next.svg')
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  Positioned(
                      bottom: 20,
                      child: GetBuilder<ControllerCart>(
                          init: ControllerCart(),
                          builder: (cart) => Button(
                              name: 'Add All To Cart',
                              ontap: () {
                                fav.itemsFavourite.values
                                    .toList()
                                    .forEach((element) {
                                  cart.addItem(
                                      int.parse(element.id),
                                      element.price,
                                      element.title,
                                      element.unit,
                                      1,
                                      element.img,
                                      element.id);
                                });
                                ControllerNav back = Get.find();
                                back.changeTabIndex(2);
                              },
                              context: context,
                              check: false,
                              total: 10)))
                ],
              ),
            ));
  }
}
