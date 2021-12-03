import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/firebase/authentication.dart';
import 'package:test_flutter_app2/custom/button.dart';
import 'package:test_flutter_app2/page/bottom_navigator_bar.dart';
import 'package:test_flutter_app2/page/home_page/home_screen.dart';
import 'package:test_flutter_app2/page/reset_password.dart';
import 'package:test_flutter_app2/page/sign_up.dart';
class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscured = true;
  final textFieldFocusNode = FocusNode();
  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }

  TextEditingController _controllerEmail=TextEditingController();
  TextEditingController _controllerPass=TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.1)),
            Align(
              child: Image.asset('assets/images/carot1.png'),
              alignment: Alignment.center,
            ),
            const Padding(padding: EdgeInsets.only(top: 80)),
            Container(
              padding: EdgeInsets.only(right: 20,left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Log In',style: TextStyle(
                      fontSize: 26,color: Colors.black,fontFamily: 'Gilroy-ExtraBold',fontWeight: FontWeight.w500
                  ),),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  const Text('Enter your emails and password',textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 16,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',
                  ),),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  const Text('Email',style: TextStyle(
                      fontSize: 16,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                  ),),
                  TextField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  const Text('Password',style: TextStyle(
                      fontSize: 16,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                  ),),
                  TextField(
                    controller: _controllerPass,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscured,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: GestureDetector(
                            onTap: _toggleObscured,
                            child: Icon(
                              _obscured
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              size: 24,
                            ),
                          ),
                        )
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Align(
                    alignment:Alignment.topRight,
                    child: InkWell(
                      child: const Text('Forgot Password?',style: TextStyle(
                          fontSize: 14,color: Color(0xff181725),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                      ),),
                      onTap: (){
                        Get.to(()=>ResetPassWord());
                      },
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  isLoading?Center(child: CircularProgressIndicator(),):Button(name: 'Log In', ontap: (){
                    if(_controllerEmail.text.isEmpty || _controllerEmail.text.isEmpty){
                      Get.snackbar('Thông báo', 'Bạn chưa điền tài khoản hoặc mật khẩu');
                    }else{
                      isLoading=true;
                      AuthenticationHelper()
                          .signIn(email: _controllerEmail.text, password: _controllerPass.text)
                          .then((value){
                        if(value==null){
                          Map<String,dynamic> passUp={"password":_controllerPass.text};
                          AuthenticationHelper().putFirestore(passUp);
                          isLoading=false;
                          Get.offAll(()=>BottomNav());
                        }else{
                          isLoading=false;
                          Get.snackbar('Thông báo', 'Sai mật khẩu hoặc Tài khoản');
                        }
                      });
                    }
                  }, context: context,check: false,total: 10),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don’t have an account? ',style: TextStyle(
                          fontSize: 14,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                      ),),
                      InkWell(
                        child: const Text('Signup',style: TextStyle(
                            fontSize: 14,color: Color(0xff53B175),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                        ),),
                        onTap: (){
                          Get.to(SignUp());
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
