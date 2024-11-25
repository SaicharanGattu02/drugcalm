import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import '../Screens/Home.dart';
import '../Services/UserApi.dart';
import '../utils/CustomSnackBar.dart';
import '../utils/ShakeWidget.dart';
import '../utils/constants.dart';
import 'VerificationDetails.dart';

class BasicInformation extends StatefulWidget {
  const BasicInformation({super.key});

  @override
  State<BasicInformation> createState() => _BasicInformationState();
}

class _BasicInformationState extends State<BasicInformation> {
  final TextEditingController _landlineController = TextEditingController();
  final TextEditingController _mobilecontroller = TextEditingController();
  final TextEditingController _ownersnameController = TextEditingController();
  final TextEditingController _businessnameController = TextEditingController();
  final TextEditingController _emailnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _alternatemobileController = TextEditingController();

  String validatelandline = "";
  String validatemobile = "";
  String validatealternatemobile = "";
  String validatefullname = "";
  String validatebusinessname = "";
  String validateemail = "";
  String validatepassword = "";
  bool value = false;

  bool _loading=false;

  void _validateFields() {
    setState(() {
      _loading = true;

      // Validation for landline number
      validatelandline = _landlineController.text.isEmpty || _landlineController.text.length < 10
          ? "Please enter a valid landline number"
          : "";

      // Validation for email
      validateemail = !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
          .hasMatch(_emailnameController.text)
          ? "Please enter a valid email"
          : "";

      // Validation for mobile number
      validatemobile = _mobilecontroller.text.isEmpty || _mobilecontroller.text.length < 10
          ? "Please enter a valid mobile number"
          : "";

      // Validation for alternate mobile number
      validatealternatemobile = _alternatemobileController.text.isEmpty || _alternatemobileController.text.length < 10
          ? "Please enter a valid alternate number"
          : "";

      // Validation for password
      validatepassword = _passwordController.text.isEmpty
          ? "Please enter a password"
          : "";

      // Validation for full name
      validatefullname = _ownersnameController.text.isEmpty
          ? "Please enter your full name"
          : "";

      // Validation for business name
      validatebusinessname = _businessnameController.text.isEmpty
          ? "Please enter your business name"
          : "";

      // Check if all validation fields are empty, indicating successful validation
      if (validatelandline.isEmpty &&
          validateemail.isEmpty &&
          validatemobile.isEmpty &&
          validatealternatemobile.isEmpty &&
          validatepassword.isEmpty &&
          validatefullname.isEmpty &&
          validatebusinessname.isEmpty) {
        // Proceed with the Register API call
        AddBasicDetailsApi();
      } else {
        // Stop the loading state if validations failed
        _loading = false;
      }
    });
  }



  Future<void> AddBasicDetailsApi() async{
      var res = await Userapi.AddBasicDetails(
          _landlineController.text,
          _mobilecontroller.text,
          _alternatemobileController.text,
          _ownersnameController.text,
          _businessnameController.text,
          _emailnameController.text,
          _passwordController.text,
      );
      if (res != null) {
        setState(() {
          if (res.settings?.success == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        VerificationDetails()));
          } else {
            CustomSnackBar.show(context, res.settings?.message ?? "");
          }
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: w,
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Drug Clam Background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: container(
          context,
          colors: color4,
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 10),
          borderRadius: BorderRadius.circular(8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    InkResponse(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: color11,
                        size: 22,
                      ),
                    ),
                    SizedBox(width: w * 0.04),
                    text(
                      context,
                      'Basic Information',
                      20,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: h * 0.17,
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              setState(() {

                              });
                            },
                            viewportFraction: 1,
                          ),
                          items: [
                            BannerImage(),
                            BannerImage(),
                            BannerImage(),
                          ],
                        ),
                        Stack(
                          children: [
                            ClipRRect(
                              child: container(
                                padding: EdgeInsets.all(8),
                                context,
                                w: w,
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  "assets/shop.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 25,
                              right: 25,
                              child: container(
                                context,
                                colors: color4,
                                w: w * 0.08,
                                padding: EdgeInsets.all(4),
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'assets/photo_camera.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              text(context, 'GFX Agency', 20,
                                  fontfamily: 'Poppins',
                                  color: color25,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.center),
                              text(context, 'Hyderabad', 14,
                                  fontfamily: 'Poppins',
                                  color: color26,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: h * 0.03,
                              ),
                            ],
                          ),
                        ),

                        TextFormField(
                          controller: _landlineController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10)
                          ],
                          cursorColor: color11,
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                               validatelandline= "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatelandline = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "Land Line Number",
                            labelStyle:  TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14,
                              letterSpacing: 0,
                              height: 19.36 / 14,
                              color: Color(0xffAFAFAF),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: const Color(0xffffffff),
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
                        if (validatelandline.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validatelandline,
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
                          height: h * 0.01,
                        ),
                        TextFormField(
                          controller: _mobilecontroller,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10)
                          ],
                          cursorColor: color11,
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatemobile= "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatemobile = "";
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "Mobile Number",
                            labelStyle:  TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14,
                              letterSpacing: 0,
                              height: 19.36 / 14,
                              color: Color(0xffAFAFAF),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            filled: true,
                            fillColor: const Color(0xffffffff),
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
                        if (validatemobile.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                            EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
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
                          height: h * 0.01,
                        ),
                        TextFormField(
                          controller: _ownersnameController,
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')), // Allow only alphabets and spaces
                          ],
                          cursorColor: color11,
                          onTap: () {
                            setState(() {
                              validatefullname = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatefullname = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            labelText: "Owner’s Name",
                            labelStyle: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14,
                              letterSpacing: 0,
                              height: 19.36 / 14,
                              color: Color(0xffAFAFAF),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: const Color(0xffffffff),
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
                        ),
                        if (validatefullname.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validatefullname,
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
                          height: h * 0.01,
                        ),
                        TextFormField(
                          controller: _businessnameController,
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')), // Allow only alphabets and spaces
                          ],
                          cursorColor: color11,
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatebusinessname = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatebusinessname = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "Business Name",
                            labelStyle:  TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14,
                              letterSpacing: 0,
                              height: 19.36 / 14,
                              color: Color(0xffAFAFAF),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: const Color(0xffffffff),
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
                        if (validatebusinessname.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validatebusinessname,
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
                          height: h * 0.01,
                        ),
                        TextFormField(
                          controller: _emailnameController,
                          keyboardType: TextInputType.text,
                          cursorColor: color11,
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validateemail = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validateemail = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "Email Address",
                            labelStyle:  TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14,
                              letterSpacing: 0,
                              height: 19.36 / 14,
                              color: Color(0xffAFAFAF),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: const Color(0xffffffff),
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
                        if (validateemail.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validateemail,
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
                          height: h * 0.01,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          cursorColor: color11,
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatepassword = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatepassword = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "Password",
                            labelStyle:  TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14,
                              letterSpacing: 0,
                              height: 19.36 / 14,
                              color: Color(0xffAFAFAF),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: const Color(0xffffffff),
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
                        if (validatepassword.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validatepassword,
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
                          height: h * 0.01,
                        ),
                        TextFormField(
                          controller: _alternatemobileController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10)
                          ],
                          cursorColor: color11,
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatealternatemobile = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatealternatemobile = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "Alternate Phone Number",
                            labelStyle:  TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14,
                              letterSpacing: 0,
                              height: 19.36 / 14,
                              color: Color(0xffAFAFAF),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: const Color(0xffffffff),
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
                        if (validatealternatemobile.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validatealternatemobile,
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
                          height: h * 0.01,
                        ),
                        text(
                          context,
                          'Account Agreements',
                          16,
                          fontfamily: 'Inter',
                          color: color11,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: color1,
                              value: value,
                              visualDensity: VisualDensity.compact,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  value = newValue ?? false;
                                });
                              },
                            ),
                            text(
                              context,
                              'I agree to the Terms & Conditions',
                              color: color11,
                              12,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: color1,
                              value: value,
                              visualDensity: VisualDensity.compact,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  value = newValue ?? false;
                                });
                              },
                            ),
                            text(
                              context,
                              'I agree to the Terms of Services',
                              color: color11,
                              12,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: color1,
                              value: value,
                              visualDensity: VisualDensity.compact,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  value = newValue ?? false;
                                });
                              },
                            ),
                            text(
                              context,
                              'I consent to the Data Privacy Agreement',
                              color: color11,
                              12,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        text(
                          context,
                          'Notification Preferences',
                          16,
                          fontfamily: 'Inter',
                          color: color11,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: color1,
                              value: value,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  value = newValue ?? false;
                                });
                              },
                            ),
                            SizedBox(
                              width: w * 0.75,
                              child: text(
                                context,
                                'Email Notifications – Receive updates via email',
                                color: color11,
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: color1,
                              value: value,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  value = newValue ?? false;
                                });
                              },
                            ),
                            SizedBox(
                              width: w * 0.75,
                              child: text(
                                context,
                                'Push Notifications – Allow app notifications',
                                12,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            InkResponse(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: w * 0.43,
                decoration: BoxDecoration(
                  color: Color(0xffF8FCFF),
                  border: Border.all(
                    color: color1,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    'BACK',
                    style: TextStyle(
                      color: color1,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            containertext1(context, width: w * 0.43, 'CONTINUE', onTap: () {
              _validateFields();
            }),
            // InkResponse(
            //   onTap: () {
            //     _validateFields();
            //   },
            //   child: Container(
            //     height: 40,
            //     width: w * 0.43,
            //     decoration: BoxDecoration(
            //       color: color1,
            //       border: Border.all(
            //         color: color1,
            //         width: 1.0,
            //       ),
            //       borderRadius: BorderRadius.circular(7),
            //     ),
            //     child: Center(
            //       child: Text(
            //         'CONTINUE',
            //         style: TextStyle(
            //           color: color4,
            //           fontSize: 16.0,
            //           fontWeight: FontWeight.w700,
            //           fontFamily: 'Inter',
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
