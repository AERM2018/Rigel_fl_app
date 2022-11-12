import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/providers/providers.dart';
import 'package:rigel_app/themes/app_theme.dart';
import 'package:rigel_app/widgets/widgets.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreProvider storeProvider = Provider.of<StoreProvider>(context);
    Size screenSize  = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const CustomDrawer(
        currentScreen: "stores",
      ),
      appBar: AppBar(
        title: Text("Stores", style: AppTheme.h1boldb),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text("Country"),
                    const SizedBox(
                      width: 12,
                    ),
                    CustomDropdown(
                      onChange: storeProvider.filterStores,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Favorites"),
                    const SizedBox(
                      width: 12,
                    ),
                    CustomSwitch( onChange: storeProvider.filterStores,),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.7,
            width: screenSize.width,
            child: RefreshIndicator(
              onRefresh: () async => await storeProvider.getStores(false),
              child: storeProvider.storesFiltered.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        Store store = storeProvider.storesFiltered[index];
                        return ListTile(
                          title: Text(store.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Address: ${store.address} ZIP ${store.zip}"),
                              Text("Country: ${store.country.name}"),
                            ],
                          ),
                          trailing: FavoriteButton(
                            iconSize: 35,
                            valueChanged: (value) async{
                              storeProvider.isFavorite = value;
                              storeProvider.setAsFavorite(store.id!, value).then((_){
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(getSnackBarMsg(value));
                                storeProvider.getStoresWithOppositeFavVal();
                              });
                            },
                            isFavorite: store.isFavorite,
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        );
                      },
                      itemCount: storeProvider.storesFiltered.length,
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }

  SnackBar getSnackBarMsg(bool isFavorite){
    String msg = (isFavorite) ? "Store set as favorite": "Store unset as favorite";
    return SnackBar(
      content: Text(msg),
      duration: const Duration(milliseconds: 800),
    );
  }
}
