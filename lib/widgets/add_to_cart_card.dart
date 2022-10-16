import 'package:count_stepper/count_stepper.dart';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/providers/cart_provider.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/themes/app_theme.dart';

class AddToCartCard extends StatefulWidget {
  final bool isUpdatingQuantity;
  const AddToCartCard({Key? key, required this.isUpdatingQuantity}) : super(key: key);

  @override
  State<AddToCartCard> createState() => _AddToCartCardState();
}

class _AddToCartCardState extends State<AddToCartCard> {
  // StepperController stepperController = StepperController();
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context, listen: false);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    if(
      widget.isUpdatingQuantity &&
      cartProvider.getCartItemByProductId(
                cartProvider.cartItemSelected!.productDetailed.product.id!) != null
    ){
      quantity = cartProvider
            .getCartItemByProductId(cartProvider.cartItemSelected!.productDetailed.product.id!)!.quantity;
              setState(() {});
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        color: AppTheme.thirdColor
      ),
      child: Column(
        verticalDirection: !widget.isUpdatingQuantity ? VerticalDirection.down : VerticalDirection.up,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CounterButton(count: quantity, onChange: ( value ){
                  if(value <= 0) return;
                  if(!widget.isUpdatingQuantity){
                    quantity = value;
                    setState(() {});
                  }else{
                    cartProvider.changeProductQuantity(cartProvider.cartItemSelected!.productDetailed.product.id!, value);
                  }
                }, loading: false
              ),
              Text( !widget.isUpdatingQuantity
                  ? "\$${productProvider.productSelected!.product.price}"
                  : "\$${cartProvider.cartItemSelected!.productDetailed.product.price}", 
                style: AppTheme.h1boldb,
              )
            ],
          ),
          const SizedBox(height: 20,),
          !widget.isUpdatingQuantity
          ?
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => !widget.isUpdatingQuantity ? cartProvider.addItem(productProvider.productSelected!, quantity) : null,
                style: ElevatedButton.styleFrom(
                  primary: AppTheme.primaryColorLighter
                ),
                child: Text(
                  "Add to cart",
                  style: AppTheme.h2boldb,
            )),
          )
          : SizedBox(
            width: double.infinity,
            child: Text(cartProvider.cartItemSelected!.productDetailed.product.title,
                    style: AppTheme.h1boldb,
                  ),
          )]
      ),
    );
  }
}