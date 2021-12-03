import 'package:get/get.dart';
import 'package:test_flutter_app2/custom/bottom_navigator_bar.dart';
import 'package:test_flutter_app2/page/login_email/login.dart';
import 'package:test_flutter_app2/page/login_email/reset_password.dart';
import 'package:test_flutter_app2/page/login_email/sign_up.dart';
import 'package:test_flutter_app2/page/login_phone/number.dart';
import 'package:test_flutter_app2/page/login_phone/verification.dart';
import 'package:test_flutter_app2/page/onbording.dart';
import 'package:test_flutter_app2/page/product/product_detail.dart';
import 'package:test_flutter_app2/page/search/search_page.dart';
import 'package:test_flutter_app2/page/select_location.dart';
import 'package:test_flutter_app2/page/sign_in.dart';
import 'package:test_flutter_app2/router/router.dart';

class Pages{
static final pages = [
  GetPage(
      name: Routes.ONBORDING,
      page: ()=>OnBording()),
  GetPage(
      name: Routes.SIGNIN,
      page: ()=>SignIn(),),
  GetPage(
    name: Routes.BOTTOMNAV,
    page: ()=>BottomNav(),),
  GetPage(
    name: Routes.NUMBER,
    page: ()=>Number(),),
  GetPage(
    name: Routes.LOGIN,
    page: ()=>Login(),),
  GetPage(
    name: Routes.RESETPASSWORD,
    page: ()=>ResetPassWord(),),
  GetPage(
    name: Routes.SIGNUP,
    page: ()=>SignUp(),),
  GetPage(
    name: Routes.SELECTLOCATION,
    page: ()=>SelectLocation(),),
  GetPage(
    name: Routes.VERIFICATION,
    page: ()=>Verification(),),
  GetPage(
    name: Routes.SEARCHPAGE,
    page: ()=>SearchPage(),),
  GetPage(
    name: Routes.PRODUCTDETAIL,
    page: ()=>ProductDetail(),),
];
}