import 'package:get/get.dart';

class ControllerCheckBox extends GetxController{


  Map<String, bool> values = {
    'Carrots': false,
    'Noodles & Pasta': false,
    'Chips & Crisps': false,
    'Fast Food': false,
  };
  List<String> tmpArray = [];
  getCheckboxItems(){

    values.forEach((key, value) {
      if(value == true)
      {
        tmpArray.add(key);

      }
      update();
    });
  }
  clerChecbox(){
    tmpArray.clear();
  }

  Map<String, bool> values2 = {
    'Individual Callection': false,
    'Cocola': false,
    'Ifad': false,
    'Kazi Farmas': false,
  };
  var tmpArray2 = [];
  getCheckboxItems2(){
    values.forEach((key, value) {
      if(value == true)
      {
        tmpArray2.add(key);
      }
    });
    values2.forEach((key, value) {
      if(value == true)
      {
        tmpArray2.add(key);
      }
    });
  }
}