import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/firebase/authentication.dart';
import 'package:test_flutter_app2/page/login.dart';
import 'package:test_flutter_app2/page/select_location.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscured = true;
  final textFieldFocusNode = FocusNode();
  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }
  TextEditingController _controllerName=TextEditingController();
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
                  const Text('Sign Up',style: TextStyle(
                      fontSize: 26,color: Colors.black,fontFamily: 'Gilroy-ExtraBold',fontWeight: FontWeight.w500
                  ),),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  const Text('Enter your credentials to continue',textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 16,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',
                  ),),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  const Text('Username',style: TextStyle(
                      fontSize: 16,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                  ),),
                  TextField(
                    maxLines: 1,
                    controller: _controllerName,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  const Text('Email',style: TextStyle(
                      fontSize: 16,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                  ),),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    controller: _controllerEmail,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  const Text('Password',style: TextStyle(
                      fontSize: 16,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                  ),),
                  TextField(
                    maxLines: 1,
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
                  Row(
                    children: [
                      const Text('By continuing you agree to our ',style: TextStyle(
                          fontSize: 14,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                      ),),
                      InkWell(
                        child: const Text('Terms of Service',style: TextStyle(
                            fontSize: 14,color: Color(0xff53B175),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                        ),),
                        onTap: (){},
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 6)),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            const Text('and ',style: TextStyle(
                                fontSize: 14,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                            ),),
                            InkWell(
                              child: const Text('Privacy Policy.',style: TextStyle(
                                  fontSize: 14,color: Color(0xff53B175),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                              ),),
                              onTap: (){},
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  isLoading?Center(child: CircularProgressIndicator(),):ElevatedButton(
                    onPressed: (){
                      setState(() {
                        if(_controllerName.text.length<1){
                          Get.snackbar("Thông báo", "Bạn chưa điền Tên");
                        }
                        else if(_controllerEmail.text.length<1){
                          Get.snackbar("Thông báo", "Bạn chưa điền Email");
                        }
                        else if(_controllerPass.text.length<1){
                          Get.snackbar("Thông báo", "Bạn chưa điền Mật Khẩu");
                        }
                        else if(_controllerPass.text.length<6){
                          Get.snackbar("Thông báo", "Mật khẩu phải lớn hơn 6 ký tự");
                        }
                        else {
                          isLoading=true;
                           AuthenticationHelper()
                              .signUp(email: _controllerEmail.text, password: _controllerPass.text)
                              .then((value) {
                            if(value==null){
                              Map<String,dynamic> user={"email":_controllerEmail.text,"password":_controllerPass.text,"user_name":_controllerName.text};
                              AuthenticationHelper().postFirestore(user);
                              isLoading=false;
                              Get.to(SelectLocation(checkIndex: 'signUp',));
                            }
                            else{
                              isLoading=true;
                              Get.snackbar('Thông báo', 'Lỗi');
                            }
                          });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 67),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                              20)),
                      primary: Color.fromARGB(255, 83, 177, 117),
                    ),
                    child: Text('Sign Up',style: TextStyle(
                        fontSize: 18,color: Colors.white,fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                    ),),),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? ',style: TextStyle(
                          fontSize: 14,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                      ),),
                      InkWell(
                        child: const Text('Log In',style: TextStyle(
                            fontSize: 14,color: Color(0xff53B175),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                        ),),
                        onTap: (){
                          Get.to(Login());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
