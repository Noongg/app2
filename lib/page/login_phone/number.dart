import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/firebase/authentication.dart';
import 'package:test_flutter_app2/page/login_phone/verification.dart';
import 'package:test_flutter_app2/router/router.dart';
class Number extends StatelessWidget {
  Number({Key? key}) : super(key: key);

  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme:const  IconThemeData(
          color: Colors.black
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon:const  Icon(Icons.arrow_back_ios),
        ),
        title:const  Text(''),
      ),
      body: Container(
        padding:const  EdgeInsets.only(left: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(top: 40)),
            const Text('Enter your mobile number',style: TextStyle(
                fontSize: 26,color: Colors.black,fontFamily: 'Gilroy-Light',fontWeight: FontWeight.w500
            ),),
            const Padding(padding: EdgeInsets.only(top: 20)),
            const Text('Mobile Number',style: TextStyle(
                fontSize: 16,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.w500
            ),),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image.asset('assets/images/co.png'),
                ),
                hintText: '+880',
                hintStyle: const TextStyle(
                    color: Colors.black
                ),

              ),
              controller: _controller,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_controller.text.isEmpty){
            Get.snackbar("Thông báo", "Bạn chưa nhập số điện thoại");
          }else if(_controller.text.length!=10){
            Get.snackbar("Thông báo", "Bạn điền sai số điện thoại");
          } else {
            if(_controller.text[0]=="0"){
              String phone=(_controller.text).substring(1);
              Get.toNamed(Routes.VERIFICATION,arguments: {"phone" : "+84"+phone,});
            }
          }

        },
        backgroundColor: Color(0xff53B175),
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
