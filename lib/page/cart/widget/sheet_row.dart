import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget SheetRow(String title, String custom) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,
          style: const TextStyle(
              fontSize: 18,
              color: Color(0xff7C7C7C),
              fontFamily: 'Gilroy-Light',
              fontWeight: FontWeight.bold)),
      GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Text(custom,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: 'Gilroy-Light',
                    fontWeight: FontWeight.bold)),
            const Padding(padding: EdgeInsets.only(right: 5)),
            SvgPicture.asset('assets/images/next.svg')
          ],
        ),
      )
    ],
  );
}
