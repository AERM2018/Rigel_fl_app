import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/providers/product_categories_provider.dart';
import 'package:rigel_app/screens/screens.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductCategoriesProvider(),lazy: false,)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Rigel app",
        initialRoute: "home",
          routes: {
            "home":(context) => const HomeScreen()
          },
        ),
    );
  }
}