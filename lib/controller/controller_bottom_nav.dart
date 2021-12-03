
import 'package:get/get.dart';

class ControllerNav extends GetxController{
  int currentIndex=0;

  void changeTabIndex(int index) {
    currentIndex = index;
    update();
  }
}