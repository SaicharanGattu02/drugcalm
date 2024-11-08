import 'package:drugcalm/utils/three_bounce.dart';
import 'package:flutter/material.dart';


class CustomSnackBar {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white, fontFamily: "Inter"),
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Color(0xFF8856F4),
      ),
    );
  }
}

class Spinkits {
  Widget getFadingCircleSpinner({Color color = Colors.white}) {
    return SizedBox(
      height: 15,
      width: 35,
      child: SpinKitThreeBounce(
        size: 20,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color, // Use the passed color or default to white
            ),
          );
        },
      ),
    );
  }
}
