import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/page/onbording.dart';
import 'package:test_flutter_app2/router/router.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatortohome();
  }

  _navigatortohome() async{
    await Future.delayed(Duration(milliseconds: 2000),(){
      Get.offNamed(Routes.ONBORDING);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff53B175),
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
