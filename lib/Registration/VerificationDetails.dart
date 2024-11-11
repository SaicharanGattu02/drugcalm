import 'package:drugcalm/Authentication/SignInWithEmail.dart';
import 'package:drugcalm/Screens/dashboard.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../utils/ShakeWidget.dart';
import '../utils/constants.dart';

class VerificationDetails extends StatefulWidget {
  const VerificationDetails({super.key});

  @override
  State<VerificationDetails> createState() => _VerificationDetailsState();
}

class _VerificationDetailsState extends State<VerificationDetails> {
  final TextEditingController _businessRegistraionController =
      TextEditingController();
  final TextEditingController _expiryController = TextEditingController();

  String validatebusinessRegistraion = "";
  String? fileName; // To store the name of the selected file
  String? filePath; // To store the path of the selected file

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
                image: AssetImage('assets/Drug Clam Background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: container(context,
                colors: color4,
                margin: EdgeInsets.symmetric(horizontal: 8),
                borderRadius: BorderRadius.circular(8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                            'Verification Documents',
                            20,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child:
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: h * 0.01,
                              ),
                              text(
                                  context, 'Business Registration Document', 16,
                                  color: color18,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.050,
                                child: TextFormField(
                                  controller: _businessRegistraionController,
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
                                    hintText: "Upload Documents",
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
                                      child: container(context,
                                          padding: EdgeInsets.all(4),
                                          margin: EdgeInsets.all(6),
                                          colors: color1,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: text(
                                            context,
                                            color: color4,
                                            'Upload',
                                            14,
                                            fontWeight: FontWeight.w400,
                                          )),
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
                                  margin: EdgeInsets.only(
                                      left: 8, bottom: 10, top: 5),
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: ShakeWidget(
                                    key: Key("value"),
                                    duration: Duration(milliseconds: 700),
                                    child: Text(
                                      'Upload Documents',
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

                              text(
                                  context, 'Drug License', 16,
                                  color: color18,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              Container(
                                height:
                                MediaQuery.of(context).size.height * 0.050,
                                child: TextFormField(
                                  controller: _businessRegistraionController,
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
                                    hintText: "Upload Drug License",
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
                                      child: container(context,
                                          padding: EdgeInsets.all(4),
                                          margin: EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                                          colors: color1,
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          child: text(
                                            context,
                                            color: color4,
                                            'Upload',
                                            14,
                                            fontWeight: FontWeight.w400,
                                          )),
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
                                  margin: EdgeInsets.only(
                                      left: 8, bottom: 10, top: 5),
                                  width:
                                  MediaQuery.of(context).size.width * 0.6,
                                  child: ShakeWidget(
                                    key: Key("value"),
                                    duration: Duration(milliseconds: 700),
                                    child: Text(
                                      'Upload Documents',
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
                                  context, 'GST Certificate', 16,
                                  color: color18,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center),


                              Container(
                                height:
                                MediaQuery.of(context).size.height * 0.050,
                                child: TextFormField(
                                  controller: _businessRegistraionController,
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
                                    hintText: "Upload GST Certificate",
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
                                      child: container(context,
                                          padding: EdgeInsets.all(4),
                                          margin: EdgeInsets.all(6),
                                          colors: color1,
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          child: text(
                                            context,
                                            color: color4,
                                            'Upload',
                                            14,
                                            fontWeight: FontWeight.w400,
                                          )),
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
                                  margin: EdgeInsets.only(
                                      left: 8, bottom: 10, top: 5),
                                  width:
                                  MediaQuery.of(context).size.width * 0.6,
                                  child: ShakeWidget(
                                    key: Key("value"),
                                    duration: Duration(milliseconds: 700),
                                    child: Text(
                                      'Upload Documents',
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
                                  context, 'Proof of Address', 16,
                                  color: color18,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center),


                              Container(
                                height:
                                MediaQuery.of(context).size.height * 0.050,
                                child: TextFormField(
                                  controller: _businessRegistraionController,
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
                                    hintText: "Upload Proof of Address",
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
                                      child: container(context,
                                          padding: EdgeInsets.all(4),
                                          margin: EdgeInsets.all(6),
                                          colors: color1,
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          child: text(
                                            context,
                                            color: color4,
                                            'Upload',
                                            14,
                                            fontWeight: FontWeight.w400,
                                          )),
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
                                  margin: EdgeInsets.only(
                                      left: 8, bottom: 10, top: 5),
                                  width:
                                  MediaQuery.of(context).size.width * 0.6,
                                  child: ShakeWidget(
                                    key: Key("value"),
                                    duration: Duration(milliseconds: 700),
                                    child: Text(
                                      'Upload Documents',
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
                                  context, "Owner's ID Proof", 16,
                                  color: color18,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center),


                              Container(
                                height:
                                MediaQuery.of(context).size.height * 0.050,
                                child: TextFormField(
                                  controller: _businessRegistraionController,
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
                                    hintText: "Upload Owner's ID Proof",
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
                                      child: container(context,
                                          padding: EdgeInsets.all(4),
                                          margin: EdgeInsets.all(6),
                                          colors: color1,
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          child: text(
                                            context,
                                            color: color4,
                                            'Upload',
                                            14,
                                            fontWeight: FontWeight.w400,
                                          )),
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
                                  margin: EdgeInsets.only(
                                      left: 8, bottom: 10, top: 5),
                                  width:
                                  MediaQuery.of(context).size.width * 0.6,
                                  child: ShakeWidget(
                                    key: Key("value"),
                                    duration: Duration(milliseconds: 700),
                                    child: Text(
                                      'Upload Documents',
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
                              ), text(
                                  context, "Municipal Certificate", 16,
                                  color: color18,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center),


                              Container(
                                height:
                                MediaQuery.of(context).size.height * 0.050,
                                child: TextFormField(
                                  controller: _businessRegistraionController,
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
                                    hintText: "Upload municipal certificate",
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
                                      child: container(context,
                                          padding: EdgeInsets.all(4),
                                          margin: EdgeInsets.all(6),
                                          colors: color1,
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          child: text(
                                            context,
                                            color: color4,
                                            'Upload',
                                            14,
                                            fontWeight: FontWeight.w400,
                                          )),
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
                                  margin: EdgeInsets.only(
                                      left: 8, bottom: 10, top: 5),
                                  width:
                                  MediaQuery.of(context).size.width * 0.6,
                                  child: ShakeWidget(
                                    key: Key("value"),
                                    duration: Duration(milliseconds: 700),
                                    child: Text(
                                      'Upload Documents',
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
                                  context, "Self Pan", 16,
                                  color: color18,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center),


                              Container(
                                height:
                                MediaQuery.of(context).size.height * 0.050,
                                child: TextFormField(
                                  controller: _businessRegistraionController,
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
                                    hintText: "Upload Self Pan",
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
                                      child: container(context,
                                          padding: EdgeInsets.all(4),
                                          margin: EdgeInsets.all(6),
                                          colors: color1,
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          child: text(
                                            context,
                                            color: color4,
                                            'Upload',
                                            14,
                                            fontWeight: FontWeight.w400,
                                          )),
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
                                  margin: EdgeInsets.only(
                                      left: 8, bottom: 10, top: 5),
                                  width:
                                  MediaQuery.of(context).size.width * 0.6,
                                  child: ShakeWidget(
                                    key: Key("value"),
                                    duration: Duration(milliseconds: 700),
                                    child: Text(
                                      'Upload Documents',
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
                              ), text(
                                  context, "Municipal Certificate", 16,
                                  color: color18,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center),


                              Container(
                                height:
                                MediaQuery.of(context).size.height * 0.050,
                                child: TextFormField(
                                  controller: _businessRegistraionController,
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
                                    hintText: "Upload municipal certificate",
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
                                      child: container(context,
                                          padding: EdgeInsets.all(4),
                                          margin: EdgeInsets.all(6),
                                          colors: color1,
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          child: text(
                                            context,
                                            color: color4,
                                            'Upload',
                                            14,
                                            fontWeight: FontWeight.w400,
                                          )),
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
                                  margin: EdgeInsets.only(
                                      left: 8, bottom: 10, top: 5),
                                  width:
                                  MediaQuery.of(context).size.width * 0.6,
                                  child: ShakeWidget(
                                    key: Key("value"),
                                    duration: Duration(milliseconds: 700),
                                    child: Text(
                                      'Upload Documents',
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
                              ), text(
                                  context, "Aadhar", 16,
                                  color: color18,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center),


                              Container(
                                height:
                                MediaQuery.of(context).size.height * 0.050,
                                child: TextFormField(
                                  controller: _businessRegistraionController,
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
                                    hintText: "Upload Aadhar",
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
                                      child: container(context,
                                          padding: EdgeInsets.all(4),
                                          margin: EdgeInsets.all(6),
                                          colors: color1,
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          child: text(
                                            context,
                                            color: color4,
                                            'Upload',
                                            14,
                                            fontWeight: FontWeight.w400,
                                          )),
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
                                  margin: EdgeInsets.only(
                                      left: 8, bottom: 10, top: 5),
                                  width:
                                  MediaQuery.of(context).size.width * 0.6,
                                  child: ShakeWidget(
                                    key: Key("value"),
                                    duration: Duration(milliseconds: 700),
                                    child: Text(
                                      'Upload Documents',
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

                              containertext1(context, 'CONTINUE',onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInWithEmail()));

                              })


                            ]),
                      ))
                    ]))));
  }
}
