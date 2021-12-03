import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/controller/controller_home_screen.dart';

Widget Search(
    {required BuildContext context,
    required bool showCursor,
    required bool readOnly,
    required VoidCallback callback,
    required double widthS}) {
  return GetBuilder<ControllerHomeScreen>(
      init: ControllerHomeScreen(),
      builder: (search) => TextField(
            controller: search.textEditingController,
            onTap: () {
              callback.call();
            },
            showCursor: showCursor,
            readOnly: readOnly,
            decoration: InputDecoration(
              hintText: 'Search Store',
              prefixIcon: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: SvgPicture.asset('assets/images/search.svg'),
              ),
              constraints: BoxConstraints(
                maxHeight: 56,
                maxWidth: MediaQuery.of(context).size.width * widthS,
              ),
              prefixIconConstraints:
                  const BoxConstraints(maxHeight: 40, maxWidth: 40),
              hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff7C7C7C),
                  fontFamily: 'Gilroy-Light',
                  fontWeight: FontWeight.bold),
              filled: true,
              fillColor: const Color(0xffF2F3F2),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                borderSide: BorderSide(color: Color(0xffF2F3F2), width: 0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                borderSide: BorderSide(color: Color(0xffF2F3F2), width: 0),
              ),
            ),
          ));
}
