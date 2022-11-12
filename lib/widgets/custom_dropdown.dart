import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/models/country_model.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/providers/country_provider.dart';
import 'package:rigel_app/providers/providers.dart';
import 'package:rigel_app/themes/app_theme.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class CustomDropdown extends StatefulWidget {
  final void Function()? onChange;
  const CustomDropdown({super.key, this.onChange});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
    String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    final CountryProvider countryProvider = Provider.of<CountryProvider>(context);
    final StoreProvider storeProvider = Provider.of<StoreProvider>(context);

    dropdownValue ??= storeProvider.countryName;
    print("val");
    print(dropdownValue);
    
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 0,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        if(widget.onChange != null){
          storeProvider.countryName = value!;
          widget.onChange!();
        }
        setState(() {
          dropdownValue = value!;
        });
      },
      items: countryProvider.countries.isEmpty
      ? []
      : countryProvider.countries.map<DropdownMenuItem<String>>((Country country) {
        return DropdownMenuItem<String>(
          value: country.name,
          child: Text(country.name),
        );
      }).toList(),
    );
  }
}
