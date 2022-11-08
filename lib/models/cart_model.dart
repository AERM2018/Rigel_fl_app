import 'package:rigel_app/helpers/db_helper.dart';
import 'package:rigel_app/models/models.dart';
import 'package:sqflite/sqflite.dart';

class CartResponse{
  final List<CartItemResponse> items;
  final double total;

  CartResponse({required this.items, required this.total});
}

class CartItemResponse{
  final int? id;
  final Product product;
  late int quantity;
  CartItemResponse({
    this.id,
    required this.quantity,
    required this.product,
  });
}

class Cart{
  final int? id;
  final double total;
  Cart({ this.id,required this.total });

  factory Cart.fromJson(Map<String,dynamic> json) => Cart(id: json['id'],total: json['total']);

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "total":total
    };
  }

  Future<void> insert(List<CartItem> items) async{
    Database db = await DbHelper.instance.db;
    int cartId= await db.insert("cart", toMap());
    await Future.wait(items.map((item) async{
      CartItem itemToSave = CartItem.fromJson(item.toMap());
      itemToSave.cart = cartId;
      itemToSave.insert();
    }));
  }

  Future<List<CartItemResponse>> findAllItems() async {
    // Database db = await DbHelper.instance.db;
    // var cartItems = await db.query("cartProducts");
    // if(cartItems.isNotEmpty){
    //   return await Future.wait(cartItems.map((cartItem)async{
    //    Product? product  = await ProductDetailed.findById(int.tryParse(cartItem['productId'].toString())!);
    //    return CartItemResponse(
    //       id: int.tryParse(cartItem['id'].toString()) ?? 0, 
    //       quantity: int.tryParse(cartItem['quantity'].toString()) ?? 0,
    //       product: product!
    //     );

    //   }).toList());
    // }
    return [];
  }

  Future<List<CartResponse>> find() async {
    Database db = await DbHelper.instance.db;
    var carts = await db.query('carts');
    return await Future.wait(carts.map((rawCart) async{
      Cart cart = Cart.fromJson(rawCart);
      List<CartItemResponse> items = await findAllItems();
      return CartResponse(items: items, total: cart.total);
    }));
  }
}

class CartItem{
  final int? id;
  final int? productId;
  int? cartId;
  int? quantity = 0;
  CartItem({
    this.cartId,
    this.id,
    this.productId,
    this.quantity,
  });

  int? get quantityDeserved {
    return quantity;
  }
  set quantityDeserved(int? inQuantity){
    quantity = inQuantity;
  }

  int? get cart {
    return cartId;
  }

  set cart(int? inCart) {
    cartId = inCart;
  }

  factory CartItem.fromJson(Map<String,dynamic> json) => CartItem(
    id:json['id'],
    productId: json['productId'],
    quantity: json['quantity'],
    cartId: json['cartId'],
  );

  Map<String, dynamic> toMap(){
    return {
      "id":id,
      "productId":id,
      "quantity":quantity,
      "cartId":cartId,
    };
  }

  Future<void> insert() async{
    Database db = await DbHelper.instance.db;
    await db.insert("cartProducts", toMap());
  }
}