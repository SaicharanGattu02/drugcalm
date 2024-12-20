import 'package:drugcalm/Authentication/ForgotOTPScreen.dart';
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
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: w,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/Drug Clam Background.png',
                  ),
                  fit: BoxFit.cover)),
          child: Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color4,
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.arrow_back),
                    SizedBox(
                      width: 15,
                    ),
                    text(context, 'FORGOT PASSWORD', 18,
                        color: color11,
                        fontfamily: "Inter",
                        fontWeight: FontWeight.w700),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                text(context, 'Please enter your email to reset the password', 14,
                    color: color2,
                    textAlign: TextAlign.start,
                    fontfamily: "Inter",
                    fontWeight: FontWeight.w400),
                SizedBox(height: 20,),
                Container(
                  height:54,
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: "Mobile Number or Email",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0,
                        height: 1.2,
                        color: color,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Color(0xffFCFAFF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(width: 1, color: color7),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(width: 1, color:color7),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: w*0.2,
                ),
                Center(
                  child: Image.asset(
                    "assets/forgotpassword.png",
                    width: 280,
                    height: 250,
                  ),
                ),
                SizedBox(
                  height: w*0.3,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotOTPscreen(),));
                  },
                  child: Center(
                    child: Container(
                      width: w,
                      height: 60,
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8),
                          ),
                          color: color1
                      ),
                      child: Center(
                        child: text(context, 'RESET PASSWORD', 16,
                            color: color4,
                            fontfamily: "Inter",
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
