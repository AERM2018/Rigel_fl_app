import 'package:flutter/material.dart';
import 'package:rigel_app/themes/app_theme.dart';
import 'package:rigel_app/widgets/widgets.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, 'cart'), icon: Icon(Icons.shopping_bag_outlined,color: AppTheme.secondaryColor,))
        ],
        title: Text("Rigel", style: AppTheme.h1boldb,),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: const [
             WelcomeMessage(userName: "Angelo",),
             ProductCategoriesSlider(),
             ProductPreview(),
             ProductsDisplayer()
          ],
        ),
      ),
    );
  }
}
