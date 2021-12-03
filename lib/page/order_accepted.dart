import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/controller/controller_bottom_nav.dart';
import 'package:test_flutter_app2/custom/button.dart';
import 'package:test_flutter_app2/custom/search.dart';
import 'package:test_flutter_app2/page/search/search_page.dart';

class OrderAccepted extends StatelessWidget {
  OrderAccepted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 100)),
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 30)),
                SvgPicture.asset('assets/images/Group6872.svg'),

              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            const Text(
              'Your Order has been\naccepted',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontFamily: 'Gilroy-Light',
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            const Text(
              'Your items has been placcd and is on\nit’s way to being processed',
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff7C7C7C),
                  fontFamily: 'Gilroy-Light',
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.only(top: 150)),
            Button(
                name: 'Track Order',
                ontap: () {},
                context: context,
                total: 10,
                check: false),
            const Padding(padding: EdgeInsets.only(top: 20)),
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
      ),
    );
  }
}
