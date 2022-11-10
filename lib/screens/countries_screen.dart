import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/providers/providers.dart';
import 'package:rigel_app/themes/app_theme.dart';
import 'package:rigel_app/widgets/widgets.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final CountryProvider countryProvider = Provider.of<CountryProvider>(context);
    return Scaffold(
      drawer: const CustomDrawer(
        currentScreen: "countries",
      ),
      appBar: AppBar(
        title: Text("Countries", style: AppTheme.h1boldb),
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async => await countryProvider.getCountries(false),
        child: countryProvider.countries.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    Country country = countryProvider.countries[index];
                    return ListTile(
                      title: Text(
                          "${country.name} (${country.shortName.toUpperCase()})"),
                      subtitle:
                          Text("Number of stores: ${country.numOfStores}"),
                      leading: country.flagImageUrl.isNotEmpty
                          ? Image.network(country.flagImageUrl,loadingBuilder: (context, child, loadingProgress) => 
                            loadingProgress == null 
                            ? child 
                            : const SizedBox(
                              width: 40,
                              child: Center(
                                child: CircularProgressIndicator(),
                                ),
                            ))
                          : Image.asset("pic-unavailable.png"),
                          contentPadding: const EdgeInsets.all(8),
                    );
                  },
                  itemCount: countryProvider.countries.length,
                )
              : Container(),
      )
    );
  }
}