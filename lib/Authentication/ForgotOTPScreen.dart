import 'dart:io';

import 'package:drugcalm/Authentication/PasswordReset.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gif/gif.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/constants.dart';

class ForgotOTPscreen extends StatefulWidget {
  const ForgotOTPscreen({super.key});

  @override
  State<ForgotOTPscreen> createState() => _ForgotOTPscreenState();
}

class _ForgotOTPscreenState extends State<ForgotOTPscreen> {
  final TextEditingController otpController = TextEditingController();
  final FocusNode focusNodeOTP = FocusNode();
  late GifController _controller;
  String _verifyMessage = "";
  @override
  void initState() {
    super.initState();
    // _controller = GifController(
    //     vsync: this); // Now `this` refers to a valid TickerProvider
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
                    text(context, 'CHECK YOUR EMAIL', 18,
                        color: color11,
                        fontfamily: "Inter",
                        fontWeight: FontWeight.w700),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 13, color: color2,fontFamily: "Inter",fontWeight: FontWeight.w400), // Default text style
                    children: <TextSpan>[
                      TextSpan(text: 'We sent a reset link to ',
                      ),
                      TextSpan(
                        text: 'contact@gmail.com',
                        style: TextStyle(
                          color: color11,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          print('Email clicked');
                        },
                      ),
                      TextSpan(text: '\nEnter 5 digit code that mentioned in the email',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                PinCodeTextField(
                  autoUnfocus: true,
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  blinkWhenObscuring: true,
                  autoFocus: true,
                  autoDismissKeyboard: false,
                  showCursor: true,
                  animationType: AnimationType.fade,
                  focusNode: focusNodeOTP,
                  hapticFeedbackTypes: HapticFeedbackTypes.heavy,
                  controller: otpController,
                  onTap: () {
                    setState(() {
                      _verifyMessage = "";
                    });
                  },
                  onChanged: (v) {
                    setState(() {
                      _verifyMessage = "";
                    });
                  },
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: h*0.06,
                      fieldWidth: w*0.11,
                      fieldOuterPadding: EdgeInsets.only(left: 0, right: 3),
                      activeFillColor: Color(0xFFF4F4F4),
                      activeColor: Color(0xff110B0F),
                      selectedColor: Color(0xff110B0F),
                      selectedFillColor: Color(0xFFF4F4F4),
                      inactiveFillColor: Color(0xFFF4F4F4),
                      inactiveColor: Color(0xFFD2D2D2),
                      inactiveBorderWidth: 1.5,
                      selectedBorderWidth: 2,
                      activeBorderWidth: 1),
                  textStyle: TextStyle(
                      fontFamily: "RozhaOne",
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                  cursorColor: Colors.black,
                  enableActiveFill: true,
                  keyboardType: TextInputType.numberWithOptions(),
                  textInputAction: (Platform.isAndroid)
                      ? TextInputAction.none
                      : TextInputAction.done,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  enablePinAutofill: true,
                  useExternalAutoFillGroup: true,
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
                SizedBox(
                  height: w*0.25,
                ),
                Center(
                  child: Image.asset(
                    "assets/forgototp.png",
                    width: 215,
                    height: 150,
                  ),
                ),
                SizedBox(
                  height: w*0.42,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Passwordreset(),));
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
                ),
            SizedBox(
              height: h * 0.02,
            ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black, // Default text color
                    ),
                    children: <TextSpan>[
                      // Regular text
                      TextSpan(
                        text: "Haven’t got the email yet? ",
                        style: TextStyle(
                          color: Color(0xff989898),
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "Resend email",
                        style: TextStyle(
                          color: Color(0xff648DDB),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter",
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          print("Resend email clicked");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
