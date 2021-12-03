import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget CategoryItem({required VoidCallback callback,required String img,required String title,required Color color,required Color colorBorder}){
  return GestureDetector(
    onTap: (){
      callback.call();
    },
    child: Container(
      height: 170,
      width: 145,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: color,
          border: Border.all(width: 1,color: colorBorder)
      ),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 20)),
          Image.asset(img,width: 115,height: 75,fit: BoxFit.contain,),
          const Padding(padding: EdgeInsets.only(top: 20)),
          Text(title,style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: 'Gilroy-ExtraBold',
              fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
        ],
      ),
    ),
  );
}