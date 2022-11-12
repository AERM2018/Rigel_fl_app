import 'package:flutter/material.dart';
import 'package:rigel_app/screens/screens.dart';
import 'package:rigel_app/themes/app_theme.dart';

class CustomDrawer extends StatelessWidget {
  final String currentScreen;
  const CustomDrawer({Key? key, required this.currentScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.black,
      // elevation: 0,
      child: ListView(
        
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 40,),
          ListTile(
            title: Text(
              "Home",
              style: isTileSelected("home") ? AppTheme.h2boldb : AppTheme.h2b,
            ),
            leading: const Icon(Icons.home_filled),
            selected: isTileSelected("home"),
            selectedColor: AppTheme.primaryColor,
            onTap: takeToScreen(context,"home"),
            contentPadding: const EdgeInsets.all(8),
          ),
          ListTile(
            title: Text("Countries", style: isTileSelected("countries") ? AppTheme.h2boldb : AppTheme.h2b,),
            leading: const Icon(Icons.flag_rounded),
            selected: isTileSelected("countries"),
            selectedColor: AppTheme.primaryColor,
            onTap: takeToScreen(context,"countries"),
            contentPadding: const EdgeInsets.all(8),
          ),
          ListTile(
            title: Text("Stores", style: isTileSelected("stores") ? AppTheme.h2boldb : AppTheme.h2b,),
            leading: const Icon(Icons.store),
            selected: isTileSelected("stores"),
            selectedColor: AppTheme.primaryColor,
            onTap: takeToScreen(context, "stores"),
            contentPadding: const EdgeInsets.all(8),
          ),
          ListTile(
            title: Text("Currencies", style: isTileSelected("currencies") ? AppTheme.h2boldb
                  : AppTheme.h2b,),
            leading: const Icon(Icons.monetization_on),
            selected: isTileSelected("currencies"),
            selectedColor: AppTheme.primaryColor,
            onTap: takeToScreen(context, "currencies"),
            contentPadding: const EdgeInsets.all(8),
          )
        ],
      ),
    );
  }

  bool isTileSelected(String name){
    return name == currentScreen;
  }

  void Function()? takeToScreen(BuildContext context, String name){
    final Map<String, dynamic> screens = {
      "home" : const HomeScreen(),
      "countries" : const CountriesScreen(),
      "stores" : const StoresScreen(),
      "currencies" : const CurrenciesScreen(),
    };
    return () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => screens[name]));
  }
}