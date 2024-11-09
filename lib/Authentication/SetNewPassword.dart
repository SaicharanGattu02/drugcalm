import 'package:drugcalm/Authentication/ForgotOTPScreen.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import '../utils/constants.dart';

class SetnewpasswordScreen extends StatefulWidget {
  const SetnewpasswordScreen({super.key});

  @override
  State<SetnewpasswordScreen> createState() => _SetnewpasswordScreenState();
}

class _SetnewpasswordScreenState extends State<SetnewpasswordScreen> {
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
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
                    text(context, 'SET NEW PASSWORD', 18,
                        color: color11,
                        fontfamily: "Inter",
                        fontWeight: FontWeight.w700),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                text(context, 'Create a new password. Ensure it differs from previous ones for security', 14,
                    color: color2,
                    textAlign: TextAlign.start,
                    fontfamily: "Inter",
                    fontWeight: FontWeight.w400),
                SizedBox(height: 20,),
                Container(
                  height:54,
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Your New Password",
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
                  height: w*0.07,
                ),
                Container(
                  height:54,
                  child: TextField(
                    controller: confirmpassword,
                    decoration: InputDecoration(
                      hintText: "Re-Enter Your Password",
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
                  height: w*1,
                ),
                InkWell(
                  onTap: (){

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
                        child: text(context, 'UPDATE PASSWORD', 16,
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
