
import 'package:flutter/material.dart';

Widget Button( {required String name,required VoidCallback? ontap,required  BuildContext context,required int total,required bool check}) {
  return Stack(
    alignment: Alignment.centerRight,
    children: [
      ElevatedButton(
        onPressed: (){
          ontap!.call();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width*0.85, 67),
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(
                  20)),
          primary: Color.fromARGB(255, 83, 177, 117),
        ),
        child: Text('${name}',style: TextStyle(
            fontSize: 18,color: Colors.white,fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
        ),),),
      check==true?Positioned(
          right: 20,
          child: Container(
            child:Center(
              child: Text("\$${total}",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: 'Gilroy-Light',
                      fontWeight: FontWeight.bold)),
            ),
            decoration: BoxDecoration(
                color: Color(0xff489E67),
                borderRadius: BorderRadius.circular(5)
            ),
            width: 43,
            height: 22,
          ),):Positioned(child: Text(''))
    ],
  );
}
