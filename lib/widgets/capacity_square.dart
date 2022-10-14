import 'package:flutter/material.dart';

class CapacitySquare extends StatelessWidget {
  final String title;
  final double data;
  const CapacitySquare({Key? key, required this.title, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(title),
            Text("$data"),
          ]
        ),
      ),
    );
  }
}