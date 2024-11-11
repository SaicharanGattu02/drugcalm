import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../Screens/Home.dart';
import '../utils/ShakeWidget.dart';
import '../utils/constants.dart';
import 'VerificationDetails.dart';

class BasicInformation extends StatefulWidget {
  const BasicInformation({super.key});

  @override
  State<BasicInformation> createState() => _BasicInformationState();
}

class _BasicInformationState extends State<BasicInformation> {
  final TextEditingController _businessRegistraionController =
      TextEditingController();
  final TextEditingController _expiryController = TextEditingController();

  String validatebusinessRegistraion = "";
  String validateexpiry = "";
  bool value = false;

  String selectedOption = "Allopathy/Pharmaceutical";
  final List<String> dropdownOptions = [
    "Allopathy/Pharmaceutical",
    "Ayurvedic/Herbal",
    "Veterinary",
    "OTC General",
    "Surgical"
  ];
  int currentIndex = 0;
  Future<void> pickFile() async {
    // Using file_picker to pick a file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'png',
        'jpeg',
        'pdf'
      ], // Adjust allowed file types
    );

    if (result != null) {
      // You can handle the file here (e.g., save the path, upload it, etc.)
      String? filePath = result.files.single.path;
      setState(() {
        _businessRegistraionController.text = filePath ??
            "No file selected"; // For now, just display the file path
      });
    } else {
      // User canceled the picker
      setState(() {
        _businessRegistraionController.text = "";
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
                              currentIndex = index;
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
                      text(context, 'GFX Agency', 20,
                          fontfamily: 'Poppins',
                          color: color25,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      text(context, 'Hyderabad', 14,
                          fontfamily: 'Poppins',
                          color: color26,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.050,
                        child: TextFormField(
                          controller: _businessRegistraionController,
                          keyboardType: TextInputType.text,
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            hintText: "Land Line Number",
                            hintStyle: TextStyle(
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
                      ),
                      if (validatebusinessRegistraion.isNotEmpty) ...[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ShakeWidget(
                            key: Key("value"),
                            duration: Duration(milliseconds: 700),
                            child: Text(
                              validatebusinessRegistraion,
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
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          items: dropdownOptions.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Row(
                                children: [
                                  Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          value: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                              print("Business Name:${selectedOption}");
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 45,
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                border: Border.all(color: Color(0xffD0CBDB)),
                                color: Color(0xffffffFF)),
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
                            width: w * 0.88,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all(6),
                              thumbVisibility: MaterialStateProperty.all(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.050,
                        child: TextFormField(
                          controller: _businessRegistraionController,
                          keyboardType: TextInputType.text,
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            hintText: "Primary Contact",
                            hintStyle: TextStyle(
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
                      ),
                      if (validatebusinessRegistraion.isNotEmpty) ...[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ShakeWidget(
                            key: Key("value"),
                            duration: Duration(milliseconds: 700),
                            child: Text(
                              validatebusinessRegistraion,
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
                      Container(
                        height: MediaQuery.of(context).size.height * 0.050,
                        child: TextFormField(
                          controller: _businessRegistraionController,
                          keyboardType: TextInputType.text,
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            hintText: "Owner’s Name",
                            hintStyle: TextStyle(
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
                      ),
                      if (validatebusinessRegistraion.isNotEmpty) ...[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ShakeWidget(
                            key: Key("value"),
                            duration: Duration(milliseconds: 700),
                            child: Text(
                              validatebusinessRegistraion,
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
                      Container(
                        height: MediaQuery.of(context).size.height * 0.050,
                        child: TextFormField(
                          controller: _businessRegistraionController,
                          keyboardType: TextInputType.text,
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            hintText: "Mobile Number",
                            hintStyle: TextStyle(
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
                      ),
                      if (validatebusinessRegistraion.isNotEmpty) ...[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ShakeWidget(
                            key: Key("value"),
                            duration: Duration(milliseconds: 700),
                            child: Text(
                              validatebusinessRegistraion,
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
                      Container(
                        height: MediaQuery.of(context).size.height * 0.050,
                        child: TextFormField(
                          controller: _businessRegistraionController,
                          keyboardType: TextInputType.text,
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            hintText: "Email Address",
                            hintStyle: TextStyle(
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
                      ),
                      if (validatebusinessRegistraion.isNotEmpty) ...[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ShakeWidget(
                            key: Key("value"),
                            duration: Duration(milliseconds: 700),
                            child: Text(
                              validatebusinessRegistraion,
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
                      Container(
                        height: MediaQuery.of(context).size.height * 0.050,
                        child: TextFormField(
                          controller: _businessRegistraionController,
                          keyboardType: TextInputType.text,
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            hintText: "Password",
                            hintStyle: TextStyle(
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
                      ),
                      if (validatebusinessRegistraion.isNotEmpty) ...[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ShakeWidget(
                            key: Key("value"),
                            duration: Duration(milliseconds: 700),
                            child: Text(
                              validatebusinessRegistraion,
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
                      Container(
                        height: MediaQuery.of(context).size.height * 0.050,
                        child: TextFormField(
                          controller: _businessRegistraionController,
                          keyboardType: TextInputType.text,
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            hintText: "Alternate Phone Number",
                            hintStyle: TextStyle(
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
                      ),
                      if (validatebusinessRegistraion.isNotEmpty) ...[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ShakeWidget(
                            key: Key("value"),
                            duration: Duration(milliseconds: 700),
                            child: Text(
                              validatebusinessRegistraion,
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
                      Container(
                        height: MediaQuery.of(context).size.height * 0.050,
                        child: TextFormField(
                          controller: _businessRegistraionController,
                          keyboardType: TextInputType.text,
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            // closeDropdown(); // You can handle dropdown close here if needed
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            hintText: "Shop Image",
                            hintStyle: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14,
                              letterSpacing: 0,
                              height: 19.36 / 14,
                              color: Color(0xffAFAFAF),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            suffixIcon: GestureDetector(
                              onTap: pickFile, // Trigger file picker on tap
                              child: Icon(
                                Icons.cloud_upload_sharp,
                                color: color1, // Color of the icon
                              ),
                            ),
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
                      ),
                      if (validatebusinessRegistraion.isNotEmpty) ...[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ShakeWidget(
                            key: Key("value"),
                            duration: Duration(milliseconds: 700),
                            child: Text(
                              validatebusinessRegistraion,
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
                      Container(
                        height: MediaQuery.of(context).size.height * 0.050,
                        child: TextFormField(
                          controller: _businessRegistraionController,
                          keyboardType: TextInputType.text,
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            // closeDropdown(); // You can handle dropdown close here if needed
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatebusinessRegistraion = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            hintText: "Location",
                            hintStyle: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14,
                              letterSpacing: 0,
                              height: 19.36 / 14,
                              color: Color(0xffAFAFAF),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            suffixIcon: GestureDetector(
                              onTap: pickFile, // Trigger file picker on tap
                              child: Icon(
                                Icons.location_searching_sharp,
                                size: 18, // Color of the icon
                              ),
                            ),
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
                      ),
                      if (validatebusinessRegistraion.isNotEmpty) ...[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ShakeWidget(
                            key: Key("value"),
                            duration: Duration(milliseconds: 700),
                            child: Text(
                              validatebusinessRegistraion,
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
                            onChanged: (bool? newValue) {
                              setState(() {
                                value = newValue ?? false;
                              });
                            },
                          ),
                          text(
                            context,
                            'I agree to the Terms & Conditions',color:color11,
                            12,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                      SizedBox(height: 15),
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
                          text(
                            context,
                            'I agree to the Terms of Services',color:color11,
                            12,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                      SizedBox(height: 15),
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
                          text(
                            context,
                            'I consent to the Data Privacy Agreement',color:color11,
                            12,
                            fontWeight: FontWeight.w400,
                          ),

                        ],
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      text(
                        context,
                        'Notification Preferences',
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
                            onChanged: (bool? newValue) {
                              setState(() {
                                value = newValue ?? false;
                              });
                            },
                          ),
                          SizedBox(width: w*0.75,
                            child: text(
                              context,
                              'Email Notifications – Receive updates via email',color:color11,textAlign: TextAlign.left,
                              maxLines: 2,
                              12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),



                    ],
                  ),
                      SizedBox(height: 15),
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
                          SizedBox(width: w*0.75,
                            child: text(
                              context,
                              'Push Notifications – Allow app notifications',
                              12,
                              fontWeight: FontWeight.w400,textAlign: TextAlign.left,
                            ),
                          ),

                        ],
                      ),

                    ]
                ),
              ),),
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
            InkResponse(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>VerificationDetails()));
              },
              child: Container(
                height: 40,
                width: w * 0.43,
                decoration: BoxDecoration(
                  color: color1,
                  border: Border.all(
                    color:color1,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child:  Text(
                    'CONTINUE',
                    style: TextStyle(
                      color: color4,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
