import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/providers/providers.dart';
import 'package:rigel_app/screens/screens.dart';
import 'package:rigel_app/themes/app_theme.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider(),lazy: false,),
        ChangeNotifierProvider(create: (context) => CartProvider(),lazy: false,)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Rigel app",
        initialRoute: "home",
          routes: {
            "home":(context) => const HomeScreen(),
            "newProduct":(context) => const NewProductScreen(),
            "productImages":(context) => const ProductImagesScreen(),
            "product":(context) => const ProductScreen(),
            "cart":(context) => CartScreen(),
          },
          theme: AppTheme.ligthTheme,
        ),
    );
  }
}