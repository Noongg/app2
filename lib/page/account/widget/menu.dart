import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget Menu({required String img,required String title}){
  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(img),
                const Padding(padding: EdgeInsets.only(right: 20)),
                Text(title,style: const  TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Gilroy-Light',
                    fontWeight: FontWeight.bold))
              ],
            ),SvgPicture.asset('assets/images/next.svg'),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xffE2E2E2))
        ),
      ),
    ],
  );
}