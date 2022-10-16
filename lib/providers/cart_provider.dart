import 'package:flutter/cupertino.dart';
import 'package:rigel_app/models/cart_model.dart';
import 'package:rigel_app/models/models.dart';

class CartProvider with ChangeNotifier{
  List<CartItemResponse> cartItems = [];
  double total = 0;
  CartItemResponse? cartItemSelected;
  CartProvider(){
    print("Cart provider initialized");
  }

  void addItem(ProductDetailed item, int quantity){
    var itemAlreadyStored = getCartItemByProductId(item.product.id!);
    if( itemAlreadyStored != null){
      changeProductQuantity(item.product.id!,itemAlreadyStored.quantity + quantity);
    }else{
      CartItemResponse cartItem = CartItemResponse(quantity: quantity, productDetailed: item);
      cartItems = [...cartItems, cartItem];
    }
    if(
      cartItemSelected == null &&
      cartItemSelected?.productDetailed.product.id != cartItems[0].productDetailed.product.id
    ){
      cartItemSelected = cartItems[0];
    }
    notifyListeners();
  }

  void selectCartItem(CartItemResponse item){
    cartItemSelected = item;
    notifyListeners();
  }

  void changeProductQuantity(int productId,int quantity){
    CartItemResponse item = cartItems.firstWhere((cartItem) => cartItem.productDetailed.product.id == productId);
    item.quantity = quantity;
    notifyListeners();
  }

  CartItemResponse? getCartItemByProductId(int productId){
    int id = cartItems.map((cartItem) => cartItem.productDetailed.product.id!).firstWhere((id) => id == productId, orElse: ()=>-1);
    if(id == -1) return null;
    return cartItems.firstWhere((cartItem) => cartItem.productDetailed.product.id == productId);
  }
}