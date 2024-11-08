import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import '../utils/constants.dart';

class Forgotpasswordscreen extends StatefulWidget {
  const Forgotpasswordscreen({super.key});

  @override
  State<Forgotpasswordscreen> createState() => _ForgotpasswordscreenState();
}

class _ForgotpasswordscreenState extends State<Forgotpasswordscreen>
    with TickerProviderStateMixin {
  late GifController _controller;
  final TextEditingController email = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller = GifController(
        vsync: this); // Now `this` refers to a valid TickerProvider
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(Icons.arrow_back),
                SizedBox(
                  width: 15,
                ),
                text(context, 'Forgot Password', 18,
                    color: color11,
                    fontfamily: "Inter",
                    fontWeight: FontWeight.w700),
              ],
            ),
            SizedBox(
              height: 45,
            ),
            text(context, 'Please enter your email to reset the password', 15,
                color: color2,
                fontfamily: "Inter",
                fontWeight: FontWeight.w400),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Select Date From Date Picker",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    letterSpacing: 0,
                    height: 1.2,
                    color: Color(0xffAFAFAF),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  filled: true,
                  fillColor: Color(0xffFCFAFF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(width: 1, color: Color(0xffD0CBDB)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(width: 1, color: Color(0xffD0CBDB)),
                  ),
                ),
              ),
            ),

            // Gif(
            //   image: AssetImage("assets/forgotpassword1.gif"),
            //   width: 280,
            //   height: 260,
            //   controller: _controller, // if duration and fps is null, original gif fps will be used.
            //   autostart: Autostart.loop,
            //   placeholder: (context) => const Text('Loading...'),
            //   onFetchCompleted: () {
            //     _controller.reset();
            //     _controller.forward();
            //   },
            // ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Image.asset(
                "assets/forgotpassword.png",
                width: 280,
                height: 260,
              ),
            )
          ],
        ),
      ),
    );
  }
}
