import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/material.dart';
import 'package:rigel_app/themes/app_theme.dart';

class AddToCarCard extends StatelessWidget {
  const AddToCarCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        color: AppTheme.thirdColor
      ),
      child: Column(
        children: [
          Padding(
            padding:  const EdgeInsets.only(top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CountStepper(
                  iconColor: AppTheme.secondaryColor,
                  defaultValue: 1,
                  max: 100,
                  min: 1,
                  iconDecrementColor: AppTheme.secondaryColor,
                  splashRadius: 30,
                  onPressed: (value) {},
                ),
                Text("\$99.9", style: AppTheme.h1boldb,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:30),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: AppTheme.primaryColorLighter
                ),
                child: Text(
                  "Add to cart",
                  style: AppTheme.h2boldb,
                )),
          )
        ],
      ),
    );
  }
}