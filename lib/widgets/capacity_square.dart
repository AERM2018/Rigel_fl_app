import 'package:flutter/material.dart';
import 'package:rigel_app/themes/app_theme.dart';

class CapacitySquare extends StatelessWidget {
  final String title;
  final double data;
  const CapacitySquare({Key? key, required this.title, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.white, width: 0.7),
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTheme.h4w,),
            Text("$data%", style: AppTheme.h3boldw,),
          ]
        ),
      ),
    );
  }
}