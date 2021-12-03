import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/firebase/authentication.dart';
import 'package:test_flutter_app2/page/login.dart';

class ResetPassWord extends StatefulWidget {
   ResetPassWord({Key? key}) : super(key: key);

  @override
  State<ResetPassWord> createState() => _ResetPassWordState();
}

class _ResetPassWordState extends State<ResetPassWord> {
   TextEditingController _controllerEmail=TextEditingController();
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
                  const Text('Reset PassWord',style: TextStyle(
                      fontSize: 26,color: Colors.black,fontFamily: 'Gilroy-ExtraBold',fontWeight: FontWeight.w500
                  ),),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  const Text('Enter your emails for reset password',textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 16,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',
                  ),),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  const Text('Email',style: TextStyle(
                      fontSize: 16,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                  ),),
                  TextField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  isLoading?Center(child: CircularProgressIndicator(),):ElevatedButton(
                    onPressed: (){
                      if(_controllerEmail.text.isEmpty ){
                        Get.snackbar('Thông báo', 'Bạn chưa điền Email');
                      }
                      else{
                        isLoading=true;
                        AuthenticationHelper().resetPassWord(email: _controllerEmail.text);
                        isLoading=false;
                        Get.back();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 67),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                              20)),
                      primary: Color.fromARGB(255, 83, 177, 117),
                    ),
                    child: Text('Reset',style: TextStyle(
                        fontSize: 18,color: Colors.white,fontFamily: 'Gilroy-Light',fontWeight: FontWeight.bold
                    ),),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
