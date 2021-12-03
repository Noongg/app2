import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget DividerPading() {
  return Column(
    children: const [
      Padding(padding: EdgeInsets.only(top: 20)),
      Divider(),
      Padding(padding: EdgeInsets.only(top: 20)),
    ],
  );
}
