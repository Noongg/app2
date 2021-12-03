import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/firebase/authentication.dart';
import 'package:test_flutter_app2/page/bottom_navigator_bar.dart';
import 'package:test_flutter_app2/page/home_page/home_screen.dart';
import 'package:test_flutter_app2/page/login.dart';
import 'package:test_flutter_app2/page/number.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  bool ischeck=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/6011.png'),
          Container(
            padding: EdgeInsets.only(right: 20,left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Sign Up',style: TextStyle(
                    fontSize: 38,color: Colors.black,fontFamily: 'Gilroy-ExtraBold',fontWeight: FontWeight.bold
                ),),
                const Padding(padding: EdgeInsets.only(top: 10)),
                const Text('Get your groceries with nectar',style: TextStyle(
                    fontSize: 16,color: Color.fromARGB(150, 104, 104, 104),fontFamily: 'Gilroy-Light',
                ),),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                ischeck?Center(child: CircularProgressIndicator(),):ElevatedButton (
                  onPressed: () async{
                    await AuthenticationHelper().signInWithGoogle();
                    Get.offAll(BottomNav());
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 56),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                            30)),
                    primary: Color.fromARGB(255, 83, 131, 236),
                  ),
                  child: Row(
                    children: [
                      const Padding(padding: EdgeInsets.only(left: 15)),
                      Image.asset('assets/images/gg.png'),
                      const Padding(padding: EdgeInsets.only(left: 30)),
                      const Text('Continue with Google',style: TextStyle(
                          fontSize: 18,color: Colors.white,fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                OutlinedButton(
                    onPressed: (){
                      Get.to(Number());
                    },
                    style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width*0.75, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                            30)),
                  ),
                    child: const Text('I\'ll use phone',style: TextStyle(
                      fontSize: 16,color: Color.fromARGB(150, 104, 104, 104),fontFamily: 'Gilroy-Light',
                    ),),),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: ischeck?Center(child: CircularProgressIndicator(),):IconButton(
                        onPressed: ()async{
                          await AuthenticationHelper().signInWithFacebook();
                          Get.offAll(BottomNav());
                        },
                        icon: Image.asset('assets/images/fb.png'),),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10,right: 10)),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Image.asset('assets/images/gg.png'),),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have account?',style: TextStyle(
                      fontSize: 16,color: Colors.black54,fontFamily: 'Gilroy-Light',
                    ),),
                    const Padding(padding: EdgeInsets.only(left: 5)),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.only(
                          bottom: 3, // space between underline and text
                        ),
                        decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: Color(0xff53B175),  // Text colour here
                              width: 1.0, // Underline width
                            ))
                        ),

                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color:Color(0xff53B175),  // Text colour here
                          ),
                        ),
                      ),
                      onTap: (){
                        Get.to(Login());
                      },
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
