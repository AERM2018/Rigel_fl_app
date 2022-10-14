import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/themes/app_theme.dart';
class ProductImagesScreen extends StatelessWidget {
  const ProductImagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductProvider productProvider = Provider.of<ProductProvider>(context);
    final List<String> productImages = productProvider.temporalProductImages;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
      ),
      body: productImages.isNotEmpty
      ? GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8), 
        itemBuilder: (context,index) => Image.file(
          File(productImages[index]), 
          fit: BoxFit.cover,),
        itemCount: productImages.length,)
      : Center(child: 
          Image.asset("assets/no-pics.png")
        ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if(result == null){
          return;
        }
        productProvider.addTemporalProductImage(result.files.single.path!);
      }, child: const Icon(Icons.add_photo_alternate_rounded),),
    );
  }
}

