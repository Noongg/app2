import 'package:flutter/material.dart';

Widget TitleCategories({required String title}){
  return Column(
    children: [
      const Padding(padding: EdgeInsets.only(top: 25)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontFamily: 'Gilroy-Light',
                  fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: () {},
            child: const Text('See all',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff53B175),
                    fontFamily: 'Gilroy-Light')),
          )
        ],
      ),
      const Padding(padding: EdgeInsets.only(top: 25)),
    ],
  );
}