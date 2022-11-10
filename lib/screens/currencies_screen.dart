import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/providers/providers.dart';
import 'package:rigel_app/themes/app_theme.dart';
import 'package:rigel_app/widgets/widgets.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrencyProvider currencyProvider = Provider.of<CurrencyProvider>(context);
    return Scaffold(
      drawer: const CustomDrawer(
        currentScreen: "currencies",
      ),
      appBar: AppBar(
        title: Text("Currencies", style: AppTheme.h1boldb),
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async => await currencyProvider.getCurrencies(false),
        child: currencyProvider.currencies.isNotEmpty
            ? ListView.builder(
                itemBuilder: (context, index) {
                  Currency currency = currencyProvider.currencies[index];
                  return ListTile(
                    title: Text(
                        "${currency.name} (${currency.shortName.toUpperCase()})"),
                    leading: currency.imageUrl.isNotEmpty
                        ? Image.network(currency.imageUrl,
                            loadingBuilder: (context, child, loadingProgress) =>
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
                itemCount: currencyProvider.currencies.length,
              )
            : Container(),
      ),
    );
  }
}
