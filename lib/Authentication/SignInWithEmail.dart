import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:drugcalm/Authentication/ForgotOTPScreen.dart';
import 'package:drugcalm/Authentication/OtpVerify.dart';
import 'package:drugcalm/Screens/dashboard.dart';
import 'package:drugcalm/utils/ColorConstrants.dart';
import 'package:drugcalm/utils/CustomAppBar.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../Services/UserApi.dart';
import '../utils/CustomSnackBar.dart';
import '../utils/Preferances.dart';
import '../utils/ShakeWidget.dart';
import '../utils/ThemeProvider.dart';
import 'ForgotPasswordScreen.dart';

class SignInWithEmail extends StatefulWidget {
  const SignInWithEmail({super.key});

  @override
  _SignInWithEmailState createState() => _SignInWithEmailState();
}

class _SignInWithEmailState extends State<SignInWithEmail> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _focusNodePassword = FocusNode();

  bool _obscurePassword = true;
  String validateEmail = "";
  String validatePassword = "";
  bool _loading = false;

  void _validateFields() {
    setState(() {
      _loading = true;
      validateEmail = !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
          .hasMatch(_emailController.text)
          ? "Please enter a valid email"
          : "";
      validatePassword = _passwordController.text.isEmpty
          ? "Please enter a valid Email"
          : "";

      if (validateEmail.isEmpty && validatePassword.isEmpty) {
        LoginWithEmail();
      } else {
        _loading = false;
      }
    });
  }

  Future<void> LoginWithEmail() async {
    await Userapi.SignIn(_emailController.text, _passwordController.text)
        .then((data) => {
              if (data != null)
                {
                  setState(() {
                    if (data.settings?.success == 1) {
                      _loading = false;
                      PreferenceService().saveString('token',data.data?.access ?? "");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashbord()));
                    } else {
                      _loading = false;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          data.settings?.message ?? "",
                          style: TextStyle(color: Color(0xff000000)),
                        ),
                        duration: Duration(seconds: 1),
                        backgroundColor: color1,
                      ));
                    }
                  })
                } else {
                  setState(() {
                    _loading = false;
                  })
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: 'SIGN IN TO CONTINUE'),
            Lottie.asset(
              'assets/animations/signin.json',
              height: h * 0.37,
              width: w * 0.65,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h * 0.01),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      hintText: 'Email ID',
                      hintStyle: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                        color: color,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.person,
                        color: color,
                      ),
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
                  if (validateEmail.isNotEmpty) ...[
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ShakeWidget(
                        key: Key("value"),
                        duration: Duration(milliseconds: 700),
                        child: Text(
                          validateEmail,
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
                  _buildTextFormField(
                    controller: _passwordController,
                    focusNode: _focusNodePassword,
                    hintText: "Password",
                    obscureText: _obscurePassword,
                    validationMessage: 'Please enter your password',
                    toggleObscure: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  if (validatePassword.isNotEmpty) ...[
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ShakeWidget(
                        key: Key("value"),
                        duration: Duration(milliseconds: 700),
                        child: Text(
                          validatePassword,
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
                    height: h * 0.02,
                  ),
                  containertext(context, 'CONTINUE',isLoading: _loading, onTap: () {
                    if(_loading){

                    }else{
                      _validateFields();
                    }
                  }),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkResponse(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Forgotpasswordscreen()));
                        },
                        child: text(
                            context,
                            'Forgot password?',
                            textAlign: TextAlign.end,
                            15,
                            color: color1,
                            fontWeight: FontWeight.w400,
                            textdecoration: TextDecoration.underline,
                            decorationcolor: color1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black, // Default text color
                        ),
                        children: <TextSpan>[
                          // Regular text
                          TextSpan(
                            text: "Don’t have an account? ",
                            style: TextStyle(
                              color: Color(0xff989898),
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: "Sign up",
                            style: TextStyle(
                              color: color1,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("Resend email clicked");
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hintText,
    required String validationMessage,
    bool obscureText = false,
    Widget? prefixIcon,
    required VoidCallback toggleObscure,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        hintText: hintText,
        prefixIcon: Icon(
          Icons.lock,
          color: color,
          size: 22,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: Color(0xffAFAFAF),
            size: 18,
          ),
          onPressed: toggleObscure,
        ),
        hintStyle: const TextStyle(
          fontSize: 14,
          letterSpacing: 0,
          height: 19.36 / 14,
          color: Color(0xffAFAFAF),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: const Color(0xffFCFAFF),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(width: 1, color: Color(0xffd0cbdb)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(width: 1, color: Color(0xffd0cbdb)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(width: 1, color: Color(0xffd0cbdb)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(width: 1, color: Color(0xffd0cbdb)),
        ),
      ),
      textAlignVertical: TextAlignVertical.center,
    );
  }
}
