import 'dart:io';
import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../Services/otherservices.dart';
import '../providers/ConnectivityProviders.dart';
import '../providers/UserDetailsProvider.dart';
import '../utils/CustomAppBar.dart';
import '../utils/ShakeWidget.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController bloodGroup = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController WeightController = TextEditingController();
  String selectedGender = "";
  File? _image;
  XFile? _pickedFile;
  final ImagePicker _picker = ImagePicker();
  String _validateGender = "";

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // Use ImageSource.camera for camera
      imageQuality: 100,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Set the selected image file
        print("Image: ${_image?.path}"); // Print the image path for debugging
      });
    } else {
      print("No image selected.");
    }
  }

  final FocusNode _focusNodeFullName = FocusNode();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePhone = FocusNode();
  String _validateFullName = "";
  String _validateemail = "";
  String _validatePhone = "";
  String _validateDate = "";
  bool _loading = false;

  void _validateFields() {
    setState(() {
      _loading = true;
      _validateFullName =
          fullnameController.text.isEmpty ? "Please enter a fullName" : "";
      _validateemail =
          !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                  .hasMatch(emailController.text)
              ? "Please enter a valid email"
              : "";
      _validatePhone =
          mobileController.text.isEmpty || mobileController.text.length < 10
              ? "Please enter a valid phonenumber"
              : "";
      _validateGender = selectedGender.isEmpty ? "Please select a gender" : "";
      _validateDate =
          dateOfBirthController.text.isEmpty ? "Please select a dob" : "";
      if (_validateFullName.isEmpty &&
          _validateemail.isEmpty &&
          _validatePhone.isEmpty &&
          _validateDate.isEmpty &&
          _validateGender.isEmpty) {
        _updateProfile();
        userHealthInfo();
      } else {
        _loading = false;
      }
    });
  }

  @override
  void initState() {
    _fetchUserProfile();
    Provider.of<ConnectivityProviders>(context, listen: false)
        .initConnectivity();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<ConnectivityProviders>(context, listen: false).dispose();
    super.dispose();
  }

  String profile_image = "";

  Future<void> _updateProfile() async {
    String fullname = fullnameController.text;
    String mobile = mobileController.text;
    String email = emailController.text;
    String dob = dateOfBirthController.text;
    final profile_provider =
        Provider.of<UserDetailsProvider>(context, listen: false);
    var response = await profile_provider.updateUserDetails(
        fullname, mobile, email, _image, selectedGender, dob);

    setState(() {
      if (response == 1) {
        _loading = false;

        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Profile updated successfully")));
        // Optionally, you can navigate back or update the UI to reflect changes
      } else {
        _loading = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Failed to update profile")));
      }
    });
  }

  Future<void> userHealthInfo() async {
    final profile_provider =
        Provider.of<UserDetailsProvider>(context, listen: false);

    var res = await profile_provider.updateHealthDetails(ageController.text,
        bloodGroup.text, heightController.text, WeightController.text);
    setState(() {
      if (res == 1) {
        _loading = false;
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Profile updated successfully")));
        // Optionally, you can navigate back or update the UI to reflect changes
      } else {
        _loading = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Failed to update profile")));
      }
    });
  }

  Future<void> _fetchUserProfile() async {
    try {
      final profile_provider =
          Provider.of<UserDetailsProvider>(context, listen: false);
      var res = await profile_provider.userDetails;
      setState(() {
        if (res != null) {
          fullnameController.text = res.fullName ?? ''; // Use safe navigation
          mobileController.text = res.mobile ?? '';
          emailController.text = res.email ?? '';
          profile_image = res.image ?? "";
          selectedGender = res.gender ?? "";
          // dateOfBirthController.text = res.dob ?? "";
          dateOfBirthController.text = res.dob != null
              ? DateFormat('dd/MM/yyyy').format(DateTime.parse(res.dob ?? ""))
              : "";

          ageController.text = res.personal?.age.toString() ?? "";
          bloodGroup.text = res.personal?.bloodGroup ?? "";
          heightController.text = res.personal?.hight.toString() ?? "";
          WeightController.text = res.personal?.weight ?? "";
        }
      });
    } catch (e) {
      // Handle error appropriately, e.g., show a toast or dialog
      print('Error fetching user profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    var connectiVityStatus = Provider.of<ConnectivityProviders>(context);
    return (connectiVityStatus.isDeviceConnected == "ConnectivityResult.wifi" ||
            connectiVityStatus.isDeviceConnected == "ConnectivityResult.mobile")
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: color1,
              leading: Container(),
              leadingWidth: 0,
              toolbarHeight: h * 0.2,
              title: Consumer<UserDetailsProvider>(
                  builder: (context, data, child) {
                return Column(
                  children: [
                  CustomAppBar1(
                  title: 'MY PROFILE',
                  actions: [Container()],),
                    SizedBox(
                        height:
                            h * 0.015), // Adjusts spacing for smaller screens

                    // Profile Row (Avatar and Info)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Profile Picture with Camera Icon
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey,
                              backgroundImage: _image != null
                                  ? FileImage(_image!) as ImageProvider<Object>
                                  : profile_image != null &&
                                          profile_image.isNotEmpty
                                      ? NetworkImage(profile_image)
                                          as ImageProvider<Object>
                                      : AssetImage('assets/personProfile.png')
                                          as ImageProvider<Object>,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: InkWell(
                                onTap: _pickImage,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: color1,
                                    size: 20, // Size of the camera icon
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            width:
                                w * 0.05), // Space between avatar and user info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Chary’s Medical & General Stores",
                                maxLines: 2,
                                style: TextStyle(
                                  color: color4,
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      16, // Responsive font size based on screen width
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                  height: h *
                                      0.01), // Vertical space between text fields
                              Text(
                                data.userDetails?.email ?? "",
                                style: TextStyle(
                                  color: color4,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 16.21 / 14,
                                  letterSpacing: 0.14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                  height: h *
                                      0.01), // Vertical space between text fields
                              Text(
                                "DrugCalm ID : 64240",
                                style: TextStyle(
                                  color: color4,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14, // Responsive font size
                                  letterSpacing: 0.14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: h * 0.02), // Additional spacing at the bottom
                  ],
                );
              }),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    container(context,
                        colors: color4,
                        padding: EdgeInsets.all(16),
                        borderRadius: BorderRadius.circular(8),
                        // margin: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'PERSONAL INFORMATION',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            text(context, 'Full Name', 14,
                                color: color23, fontWeight: FontWeight.w400),
                            SizedBox(
                              height: 5,
                            ),
                            TextField(
                              controller: fullnameController,
                              focusNode: _focusNodeFullName,
                              keyboardType: TextInputType.text,
                              cursorColor: color1,
                              onTap: () {
                                setState(() {
                                  _validateFullName = "";
                                });
                              },
                              onChanged: (v) {
                                setState(() {
                                  _validateFullName = "";
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 7),
                                hintText: "Name",
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0,
                                  height: 1.2,
                                  color: Color(0xffAFAFAF),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                filled: true,
                                fillColor: const Color(0xffffffff),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(width: 1, color: color7),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(width: 1, color: color7),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(width: 1, color: color7),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(width: 1, color: color7),
                                ),
                              ),
                              style: TextStyle(
                                fontSize:
                                    14, // Ensure font size fits within height
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Inter',
                              ),
                              textAlignVertical: TextAlignVertical.center,
                            ),
                            if (_validateFullName.isNotEmpty) ...[
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(
                                    left: 8, bottom: 10, top: 5),
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: ShakeWidget(
                                  key: Key("value"),
                                  duration: Duration(milliseconds: 700),
                                  child: Text(
                                    _validateFullName,
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
                              SizedBox(height: 4),
                            ],
                            SizedBox(height: 16),

                            Text('Gender'),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _genderButton('Male'),
                                SizedBox(width: 5),
                                _genderButton('Female'),
                                SizedBox(width: 5),
                                _genderButton('Other'),
                              ],
                            ),
                            if (_validateGender.isNotEmpty) ...[
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(
                                    left: 8, bottom: 10, top: 5),
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: ShakeWidget(
                                  key: Key("value"),
                                  duration: Duration(milliseconds: 700),
                                  child: Text(
                                    _validateGender,
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
                              SizedBox(height: 4),
                            ],

                            SizedBox(height: 16),
                            text(context, 'Date of Birth', 14,
                                color: color23, fontWeight: FontWeight.w400),
                            // Date of Birth Field with Calendar Icon
                            SizedBox(
                              height: 5,
                            ),
                            _buildDateField(
                              dateOfBirthController,
                            ),
                            if (_validateDate.isNotEmpty) ...[
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(bottom: 5),
                                child: ShakeWidget(
                                  key: Key("value"),
                                  duration: Duration(milliseconds: 700),
                                  child: Text(
                                    _validateDate,
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
                              const SizedBox(
                                height: 12,
                              ),
                            ],

                            SizedBox(height: 16),

                            // Phone Number Field
                            text(context, 'Phone Number', 14,
                                color: color23, fontWeight: FontWeight.w400),
                            SizedBox(
                              height: 5,
                            ),
                            TextField(
                              controller: mobileController,
                              focusNode: _focusNodePhone,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly, // Only allow digits
                                LengthLimitingTextInputFormatter(
                                    10), // Limit input to 10 digits
                              ],
                              onTap: () {
                                setState(() {
                                  _validatePhone = "";
                                });
                              },
                              onChanged: (v) {
                                setState(() {
                                  _validatePhone = "";
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 7),
                                hintText: "Phone Number",
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0,
                                  height: 1.2,
                                  color: Color(0xffAFAFAF),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                filled: true,
                                fillColor: const Color(0xffffffff),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(width: 1, color: color7),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(width: 1, color: color7),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(width: 1, color: color7),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(width: 1, color: color7),
                                ),
                              ),
                            ),
                            if (_validatePhone.isNotEmpty) ...[
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(bottom: 5),
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
                              ),
                            ] else ...[
                              const SizedBox(
                                height: 12,
                              ),
                            ],

                            SizedBox(height: 16),
                            text(context, 'Email ID', 14,
                                color: color23, fontWeight: FontWeight.w400),
                            SizedBox(
                              height: 5,
                            ),
                            // Email ID Field
                            TextField(
                              controller: emailController,
                              focusNode: _focusNodeEmail,
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xffCAA16C),
                              onTap: () {
                                setState(() {
                                  _validateemail = "";
                                });
                              },
                              onChanged: (v) {
                                setState(() {
                                  _validateemail = "";
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 7),
                                hintText: "Email ID",
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 0,
                                  height: 1.2,
                                  color: Color(0xffAFAFAF),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                filled: true,
                                fillColor: const Color(0xffffffff),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(width: 1, color: color7),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(width: 1, color: color7),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(width: 1, color: color7),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(width: 1, color: color7),
                                ),
                              ),
                            ),
                            if (_validateemail.isNotEmpty) ...[
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(bottom: 5),
                                child: ShakeWidget(
                                  key: Key("value"),
                                  duration: Duration(milliseconds: 700),
                                  child: Text(
                                    _validateemail,
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
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          ],
                        )),

                    SizedBox(
                      height: 10,
                    ),

                    container(
                      context,
                      colors: color4,
                      padding: EdgeInsets.all(10),
                      borderRadius: BorderRadius.circular(8),
                      // margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'HEALTH INFORMATION',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),

                          // Age and Blood Group Row
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(context, 'Age', 14,
                                      color: color23,
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w400),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  Container(
                                    width: w * 0.42,
                                    child: TextField(
                                      controller: ageController,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        FilteringTextInputFormatter
                                            .digitsOnly, // Only allow digits
                                        LengthLimitingTextInputFormatter(
                                            4), // Limit input to 10 digits
                                      ],
                                      cursorColor: color1,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 7),
                                        hintText: "Age",
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                          letterSpacing: 0,
                                          height: 1.2,
                                          color: Color(0xffAFAFAF),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xffffffff),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1, color: color7),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1, color: color7),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1, color: color7),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1, color: color7),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: w * 0.01,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(context, 'Blood Group', 14,
                                      color: color23,
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w400),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  Container(
                                    width: w * 0.42,
                                    child: TextField(
                                      controller: bloodGroup,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 7),
                                        hintText: "Blood Group",
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                          letterSpacing: 0,
                                          height: 1.2,
                                          color: Color(0xffAFAFAF),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xffffffff),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1, color: color7),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1, color: color7),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1, color: color7),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1, color: color7),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: 16),

                          // Height and Weight Row
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(context, 'Height', 14,
                                      color: color23,
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w400),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  Container(
                                    width: w * 0.42,
                                    child: TextField(
                                      controller: heightController,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        FilteringTextInputFormatter
                                            .digitsOnly, // Only allow digits
                                        // Limit input to 10 digits
                                      ],
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 7),
                                        hintText: "Ex:150CM",
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                          letterSpacing: 0,
                                          height: 1.2,
                                          color: Color(0xffAFAFAF),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xffffffff),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1, color: color7),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1, color: color7),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1, color: color7),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1, color: color7),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: w * 0.01,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(context, 'Weight', 14,
                                      color: color23,
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w400),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  Container(
                                    width: w * 0.42,
                                    child: TextField(
                                      controller: WeightController,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        FilteringTextInputFormatter
                                            .digitsOnly, // Only allow digits
                                        LengthLimitingTextInputFormatter(
                                            4), // Limit input to 10 digits
                                      ],
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 7),
                                        hintText: "Ex:72",
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                          letterSpacing: 0,
                                          height: 1.2,
                                          color: Color(0xffAFAFAF),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xffffffff),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1, color: color7),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1, color: color7),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1, color: color7),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 1, color: color7),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 19),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    // Update Profile Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_loading) {
                          } else {
                            _validateFields();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              color1, // Make button background transparent
                          shadowColor: Colors
                              .transparent, // Remove default button shadow
                          padding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 30.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: _loading
                            ? spinkits.getFadingCircleSpinner(color: color4)
                            : Text(
                                'UPDATE PROFILE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : NoInternetWidget();
  }

  // Helper method for gender selection button
  Widget _genderButton(String gender) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            selectedGender = gender;
            setState(() {
              _validateGender = "";
            });
          });
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: selectedGender == gender ? color1 : Colors.grey,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Curved border radius
          ),
          foregroundColor: selectedGender == gender ? color1 : Colors.black,
        ),
        child: Text(gender),
      ),
    );
  }

  static Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
    }
  }

  Widget _buildDateField(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          child: TextField(
            controller: controller,
            readOnly: true,
            onTap: () {
              _selectDate(context, controller);
              setState(() {
                _validateDate = "";
              });
            },
            onChanged: (v) {
              setState(() {
                _validateDate = "";
              });
            },
            decoration: InputDecoration(
              hintText: "Date",
              suffixIcon: Container(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: Image.asset(
                    "assets/date.png",
                    color: Color(0xff000000),
                    width: 18,
                    height: 18,
                    fit: BoxFit.contain,
                  )),
              hintStyle: TextStyle(
                fontSize: 14,
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
                borderSide: BorderSide(width: 1, color: Color(0xffD0CBDB)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide(width: 1, color: Color(0xffD0CBDB)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
