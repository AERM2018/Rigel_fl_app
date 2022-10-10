import 'package:flutter/material.dart';
import 'package:rigel_app/themes/app_theme.dart';
class WelcomeMessage extends StatelessWidget {
    final String userName;

  const WelcomeMessage({
    Key? key, required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 60,
      margin: const EdgeInsets.only(top: 20, bottom: 30),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hi, $userName!", style: AppTheme.h2b),
          Text("What's today's taste? :)",style: AppTheme.h2boldb),
        ],
      ),
    );
  }
}
