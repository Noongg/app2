import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/controller/controller_verification.dart';
import 'package:test_flutter_app2/firebase/authentication.dart';
import 'package:test_flutter_app2/page/home_page/home_screen.dart';
import 'package:test_flutter_app2/page/login_email/login.dart';
import 'package:test_flutter_app2/page/select_location.dart';

class Verification extends GetView<ControllerVerification>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerVerification>(
        init: ControllerVerification(),
        builder: (data)=>
            Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  iconTheme: IconThemeData(
                      color: Colors.black
                  ),
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  title: Text(''),
                ),
                body: Container(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 40)),
                      const Text('Enter your 4-digit code',style: TextStyle(
                          fontSize: 26,color: Colors.black,fontFamily: 'Gilroy-Light',fontWeight: FontWeight.w500
                      ),),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      const Text('Code',style: TextStyle(
                          fontSize: 16,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.w500
                      ),),
                      TextField(
                        controller: data.controllerCode,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '- - - -',
                          hintStyle: TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ),
                       Expanded(child: Align(
                        alignment: Alignment.bottomLeft,
                        child: GestureDetector(
                          onTap: (){
                            data.verifyPhone(data.phone);
                          },
                          child: Text('Resend Code',style: TextStyle(
                              fontSize: 18,color: Color(0xff53B175),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.w500
                          ),),
                        ),
                      )),
                      const Padding(padding: EdgeInsets.only(bottom: 35)),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: ()async{
                    data.Credential();
                  },
                  backgroundColor: Color(0xff53B175),
                  child: Icon(Icons.arrow_forward_ios),
                ),
    ));
  }


}

