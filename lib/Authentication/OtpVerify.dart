import 'dart:io';

import 'package:drugcalm/utils/CustomAppBar.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../Screens/dashboard.dart';
import '../utils/ShakeWidget.dart';

class OtpVerify extends StatefulWidget {
  final String num;
  const OtpVerify({super.key, required this.num});

  @override
  _OtpVerifyState createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  final TextEditingController otpController = TextEditingController();
  final FocusNode focusNodeOTP = FocusNode();
  bool _isLoading = false;
  String _verifyMessage = "";
  bool recieving = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'VERIFY MOBILE NUMBER'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 12, right: 8),
                          width: w * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text(context, 'A 06 Digit Code has been sent to:',
                                  16,
                                  fontWeight: FontWeight.w400),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              text(context, '+91 ${widget.num}', 16,
                                  fontWeight: FontWeight.w500),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              text(context, 'RESEND', 18, color: color1)
                            ],
                          ),
                        ),
                        Container(
                          width: w * 0.35,
                          height: h * 0.25,
                          child: Lottie.asset(
                            'assets/animations/onboarding3.json',
                            fit: BoxFit.contain,
                            width: w * 0.3,
                          ),
                        )
                      ],
                    ),
                    text(context, 'Enter the Verification Code Here', 15,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      height: h * 0.02,
                    ),
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
                          borderRadius: BorderRadius.circular(5),
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
                          activeBorderWidth: 2),
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
                    if (_verifyMessage.isNotEmpty) ...[
                      Center(
                        child: Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                          width: w * 0.6,
                          child: ShakeWidget(
                            key: Key("value"),
                            duration: Duration(milliseconds: 700),
                            child: Text(
                              _verifyMessage,
                              style: TextStyle(
                                fontFamily: "RozhaOne",
                                fontSize: 13,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ] else ...[
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                InkResponse(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashbord()));
                },
                    child: containertext(context, 'CONTINUE'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
