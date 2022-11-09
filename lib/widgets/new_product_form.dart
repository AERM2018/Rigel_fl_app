import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/helpers/validator_helper.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/themes/app_theme.dart';

class NewProductForm extends StatefulWidget {
  final ProductCategory category;
  final List<Map<String, dynamic>> newProductFields = [
    {
      "name": "Title",
      "hint": "Type product title",
      "label": "Title *",
      "keyboardType": TextInputType.text,
      "validator": ValidatorHelper.notEmpty
    },
    {
      "name": "Description",
      "hint": "Type product description",
      "label": "Description *",
      "keyboardType": TextInputType.text,
      "validator": ValidatorHelper.notEmpty
    },
    {
      "name": "Calories",
      "hint": "Type product calories (%)",
      "label": "Calories *",
      "keyboardType": TextInputType.number,
      "validator": ValidatorHelper.doubleGtZero
    },
    {
      "name": "Additives",
      "hint": "Type product additives (%)",
      "label": "Additives *",
      "keyboardType": TextInputType.number,
      "validator": ValidatorHelper.doubleGtZero
    },
    {
      "name": "Vitamins",
      "hint": "Type product vitamins (%)",
      "label": "Vitamins *",
      "keyboardType": TextInputType.number,
      "validator": ValidatorHelper.doubleGtZero
    },
    {
      "name": "Price",
      "hint": "Type product price (\$)",
      "label": "Price *",
      "keyboardType": TextInputType.number,
      "validator": ValidatorHelper.doubleGtZero
    },
  ];

  NewProductForm({Key? key, required this.category}) : super(key: key);
  @override
  State<NewProductForm> createState() => _NewProductFormState();
}

class _NewProductFormState extends State<NewProductForm> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> newProductMap = {};
  @override
  Widget build(BuildContext context) {
    final ProductProvider productProvider =
        Provider.of<ProductProvider>(context);
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...widget.newProductFields
                  .map((field) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: field['hint'],
                              label: Text(field['label'])),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (text) => field['validator'] != null
                              ? field['validator'](text, field['name'])
                              : null,
                          onChanged: (text) => setState(() => newProductMap[
                              field['name'].toString().toLowerCase()] = text),
                          keyboardType: field['keyboardType'],
                        ),
                      ))
                  .toList(),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "productImages");
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.open_in_new,
                        color: AppTheme.primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Product images",
                        style: TextStyle(color: AppTheme.primaryColor),
                      )
                    ],
                  )),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        newProductMap['category'] = widget.category.toMap();
                        List<String> imagesUrls = await productProvider.uploadImagesToStorage();
                        newProductMap["images"] = imagesUrls;
                        productProvider.addProduct(
                            Product.fromMap(serializeProduct(newProductMap))
                        );
                        productProvider.removeTemporalProductImage();
                        Navigator.pop(context);
                        // productProvider.addProduct(Product(
                        //     product:

                        //     images: prepareProductImages(
                        //         productProvider.temporalProductImages))).then((value){
                        //           productProvider.removeTemporalProductImage();
                        //           Navigator.pop(context);
                        //         });
                      }
                    },
                    child: const Text("Save")),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }

  Map<String, dynamic> serializeProduct(Map<String, dynamic> productMap) {
    return {
      "id": productMap["id"],
      "category": productMap["category"],
      "price": double.parse(productMap['price']!),
      "ranking": int.parse(productMap["ranking"] ?? "0"),
      "title": productMap["title"],
      "description": productMap["description"],
      "calories": double.parse(productMap["calories"]!),
      "additives": double.parse(productMap["additives"]!),
      "vitamins": double.parse(productMap["vitamins"]!),
      "images": productMap["images"] ?? []
    };
  }
}
