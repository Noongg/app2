import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/controller/controller_cart.dart';
import 'package:test_flutter_app2/custom/button.dart';
import 'package:test_flutter_app2/page/cart/widget/bottom_sheet.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerCart>(
        init: ControllerCart(),
        builder: (data) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0.5,
                title: const Text('My Cart',
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
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffE2E2E2))),
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: ListView.separated(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemCount: data.itemCount,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            child: Row(
                              children: [
                                Image.network(
                                  '${data.items.values.toList()[index].imageUrl}',
                                  width: 70,
                                  height: 65,
                                  fit: BoxFit.cover,
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(right: 30)),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              data.items.values
                                                  .toList()[index]
                                                  .title,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontFamily:
                                                      'Gilroy-ExtraBold',
                                                  fontWeight: FontWeight.bold)),
                                          GestureDetector(
                                            onTap: () {
                                              data.removeitem(int.parse(data
                                                  .items.values
                                                  .toList()[index]
                                                  .id));
                                            },
                                            child: SvgPicture.asset(
                                                'assets/images/cancel.svg'),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(right: 5)),
                                      Text(
                                          "${data.items.values.toList()[index].unit}, Priceg",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff7C7C7C),
                                              fontFamily: 'Gilroy-Light',
                                              fontWeight: FontWeight.bold)),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 15)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  data.decrement(index);
                                                },
                                                child: SvgPicture.asset(
                                                  'assets/images/tru1.svg',
                                                  height: 45,
                                                  width: 45,
                                                ),
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5)),
                                              Text(
                                                  '${data.items.values.toList()[index].quantity}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontFamily:
                                                          'Gilroy-ExtraBold',
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5)),
                                              GestureDetector(
                                                onTap: () {
                                                  data.increment(index);
                                                },
                                                child: SvgPicture.asset(
                                                    'assets/images/cong1.svg',
                                                    height: 45,
                                                    width: 45),
                                              )
                                            ],
                                          ),
                                          Text(
                                              '\$${data.items.values.toList()[index].price}',
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontFamily: 'Gilroy-Light',
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  Positioned(
                      bottom: -35,
                      child: Button(
                          name: 'Go to Checkout',
                          ontap: () {
                            Get.bottomSheet(
                                BottomSheetCheck(context, data.totalItem, data),
                                isScrollControlled: true);
                          },
                          context: context,
                          check: true,
                          total: data.totalItem))
                ],
              ),
            ));
  }
}
