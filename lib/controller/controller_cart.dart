import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/model/cart_item.dart';

class ControllerCart extends GetxController{

  var userDocument;

  Map<int, CartItem> _items = {};
  int cart=0;
  Map<int, CartItem> get items {
    return {..._items};
  }
  int get itemCount{
    return _items.length;
  }
  void decrement(int index){
    if(items.values.toList()[index].quantity==1){
      removeitem(int.parse(items.values.toList()[index].id));
    }else{
      items.values.toList()[index].quantity--;
    }
    update();
  }
  void increment(int index){
    items.values.toList()[index].quantity++;
    update();
  }
  int get totalItem{
    var total = 0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }
  void addItem(int productId,int price,String title,String unit,int quantity,String imageUrl,String id){
    if(_items.containsKey(productId)){
      _items.update(productId, (value) => CartItem(
          title: value.title,
          imageUrl: value.imageUrl,
          unit: value.unit,
          price: value.price,
          quantity: quantity,
          id: value.id));
      update();

    }else{
      cart++;
      _items.putIfAbsent(productId, () => CartItem(
          title: title,
          imageUrl: imageUrl,
          unit: unit,
          price: price,
          quantity: quantity,
          id: id));
      update();
    }

  }
  void removeitem(int productId){
    cart--;
    update();
    _items.remove(productId);
    update();
  }

  void clear(){
    _items = {};
    cart=0;
    update();
  }
}