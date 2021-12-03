import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget GroceriesItem({required Color color,required String img,required String title}){
  return Container(
    width: 250,
    height: 100,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(15)
    ),
    child: Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 20)),
        Image.asset(img,height: 71,width: 71,),
        const Padding(padding: EdgeInsets.only(left: 10)),

        Text(title,
            style:const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'Gilroy-Light',
                fontWeight: FontWeight.bold)),
      ],
    ),
  );
}