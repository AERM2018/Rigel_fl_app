import 'package:flutter/material.dart';
class WelcomeMessage extends StatelessWidget {
    final String userName;

  const WelcomeMessage({
    Key? key, required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hi, $userName!"),
          const Text("What's today's taste? :)"),
          const SizedBox(height: 15,)
        ],
      ),
    );
  }
}
