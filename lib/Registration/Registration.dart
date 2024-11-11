import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../utils/ShakeWidget.dart';
import 'BusinessDetails.dart';

class RegistraionTypes extends StatefulWidget {
  const RegistraionTypes({super.key});

  @override
  State<RegistraionTypes> createState() => _RegistraionTypesState();
}

class _RegistraionTypesState extends State<RegistraionTypes> {
  final TextEditingController _retailerController = TextEditingController();
  final TextEditingController _supplierController = TextEditingController();
  final TextEditingController _deliveryController = TextEditingController();
  final TextEditingController _bankInfoController = TextEditingController();
  final TextEditingController _bankDetailController = TextEditingController();
  final TextEditingController _UpiController = TextEditingController();
  final TextEditingController _referalInfoController = TextEditingController();
  final TextEditingController _referalCodeController = TextEditingController();
  final TextEditingController _shopImageController = TextEditingController();
  final TextEditingController _loctaingController = TextEditingController();

  String validateretail = "";
  String validatesupplier = "";
  String validatedelivery = "";
  String validatebankInfo = "";
  String validatebankDetails = "";
  String validateUpi = "";
  String validatereferalInfo = "";
  String validatereferalCode = "";
  String validateshopImage = "";
  String validatelocation = "";
  String? fileName; // To store the name of the selected file
  String? filePath;
  bool check = false;
  String selectedOption = "Allopathy/Pharmaceutical";
  final List<String> dropdownOptions = [
    "Allopathy/Pharmaceutical",
    "Ayurvedic/Herbal",
    "Veterinary",
    "OTC General",
    "Surgical"
  ];
  int? _groupValue = 1;
  void _onChanged(int? value) {
    setState(() {
      _groupValue = value; // Update selected value
    });
  }

  // Method to pick a file
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple:
          false, // Set to true if you want to allow multiple file selections
      type: FileType
          .any, // You can specify the file types you want to allow (e.g. FileType.custom, FileType.image)
    );

    if (result != null) {
      // Get the first selected file
      PlatformFile file = result.files.first;

      setState(() {
        fileName = file.name; // Set the file name
        filePath = file.path; // Set the file path
      });
    } else {
      // User canceled the file picker
      print('No file selected');
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
                    image: AssetImage(
                      'assets/Drug Clam Background.png',
                    ),
                    fit: BoxFit.cover)),
            child: container(
              context,
              colors: color4,
              padding: EdgeInsets.symmetric(vertical: 24),
              borderRadius: BorderRadius.circular(8),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: color11,
                          size: 22,
                        ),
                        SizedBox(
                          width: w * 0.04,
                        ),
                        text(
                          context,
                          'RETAILER',
                          20,
                          fontWeight: FontWeight.w700,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: color1,
                                              value: 1,
                                              groupValue: _groupValue,
                                              onChanged: _onChanged),
                                          text(context, 'Retailers',
                                              _groupValue == 1 ?  14 : 12,
                                              fontWeight: _groupValue == 1
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: color18),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: color1,
                                              value: 3,
                                              groupValue: _groupValue,
                                              onChanged: _onChanged),
                                          text(context, 'FMGG Distributors',
                                              _groupValue == 3 ?  14 : 12,
                                              fontWeight: _groupValue == 3
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: color18),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: color1,
                                              value: 5,
                                              groupValue: _groupValue,
                                              onChanged: _onChanged),
                                          text(context, 'Ingredients',
                                              _groupValue == 5 ?  14 : 12,
                                              fontWeight: _groupValue == 5
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: color18),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: color1,
                                              value: 7,
                                              groupValue: _groupValue,
                                              onChanged: _onChanged),
                                          text(context, 'Medical Equipments',
                                              _groupValue == 7 ?  14 : 12,
                                              fontWeight: _groupValue == 7
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: color18),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: color1,
                                              value: 9,
                                              groupValue: _groupValue,
                                              onChanged: _onChanged),
                                          text(context, 'Cosmetics Stores',
                                              _groupValue == 9 ?  14 : 12,
                                              fontWeight: _groupValue == 9
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: color18),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: color1,
                                              value: 11,
                                              groupValue: _groupValue,
                                              onChanged: _onChanged),
                                          text(context, 'Diagnostic Lab',
                                              _groupValue == 11 ?  14 : 12,
                                              fontWeight: _groupValue == 11
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: color18),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: color1,
                                              value: 13,
                                              groupValue: _groupValue,
                                              onChanged: _onChanged),
                                          text(context, 'Disnfects/Cleaning',
                                              _groupValue == 13 ?  14 : 12,
                                              fontWeight: _groupValue == 13
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: color18),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: w * 0.01,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: color1,
                                              value: 2,
                                              groupValue: _groupValue,
                                              onChanged: _onChanged),
                                          text(context, 'Wholesalers',
                                              _groupValue == 2 ? 14 : 12,
                                              fontWeight: _groupValue == 2
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: color18),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: color1,
                                              value: 4,
                                              groupValue: _groupValue,
                                              onChanged: _onChanged),
                                          SizedBox(
                                            width: w * 0.01,
                                          ),
                                          text(context, 'Hospitals',
                                              _groupValue == 4 ? 14 : 12,
                                              fontWeight: _groupValue == 4
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: color18),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: color1,
                                              value: 6,
                                              groupValue: _groupValue,
                                              onChanged: _onChanged),
                                          text(context, 'Vaccines',
                                              _groupValue == 6 ? 14 : 12,
                                              fontWeight: _groupValue == 6
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: color18),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: color1,
                                              value: 8,
                                              groupValue: _groupValue,
                                              onChanged: _onChanged),
                                          text(context, 'Clinics',
                                              _groupValue == 8 ?  14 : 12,
                                              fontWeight: _groupValue == 8
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: color18),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: color1,
                                              value: 10,
                                              groupValue: _groupValue,
                                              onChanged: _onChanged),
                                          text(context, 'General Stores',
                                              _groupValue == 10 ?  14 : 12,
                                              fontWeight: _groupValue == 10
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: color18),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: color1,
                                              value: 12,
                                              groupValue: _groupValue,
                                              onChanged: _onChanged),
                                          text(context, 'Diagnostic',
                                              _groupValue == 12 ?  14 : 12,
                                              fontWeight: _groupValue == 12
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: color18),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: color1,
                                              value: 14,
                                              groupValue: _groupValue,
                                              onChanged: _onChanged),
                                          text(context, 'Others',
                                              _groupValue == 14 ?  14 : 12,
                                              fontWeight: _groupValue == 14
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: color18),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          if (_groupValue == 1) ...[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Column(
                                children: [
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
                                          print(
                                              "Selected Option:${selectedOption}");
                                        });
                                      },
                                      buttonStyleData: ButtonStyleData(
                                        height: 45,
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            left: 14, right: 14),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                            border: Border.all(
                                                color: Color(0xffD0CBDB)),
                                            color: color4),
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
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: Colors.white,
                                        ),
                                        scrollbarTheme: ScrollbarThemeData(
                                          radius: const Radius.circular(40),
                                          thickness:
                                              MaterialStateProperty.all(6),
                                          thumbVisibility:
                                              MaterialStateProperty.all(true),
                                        ),
                                      ),
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        height: 40,
                                        padding: EdgeInsets.only(
                                            left: 14, right: 14),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.050,
                                    child: TextFormField(
                                      controller: _retailerController,
                                      keyboardType: TextInputType.text,
                                      cursorColor: Color(0xff8856F4),
                                      onTap: () {
                                        // closeDropdown();
                                        setState(() {
                                          validateretail = "";
                                        });
                                      },
                                      onChanged: (v) {
                                        setState(() {
                                          validateretail = "";
                                        });
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        hintText:
                                            "Retailer-Specific Information",
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
                                        fillColor:color4,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                      ),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                    ),
                                  ),
                                  if (validateretail.isNotEmpty) ...[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(
                                          left: 8, bottom: 10, top: 5),
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: ShakeWidget(
                                        key: Key("value"),
                                        duration: Duration(milliseconds: 700),
                                        child: Text(
                                          validateretail,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.050,
                                    child: TextFormField(
                                      controller: _supplierController,
                                      keyboardType: TextInputType.text,
                                      cursorColor: Color(0xff8856F4),
                                      onTap: () {
                                        // closeDropdown();
                                        setState(() {
                                          validatesupplier = "";
                                        });
                                      },
                                      onChanged: (v) {
                                        setState(() {
                                          validatesupplier = "";
                                        });
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        hintText:
                                            "Preferred Suppliers/Distributors",
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
                                        fillColor: color4,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                      ),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                    ),
                                  ),
                                  if (validatesupplier.isNotEmpty) ...[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(
                                          left: 8, bottom: 10, top: 5),
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: ShakeWidget(
                                        key: Key("value"),
                                        duration: Duration(milliseconds: 700),
                                        child: Text(
                                          validatesupplier,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.050,
                                    child: TextFormField(
                                      controller: _deliveryController,
                                      keyboardType: TextInputType.text,
                                      cursorColor: Color(0xff8856F4),
                                      onTap: () {
                                        // closeDropdown();
                                        setState(() {
                                          validatedelivery = "";
                                        });
                                      },
                                      onChanged: (v) {
                                        setState(() {
                                          validatedelivery = "";
                                        });
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        hintText: "Delivery Preferences",
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
                                        fillColor: color4,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                      ),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                    ),
                                  ),
                                  if (validatedelivery.isNotEmpty) ...[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(
                                          left: 8, bottom: 10, top: 5),
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: ShakeWidget(
                                        key: Key("value"),
                                        duration: Duration(milliseconds: 700),
                                        child: Text(
                                          validatedelivery,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.050,
                                    child: TextFormField(
                                      controller: _bankInfoController,
                                      keyboardType: TextInputType.text,
                                      cursorColor: Color(0xff8856F4),
                                      onTap: () {
                                        // closeDropdown();
                                        setState(() {
                                          validatebankInfo = "";
                                        });
                                      },
                                      onChanged: (v) {
                                        setState(() {
                                          validatebankInfo = "";
                                        });
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        hintText: "Banking Information",
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
                                        fillColor: color4,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                      ),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                    ),
                                  ),
                                  if (validatebankInfo.isNotEmpty) ...[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(
                                          left: 8, bottom: 10, top: 5),
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: ShakeWidget(
                                        key: Key("value"),
                                        duration: Duration(milliseconds: 700),
                                        child: Text(
                                          validatebankInfo,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.050,
                                    child: TextFormField(
                                      controller: _bankDetailController,
                                      keyboardType: TextInputType.text,
                                      cursorColor: Color(0xff8856F4),
                                      onTap: () {
                                        // closeDropdown();
                                        setState(() {
                                          validatebankDetails = "";
                                        });
                                      },
                                      onChanged: (v) {
                                        setState(() {
                                          validatebankDetails = "";
                                        });
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        hintText: "Bank Account Details",
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
                                        fillColor: color4,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                      ),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                    ),
                                  ),
                                  if (validatebankDetails.isNotEmpty) ...[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(
                                          left: 8, bottom: 10, top: 5),
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: ShakeWidget(
                                        key: Key("value"),
                                        duration: Duration(milliseconds: 700),
                                        child: Text(
                                          validatebankDetails,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.050,
                                    child: TextFormField(
                                      controller: _UpiController,
                                      keyboardType: TextInputType.text,
                                      cursorColor: Color(0xff8856F4),
                                      onTap: () {
                                        // closeDropdown();
                                        setState(() {
                                          validateUpi = "";
                                        });
                                      },
                                      onChanged: (v) {
                                        setState(() {
                                          validateUpi = "";
                                        });
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        hintText: "UPI ID",
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
                                        fillColor:color4,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                      ),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                    ),
                                  ),
                                  if (validateUpi.isNotEmpty) ...[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(
                                          left: 8, bottom: 10, top: 5),
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: ShakeWidget(
                                        key: Key("value"),
                                        duration: Duration(milliseconds: 700),
                                        child: Text(
                                          validateUpi,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.050,
                                    child: TextFormField(
                                      controller: _referalInfoController,
                                      keyboardType: TextInputType.text,
                                      cursorColor: Color(0xff8856F4),
                                      onTap: () {
                                        // closeDropdown();
                                        setState(() {
                                          validatereferalInfo = "";
                                        });
                                      },
                                      onChanged: (v) {
                                        setState(() {
                                          validatereferalInfo = "";
                                        });
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        hintText:
                                            "Referral Information(optional)",
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
                                        fillColor: color4,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                      ),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                    ),
                                  ),
                                  if (validatereferalInfo.isNotEmpty) ...[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(
                                          left: 8, bottom: 10, top: 5),
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: ShakeWidget(
                                        key: Key("value"),
                                        duration: Duration(milliseconds: 700),
                                        child: Text(
                                          validatereferalInfo,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.050,
                                    child: TextFormField(
                                      controller: _referalCodeController,
                                      keyboardType: TextInputType.text,
                                      cursorColor: Color(0xff8856F4),
                                      onTap: () {
                                        // closeDropdown();
                                        setState(() {
                                          validatereferalCode = "";
                                        });
                                      },
                                      onChanged: (v) {
                                        setState(() {
                                          validatereferalCode = "";
                                        });
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        hintText: "Referral Code",
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
                                        fillColor: color4,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xffd0cbdb)),
                                        ),
                                      ),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                    ),
                                  ),
                                  if (validatereferalCode.isNotEmpty) ...[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(
                                          left: 8, bottom: 10, top: 5),
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: ShakeWidget(
                                        key: Key("value"),
                                        duration: Duration(milliseconds: 700),
                                        child: Text(
                                          validatereferalCode,
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

                                ],
                              ),
                            ),
                          ]
                          else ...[
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
                                    print("Selected Option:${selectedOption}");
                                  });
                                },
                                buttonStyleData: ButtonStyleData(
                                  height: 45,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 14, right: 14),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      border:
                                          Border.all(color: Color(0xffD0CBDB)),
                                      color: Color(0xffFfffFF)),
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
                                    thumbVisibility:
                                        MaterialStateProperty.all(true),
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
                              height:
                                  MediaQuery.of(context).size.height * 0.050,
                              child: TextFormField(
                                controller: _referalCodeController,
                                keyboardType: TextInputType.text,
                                cursorColor: Color(0xff8856F4),
                                onTap: () {
                                  // closeDropdown();
                                  setState(() {
                                    validatereferalCode = "";
                                  });
                                },
                                onChanged: (v) {
                                  setState(() {
                                    validatereferalCode = "";
                                  });
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  hintText: "PREM Type",
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
                                  fillColor: color4,
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
                            if (validatereferalCode.isNotEmpty) ...[
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(
                                    left: 8, bottom: 10, top: 5),
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: ShakeWidget(
                                  key: Key("value"),
                                  duration: Duration(milliseconds: 700),
                                  child: Text(
                                    validatereferalCode,
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

                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.050,
                              child: TextFormField(
                                controller: _referalCodeController,
                                keyboardType: TextInputType.text,
                                cursorColor: Color(0xff8856F4),
                                onTap: () {
                                  // closeDropdown();
                                  setState(() {
                                    validatereferalCode = "";
                                  });
                                },
                                onChanged: (v) {
                                  setState(() {
                                    validatereferalCode = "";
                                  });
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  hintText: "Store Name",
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
                                  fillColor: color4,
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
                            if (validatereferalCode.isNotEmpty) ...[
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(
                                    left: 8, bottom: 10, top: 5),
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: ShakeWidget(
                                  key: Key("value"),
                                  duration: Duration(milliseconds: 700),
                                  child: Text(
                                    validatereferalCode,
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

                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.050,
                              child: TextFormField(
                                controller: _shopImageController,
                                keyboardType: TextInputType.text,
                                cursorColor: Color(0xff8856F4),
                                onTap: () {
                                  // closeDropdown(); // You can handle dropdown close here if needed
                                  setState(() {
                                    // validatebusinessRegistraion = "";
                                  });
                                },
                                onChanged: (v) {
                                  setState(() {
                                    // validatebusinessRegistraion = "";
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
                                      onTap:
                                          pickFile, // Trigger file picker on tap
                                      child: Icon(
                                        Icons.cloud_upload_sharp,
                                        color: color1,
                                      )),
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
                            if (validateshopImage.isNotEmpty) ...[
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(
                                    left: 8, bottom: 10, top: 5),
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: ShakeWidget(
                                  key: Key("value"),
                                  duration: Duration(milliseconds: 700),
                                  child: Text(
                                    'Upload Shop Images',
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
                                controller:_loctaingController,
                                keyboardType: TextInputType.text,
                                cursorColor: Color(0xff8856F4),
                                onTap:(){
                                  // closeDropdown();
                                  setState(() {
                                    validatelocation="";
                                  });
                                },
                                onChanged: (v){
                                  setState(() {
                                    validatelocation="";
                                  });
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                  hintText: "Geolocation",
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
                                  suffixIcon: Icon(Icons.location_searching_sharp,size: 18,),
                                  fillColor: const Color(0xffFCFAFF),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide:
                                    const BorderSide(width: 1, color: Color(0xffd0cbdb)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide:
                                    const BorderSide(width: 1, color: Color(0xffd0cbdb)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide:
                                    const BorderSide(width: 1, color: Color(0xffd0cbdb)),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide:
                                    const BorderSide(width: 1, color: Color(0xffd0cbdb)),
                                  ),
                                ),
                                textAlignVertical: TextAlignVertical.center,
                              ),
                            ),
                            if (validatelocation.isNotEmpty) ...[
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: ShakeWidget(
                                  key: Key("value"),
                                  duration: Duration(milliseconds: 700),
                                  child: Text(
                                    validatelocation,
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
                          ],


                          SizedBox(
                            height: h * 0.01,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  activeColor: color1,
                                  value: check,
                                  onChanged: (bool? newvalue) {
                                    setState(() {
                                      check = newvalue ?? false;
                                    });
                                  }),
                              SizedBox(
                                width: w * 0.74,
                                child: text(
                                    context,
                                    'By logging in, you agree to our Terms, Privacy Policy, and medical disclaimer.',
                                    textAlign: TextAlign.left,
                                    12,
                                    fontWeight: FontWeight.w400,
                                    color: color11),
                              )
                            ],
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          containertext1(context, 'CONTINUE',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BusinessDetails()));
                              })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
