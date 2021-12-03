import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/firebase/authentication.dart';
import 'package:test_flutter_app2/custom/bottom_navigator_bar.dart';
import 'package:test_flutter_app2/page/home_page/home_screen.dart';
import 'package:test_flutter_app2/router/router.dart';

class ControllerVerification extends GetxController{
  late String verificationID,phone;
  TextEditingController controllerCode = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    phone = Get.arguments['phone'];
    verifyPhone(phone);
  }
  void verifyPhone(String phone) async{
    await AuthenticationHelper().auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential)async{
          await FirebaseAuth.instance.signInWithCredential(credential).then((value){
            if(value.user!=null){
              print('oke');
            }else{
              Get.snackbar('Thông báo', "Lỗi");
            }
          });
        },
        timeout: Duration(seconds: 120),
        verificationFailed: (FirebaseAuthException e){
          print(e.message);
        },
        codeSent: (String id,int? token)async{
          verificationID=id;
          update();
        },
        codeAutoRetrievalTimeout: (String id){
          verificationID=id;
          update();
        });
  }

  void Credential()async{
    await AuthenticationHelper().auth.signInWithCredential(
        PhoneAuthProvider.credential(verificationId: verificationID, smsCode: controllerCode.text)
    ).then((value) {
      if(value.user!=null){
        Map<String,dynamic> user={"email":'',"sdt":phone,"user_name":''};
        AuthenticationHelper().postFirestore(user);
        Get.offAllNamed(Routes.BOTTOMNAV);
      }else{
        Get.snackbar('Thông báo', "Sai mã code");
      }
    });
  }
}