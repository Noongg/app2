import 'package:get/get.dart';
import 'package:test_flutter_app2/model/vegetables.dart';

class ControllerFavorite extends GetxController{

  Map<int, Vegetables> _itemsFavourite = {};
  int cart=0;
  Map<int, Vegetables> get itemsFavourite {
    return {..._itemsFavourite};
  }
  int get itemCount{
    return _itemsFavourite.length;
  }

  void addItem({required int productId,
    required int price,
    required String title,
    required String unit,
    required String imageUrl,
    required String id,
    required String description,
    required String category,
    required String review}){
    if(_itemsFavourite.containsKey(productId)){
      _itemsFavourite.update(productId, (value) => Vegetables(
          img: value.img,
          description: value.description,
          category: value.category,
          review: value.review,
          title: value.title,
          unit: value.unit,
          price: value.price,
          id: value.id));
      update();

    }else{
      cart++;
      _itemsFavourite.putIfAbsent(productId, () => Vegetables(
          description: description,
          category: category,
          review: review,
          title: title,
          img: imageUrl,
          unit: unit,
          price: price,
          id: id));
      update();
    }

  }
  void removeitem(int productId){
    cart--;
    update();
    _itemsFavourite.remove(productId);
    update();
  }

  void clear(){
    _itemsFavourite = {};
    cart=0;
    update();
  }
}