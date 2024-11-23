import 'dart:io';

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
  String validatebusinessRegistraiondoc = "";
  String validatedruglicensedoc = "";
  String validategstdoc = "";
  String validateaddressdoc = "";
  String validateowneriddoc = "";
  String validatemuncipaldoc = "";
  String validatepandoc = "";
  String validateaadhar = "";


// Variables to store filenames for each document type
  String? register_doc_fileName;
  String? drug_doc_fileName;
  String? gst_doc_fileName;
  String? address_doc_fileName;
  String? owner_doc_fileName;
  String? muncipal_doc_fileName;
  String? aadhar_doc_fileName;
  String? filePath;

// List to store selected files
  List<Map<String, File>> selectedFiles = [];

// Function to pick files for any document type
  Future<void> pickDocument(String documentType) async {
    // Allow the user to pick a single file
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null) {
      // Get the selected file
      PlatformFile file = result.files.first;

      // Convert PlatformFile to File object
      File selectedFile = File(file.path!);

      // Dynamically assign the file name based on document type
      if (documentType == "registration") {
        register_doc_fileName = file.name;
      } else if (documentType == "drug_license") {
        drug_doc_fileName = file.name;
      } else if (documentType == "gst_certificate") {
        gst_doc_fileName = file.name;
      } else if (documentType == "address_proof") {
        address_doc_fileName = file.name;
      } else if (documentType == "owner_id_proof") {
        owner_doc_fileName = file.name;
      } else if (documentType == "municipal_certificate") {
        muncipal_doc_fileName = file.name;
      } else if (documentType == "aadhar") {
        aadhar_doc_fileName = file.name;
      }

      // Dynamically assign the file name based on document type

      // Check if the document type already exists in the list
      bool documentExists =
      selectedFiles.any((entry) => entry.containsKey(documentType));

      if (documentExists) {
        // Update the existing entry for the document type
        int index = selectedFiles
            .indexWhere((entry) => entry.containsKey(documentType));
        selectedFiles[index] = {documentType: selectedFile};
        print('File updated for $documentType: ${file.name}');
      } else {
        // Add a new entry for the document type
        selectedFiles.add({
          documentType: selectedFile,
        });
        print('File added for $documentType: ${file.name}');
      }

      // Optionally, print the selected files for debugging
      print('File selected for $documentType: ${file.name}');
      print('selected files $selectedFiles');
    } else {
      print('No file selected for $documentType');
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
                        child: Column(
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
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: Color(0xffd0cbdb),
                                    width: 1,
                                  ),
                                  color: Colors.white, // Background color
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        register_doc_fileName!=null?
                                        register_doc_fileName??"":
                                        "Upload Documents", // This acts as the hint text
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xffAFAFAF),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter',
                                          letterSpacing: 0,
                                          height: 19.36 / 14,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap:(){
                                        pickDocument("registration");
                                      } ,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color:
                                              color1, // The color for the upload button
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          'Upload', // Button text
                                          style: TextStyle(
                                            color:
                                                color4, // The color for the button text
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (validatebusinessRegistraiondoc
                                  .isNotEmpty) ...[
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
                                      validatebusinessRegistraiondoc,
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
                              text(context, 'Drug License', 16,
                                  color: color18,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: Color(0xffd0cbdb),
                                    width: 1,
                                  ),
                                  color: Colors.white, // Background color
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Upload Drug License", // This acts as the hint text
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xffAFAFAF),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter',
                                          letterSpacing: 0,
                                          height: 19.36 / 14,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap:(){
                                        pickDocument("drug_license");
                                      } ,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color:
                                              color1, // The color for the upload button
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          'Upload', // Button text
                                          style: TextStyle(
                                            color:
                                                color4, // The color for the button text
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (validatedruglicensedoc.isNotEmpty) ...[
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
                                      validatedruglicensedoc,
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
                              text(context, 'GST Certificate', 16,
                                  color: color18,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: Color(0xffd0cbdb),
                                    width: 1,
                                  ),
                                  color: Colors.white, // Background color
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Upload GST Certificate", // This acts as the hint text
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xffAFAFAF),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter',
                                          letterSpacing: 0,
                                          height: 19.36 / 14,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap:(){
                                        pickDocument("gst_certificate");
                                      } ,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color:
                                              color1, // The color for the upload button
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          'Upload', // Button text
                                          style: TextStyle(
                                            color:
                                                color4, // The color for the button text
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (validategstdoc.isNotEmpty) ...[
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
                                      validategstdoc,
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
                              text(context, 'Proof of Address', 16,
                                  color: color18,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: Color(0xffd0cbdb),
                                    width: 1,
                                  ),
                                  color: Colors.white, // Background color
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Upload Proof of Address", // This acts as the hint text
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xffAFAFAF),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter',
                                          letterSpacing: 0,
                                          height: 19.36 / 14,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap:(){
                                        pickDocument("address_proof");
                                      } ,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color:
                                              color1, // The color for the upload button
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          'Upload', // Button text
                                          style: TextStyle(
                                            color:
                                                color4, // The color for the button text
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (validateaddressdoc.isNotEmpty) ...[
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
                                      validateaddressdoc,
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
                              text(context, "Owner's ID Proof", 16,
                                  color: color18,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: Color(0xffd0cbdb),
                                    width: 1,
                                  ),
                                  color: Colors.white, // Background color
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Upload Owner's ID Proof", // This acts as the hint text
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xffAFAFAF),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter',
                                          letterSpacing: 0,
                                          height: 19.36 / 14,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap:(){
                                        pickDocument("owner_id_proof");
                                      } ,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color:
                                              color1, // The color for the upload button
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          'Upload', // Button text
                                          style: TextStyle(
                                            color:
                                                color4, // The color for the button text
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (validateowneriddoc.isNotEmpty) ...[
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
                                      validateowneriddoc,
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
                              text(context, "Municipal Certificate", 16,
                                  color: color18,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: Color(0xffd0cbdb),
                                    width: 1,
                                  ),
                                  color: Colors.white, // Background color
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Upload municipal certificate", // This acts as the hint text
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xffAFAFAF),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter',
                                          letterSpacing: 0,
                                          height: 19.36 / 14,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap:(){
                                        pickDocument("municipal_certificate");
                                      } ,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color:
                                              color1, // The color for the upload button
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          'Upload', // Button text
                                          style: TextStyle(
                                            color:
                                                color4, // The color for the button text
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (validatemuncipaldoc.isNotEmpty) ...[
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
                              // SizedBox(
                              //   height: h * 0.01,
                              // ),
                              // text(context, "Self Pan", 16,
                              //     color: color18,
                              //     fontWeight: FontWeight.w400,
                              //     textAlign: TextAlign.center),
                              // Container(
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(7),
                              //     border: Border.all(
                              //       color: Color(0xffd0cbdb),
                              //       width: 1,
                              //     ),
                              //     color: Colors.white, // Background color
                              //   ),
                              //   child: Row(
                              //     children: [
                              //       SizedBox(
                              //         width: 10,
                              //       ),
                              //       Expanded(
                              //         child: Text(
                              //           "Upload Self Pan", // This acts as the hint text
                              //           style: TextStyle(
                              //             fontSize: 14,
                              //             color: Color(0xffAFAFAF),
                              //             fontWeight: FontWeight.w400,
                              //             fontFamily: 'Inter',
                              //             letterSpacing: 0,
                              //             height: 19.36 / 14,
                              //           ),
                              //         ),
                              //       ),
                              //       GestureDetector(
                              //         onTap:(){
                              //           pickDocument("municipal_certificate");
                              //         } ,
                              //         child: Container(
                              //           padding: EdgeInsets.symmetric(
                              //               horizontal: 10, vertical: 4),
                              //           margin: EdgeInsets.all(8),
                              //           decoration: BoxDecoration(
                              //             color:
                              //                 color1, // The color for the upload button
                              //             borderRadius:
                              //                 BorderRadius.circular(8),
                              //           ),
                              //           child: Text(
                              //             'Upload', // Button text
                              //             style: TextStyle(
                              //               color:
                              //                   color4, // The color for the button text
                              //               fontSize: 15,
                              //               fontWeight: FontWeight.w400,
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // if (validatepandoc.isNotEmpty) ...[
                              //   Container(
                              //     alignment: Alignment.topLeft,
                              //     margin: EdgeInsets.only(
                              //         left: 8, bottom: 10, top: 5),
                              //     width:
                              //         MediaQuery.of(context).size.width * 0.6,
                              //     child: ShakeWidget(
                              //       key: Key("value"),
                              //       duration: Duration(milliseconds: 700),
                              //       child: Text(
                              //         validatepandoc,
                              //         style: TextStyle(
                              //           fontFamily: "Poppins",
                              //           fontSize: 12,
                              //           color: Colors.red,
                              //           fontWeight: FontWeight.w500,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ] else ...[
                              //   SizedBox(height: 15),
                              // ],
                              SizedBox(
                                height: h * 0.01,
                              ),
                              text(context, "Aadhar", 16,
                                  color: color18,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: Color(0xffd0cbdb),
                                    width: 1,
                                  ),
                                  color: Colors.white, // Background color
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Upload Aadhar", // This acts as the hint text
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xffAFAFAF),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter',
                                          letterSpacing: 0,
                                          height: 19.36 / 14,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap:(){
                                        pickDocument("aadhar");
                                      } ,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color:
                                              color1, // The color for the upload button
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          'Upload', // Button text
                                          style: TextStyle(
                                            color:
                                                color4, // The color for the button text
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (validateaadhar.isNotEmpty) ...[
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
                                      validateaadhar,
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
                              containertext1(context, 'CONTINUE', onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignInWithEmail()));
                              })
                            ]),
                      ))
                    ]))));
  }
}
