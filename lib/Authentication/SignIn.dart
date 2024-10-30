import 'package:drugcalm/Authentication/OtpVerify.dart';
import 'package:drugcalm/utils/ColorConstrants.dart';
import 'package:drugcalm/utils/CustomAppBar.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../utils/CustomSnackBar.dart';
import '../utils/ShakeWidget.dart';
import '../utils/ThemeProvider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _mobileController = TextEditingController();

  final List<String> _languages = ['English', 'Hindi', 'Spanish', 'French'];

  String validatemobile = "";
  bool _loading = false; // Set loading to false by default

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'SIGN IN TO CONTINUE'),
          Lottie.asset(
            'assets/animations/signin.json',
            height: h * 0.35,
            width: w * 0.5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: w * 0.72,
                      height: h * 0.055,
                      child: DropdownButtonFormField<String>(
                        value:
                            context.watch<LanguageProvider>().selectedLanguage,
                        onChanged: (String? newValue) {
                          context
                              .read<LanguageProvider>()
                              .setLanguage(newValue!);
                        },
                        items: _languages
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          hintText: "Select language",
                          hintStyle: TextStyle(
                            fontSize: 15,
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
                            borderSide:
                                BorderSide(width: 1, color: Color(0xffD0CBDB)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            borderSide:
                                BorderSide(width: 1, color: Color(0xffD0CBDB)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      width: w * 0.12,
                      height: h * 0.055,
                      decoration: BoxDecoration(
                          gradient: linearGradient,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        'assets/language.png',
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
                SizedBox(height: h * 0.02),
                Container(
                  height: MediaQuery.of(context).size.height * 0.055,
                  child: TextFormField(
                    controller: _mobileController,
                    keyboardType: TextInputType.phone,
                    obscureText: false,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      hintText: '(+91) Enter 10 Digit Mobile Number',
                      hintStyle: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                        color: Color(0xffAFAFAF),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: const Color(0xffFCFAFF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xffd0cbdb)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xffd0cbdb)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xffd0cbdb)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xffd0cbdb)),
                      ),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
                if (validatemobile.isNotEmpty) ...[
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ShakeWidget(
                      key: Key("value"),
                      duration: Duration(milliseconds: 700),
                      child: Text(
                        validatemobile,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  SizedBox(height: 15),
                ],
                SizedBox(
                  height: h * 0.04,
                ),
                containertext(context, 'GET VERIFICATION CODE', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpVerify(num: _mobileController.text,)));
                }),
                SizedBox(
                  height: h * 0.04,
                ),
                Center(child: text4(context, 'Sign In with Email', 16,color: color1)),

                SizedBox(
                  height: h * 0.02,
                ),
                 Row(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    text5(context,'Don’t have an account? ', 16),
                    text5(context,'Sign up', 16,color: color1)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
