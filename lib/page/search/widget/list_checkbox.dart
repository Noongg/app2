import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/controller/controller_checkbox.dart';

Widget ListCheckBox(BuildContext context,Map<String, bool> values) {
  return GetBuilder<ControllerCheckBox>(
      init: ControllerCheckBox(),
      builder: (ck) => ListView(
        children: values.keys.map((String key) {
          return CheckboxListTile(
            contentPadding: EdgeInsets.only(left: 0,right: 0),
            controlAffinity: ListTileControlAffinity.leading,
            title: values[key]==true?Text(key,
              style:const TextStyle(
                  fontSize: 16,
                  color: Color(0xff53B175),
                  fontFamily:
                  'Gilroy-Light',
                  fontWeight: FontWeight.bold),):Text(key,
              style:const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily:
                  'Gilroy-Light',
                  fontWeight: FontWeight.bold),),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            value: values[key],
            activeColor: Color(0xff53B175),
            checkColor: Colors.white,
            onChanged: (value) {
              values[key]=value!;
              ck.update();
            },
          );
        }).toList(),
      ));
}
