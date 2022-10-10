import 'package:flutter/material.dart';
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
          IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_bag_outlined,color: Colors.grey,))
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const WelcomeMessage(userName: "Angelo",),
            const ProductCategoriesSlider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: const ProductPreview()
            ),
                const ProductsDisplayer()
          ],
        ),
      ),
    );
  }
}
