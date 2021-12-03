import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/custom/button.dart';
import 'package:test_flutter_app2/page/login.dart';
import 'package:test_flutter_app2/page/sign_in.dart';
class OnBording extends StatelessWidget {
  const OnBording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/people.png'),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.5 )),
              Image.asset('assets/images/carot.png'),
              const Padding(padding: EdgeInsets.only(top: 10)),
              const Text('Welcome\nto our store',style: TextStyle(
                fontSize: 48,color: Colors.white,fontFamily: 'Gilroy-Light'
              ),textAlign: TextAlign.center,),
              const Padding(padding: EdgeInsets.only(top: 10)),
              const Text('Ger your groceries in as fast as one hour',style: TextStyle(
                  fontSize: 16,color: Color.fromARGB(150, 252, 252, 252),fontFamily: 'Gilroy-Light'
              ),),
              const Padding(padding: EdgeInsets.only(top: 30)),
              Button(name: 'Get Started', ontap: (){Get.to(()=>SignIn());}, context: context,check: false,total: 10)
            ],
          ),
        ),
      ),
    );
  }
}
