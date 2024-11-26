import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:drugcalm/Authentication/OtpVerify.dart';
import 'package:drugcalm/Authentication/Register.dart';
import 'package:drugcalm/Authentication/SignInWithEmail.dart';
import 'package:drugcalm/Registration/BasicInformation.dart';
import 'package:drugcalm/utils/ColorConstrants.dart';
import 'package:drugcalm/utils/CustomAppBar.dart';
import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../Model/LanguageModel.dart';
import '../Registration/BusinessDetails.dart';
import '../Registration/Registration.dart';
import '../Registration/VerificationDetails.dart';
import '../Services/UserApi.dart';
import '../providers/LanguageProvider.dart';
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

  final FocusNode _focusNodePhone = FocusNode();
  String _validatePhone = "";
  bool _loading = false;
  final spinkits = Spinkits();

  // List of language names (displayed in the dropdown)
  final List<String> _languages = ['English', 'Hindi', 'Telugu', 'French'];

  // Corresponding language codes
  final List<String> _languageCodes = ['en', 'hi', 'te', 'fr'];

  String validatemobile = "";

  void _validateFields() {
    setState(() {
      _loading = true;
      _validatePhone =
          _mobileController.text.isEmpty || _mobileController.text.length < 10
              ? "Please enter a valid phone number"
              : "";
      if (_validatePhone.isEmpty) {
        LoginOtp();
      } else {
        _loading = false;
      }
    });
  }

  Future<void> LoginOtp() async {
    await Userapi.PostOtp(_mobileController.text).then((data) => {
          if (data != null)
            {
              setState(() {
                if (data.settings?.success == 1) {
                  _loading = false;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              OtpVerify(num: _mobileController.text)));
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
            }
          else
            {
              setState(() {
                _loading = false;
              })
            }
        });
  }

  @override
  void initState() {
    getLanguageList();
    super.initState();
  }

  List<Data> data=[];

Future<void> getLanguageList() async {
    var res = await Userapi.getLanguage();
    if(res != null){
      setState(() {
        if(res.settings?.success==1){
          data=res.data??[];
        }else
          {

          }
      });

    }
}


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            CustomAppBar(title: 'SIGN IN TO CONTINUE'),
            Lottie.asset(
              'assets/animations/signin.json',
              height: h * 0.37,
              width: w * 0.65,
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
                          child:
                          DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              // Ensure selectedLanguage is null or empty initially so that the hint appears
                              value: context
                                      .watch<LanguageProvider>()
                                      .selectedLanguage
                                      .isEmpty
                                  ? null // Show the hint if the value is null or empty
                                  : context
                                      .watch<LanguageProvider>()
                                      .selectedLanguage,
                              hint: text(context, "Select language", 16),
                              items:_languages.asMap().entries.map((entry) {
                                return DropdownMenuItem<String>(
                                  value: _languageCodes[entry.key],  // Get the corresponding language code
                                  child: Text(
                                    entry.value,  // Display the language name
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  context
                                      .read<LanguageProvider>()
                                      .setLanguage(newValue);
                                }
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 45,
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Color(0xffE9F7FF),
                                    border: Border.all(color: color7)),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 25,
                                ),
                                iconSize: 14,
                                iconEnabledColor: Colors.black,
                                iconDisabledColor: Colors.black,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white,
                                ),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness: MaterialStateProperty.all(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          )),
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
                  SizedBox(height: h * 0.03),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.055,
                    child: TextFormField(
                      controller: _mobileController,
                      keyboardType: TextInputType.phone,
                      focusNode: _focusNodePhone,
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly, // Only allow digits
                        LengthLimitingTextInputFormatter(
                            10), // Limit input to 10 digits
                      ],
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
                        focusColor: color1,
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
                      onChanged: (value) {
                        if (value.length == 10) {
                          FocusScope.of(context).requestFocus(FocusNode());
                        }
                      },
                    ),
                  ),
                  if (_validatePhone.isNotEmpty)
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                      width: w * 0.8,
                      child: ShakeWidget(
                        key: Key("value"),
                        duration: Duration(milliseconds: 700),
                        child: Text(
                          _validatePhone,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  else
                    SizedBox(height: 8),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  containertext(
                    context,
                    isLoading: _loading,
                    'GET VERIFICATION CODE',
                    onTap: () {
                      _validateFields();
                    },
                  ),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  InkResponse(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInWithEmail()));
                    },
                    child: Center(
                        child: text(context, 'Sign In with Email', 15,
                            color: color1,
                            fontWeight: FontWeight.w400,
                            textdecoration: TextDecoration.underline,
                            decorationcolor: color1)),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistraionTypes()));
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
}
