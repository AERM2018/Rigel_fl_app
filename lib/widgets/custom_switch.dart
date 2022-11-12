import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/providers/providers.dart';
import 'package:rigel_app/themes/app_theme.dart';
class CustomSwitch extends StatefulWidget {
  final void Function()? onChange;
  const CustomSwitch({Key? key, this.onChange}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _MyStatefulWidgetState();
}

/// private State class that goes with MyStatefulWidget
class _MyStatefulWidgetState extends State<CustomSwitch> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
  final StoreProvider storeProvider = Provider.of<StoreProvider>(context);
    return Center(
      child: Column(
        children: <Widget>[
          Switch(
            activeColor: AppTheme.primaryColor,
            value: isSwitched,
            onChanged: (value) {
              if(widget.onChange != null){
                storeProvider.isFavorite = value;
                widget.onChange!();
              }
              setState(() {
                isSwitched = value;
              });
            },
          ),
        ],
      ),
    );
  }
}