import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:drugcalm/Registration/BasicInformation.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Services/UserApi.dart';
import '../utils/CustomSnackBar.dart';
import '../utils/ShakeWidget.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({super.key});

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  final TextEditingController RegistrationController = TextEditingController();
  final TextEditingController licensenumberController = TextEditingController();
  final TextEditingController druglicensemoController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController gstinController = TextEditingController();
  final TextEditingController panController = TextEditingController();
  final TextEditingController muncipallicensenumberController =
      TextEditingController();
  final TextEditingController geolocationController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController outletcountController = TextEditingController();
  final TextEditingController operatinghoursController =
      TextEditingController();

  String validatebusinessRegistraion = "";
  String validatelicensenumber = "";
  String validatedruglicensenumber = "";
  String validatemuncipallicensenumber = "";
  String validategstin = "";
  String validatepan = "";
  String validateexpiry = "";
  String validatecity = "";
  String validatestate = "";
  String validatepincode = "";
  String validategeolocation = "";
  String validateoperatinghours = "";
  String validateoutletcount = "";

  bool _loading = false;

  void _validateForm() {
    setState(() {
      _loading = true;

      // Validation for Business Registration
      validatebusinessRegistraion = RegistrationController.text.isEmpty
          ? "Please enter the Business Registration number"
          : "";

      // Validation for License Number
      validatelicensenumber = licensenumberController.text.isEmpty
          ? "Please enter the License number"
          : "";

      // Validation for Drug License Number
      validatedruglicensenumber = druglicensemoController.text.isEmpty
          ? "Please enter the Drug License number"
          : "";

      // Validation for Municipal License Number
      validatemuncipallicensenumber =
          muncipallicensenumberController.text.isEmpty
              ? "Please enter the Municipal License number"
              : "";

      // Validation for GSTIN
      validategstin = !RegExp(r"^[0-9]{15}$").hasMatch(gstinController.text)
          ? "Please enter a valid GSTIN"
          : "";

      // Validation for PAN
      validatepan =
          !RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(panController.text)
              ? "Please enter a valid PAN"
              : "";

      // Validation for Expiry Date (e.g., in DD/MM/YYYY format)
      validateexpiry = expiryController.text.isEmpty
          ? "Please select a valid expiry date"
          : "";

      // Validation for City
      validatecity = cityController.text.isEmpty ? "Please enter the city" : "";

      // Validation for State
      validatestate =
          stateController.text.isEmpty ? "Please enter the state" : "";

      // Validation for Pincode
      validatepincode = pincodeController.text.length < 6
          ? "Please enter a valid 6-digit pincode"
          : "";

      // Validation for Geolocation
      validategeolocation = geolocationController.text.isEmpty
          ? "Please enter the geolocation"
          : "";

      // Validation for Operating Hours
      validateoperatinghours = operatinghoursController.text.isEmpty
          ? "Please enter operating hours"
          : "";

      // Validation for Outlet Count
      validateoutletcount = outletcountController.text.isEmpty
          ? "Please enter the number of outlets"
          : "";

      // Check if all validation fields are empty, indicating successful validation
      if (validatebusinessRegistraion.isEmpty &&
          validatelicensenumber.isEmpty &&
          validatedruglicensenumber.isEmpty &&
          validatemuncipallicensenumber.isEmpty &&
          validategstin.isEmpty &&
          validatepan.isEmpty &&
          validateexpiry.isEmpty &&
          validatecity.isEmpty &&
          validatestate.isEmpty &&
          validatepincode.isEmpty &&
          validategeolocation.isEmpty &&
          validateoperatinghours.isEmpty &&
          validateoutletcount.isEmpty) {
        // Proceed with the form submission or API call
        AddBusinessDetails();
      } else {
        // Stop the loading state if any validation failed
        _loading = false;
      }
    });
  }

  String selectedOption = "Allopathy/Pharmaceutical";
  final List<String> dropdownOptions = [
    "Allopathy/Pharmaceutical",
    "Ayurvedic/Herbal",
    "Veterinary",
    "OTC General",
    "Surgical"
  ];

  static Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      controller.text = DateFormat('dd-MM-yyyy').format(pickedDate);
    }
  }

  @override
  void initState() {
    getOutletApi();
    super.initState();
  }

  String? outletID;
  Future<void> getOutletApi() async {
    var res = await Userapi.getOutlet();
    if (res != null) {
      setState(() {
        if (res.settings?.success == 1) {
          outletID = res.data?.id ?? "";
          print("outletID:${outletID}");
        } else {}
      });
    }
  }

  Future<void> AddBusinessDetails() async {
    var res = await Userapi.AddBusinessDetailsApi(
        outletID,
        RegistrationController.text,
        licensenumberController.text,
        druglicensemoController.text,
        expiryController.text,
        gstinController.text,
        panController.text,
        muncipallicensenumberController.text,
        geolocationController.text,
        outletcountController.text);
    if (res != null) {
      setState(() {
        if (res.settings?.success == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BasicInformation()));
        } else {}
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
        height: h,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/Drug Clam Background.png',
                ),
                fit: BoxFit.cover)),
        child: container(context,
            colors: color4,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(left: 16, right: 16,top: 40,bottom: 10),
            child: Column(
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
                    SizedBox(
                      width: w * 0.04,
                    ),
                    text(
                      context,
                      'Business Details',
                      20,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: h * 0.01,
                        ),
                        TextFormField(
                          controller: RegistrationController,
                          keyboardType: TextInputType.text,
                          cursorColor: color11,
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
                            labelText: "Business Registration Number",
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
                        if (validatebusinessRegistraion.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
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
                        TextFormField(
                          controller: licensenumberController,
                          keyboardType: TextInputType.text,
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatelicensenumber = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatelicensenumber = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "Business License Number",
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
                        if (validatelicensenumber.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validatelicensenumber,
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
                        TextFormField(
                          controller: druglicensemoController,
                          keyboardType: TextInputType.text,
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatedruglicensenumber = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatedruglicensenumber = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "Drug licence",
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
                        if (validatedruglicensenumber.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validatedruglicensenumber,
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
                        _buildDateField(
                          expiryController,
                        ),
                        if (validateexpiry.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                            EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validateexpiry,
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
                        TextFormField(
                          controller: gstinController,
                          keyboardType: TextInputType.text,
                          cursorColor: color11,
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validategstin = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validategstin = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "GSTIN number",
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
                        if (validategstin.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validategstin,
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
                        TextFormField(
                          controller: panController,
                          keyboardType: TextInputType.text,
                          cursorColor: color11,
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatepan = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatepan = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "PAN number",
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
                        if (validatepan.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validatepan,
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
                        TextFormField(
                          controller: muncipallicensenumberController,
                          keyboardType: TextInputType.text,
                          cursorColor: color11,
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatemuncipallicensenumber = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatemuncipallicensenumber = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "Municipal License Number",
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
                        if (validatemuncipallicensenumber.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validatemuncipallicensenumber,
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
                        TextFormField(
                          controller: cityController,
                          keyboardType: TextInputType.text,
                          cursorColor: color11,
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatecity = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatecity = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "City",
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
                        if (validatecity.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validatecity,
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
                        TextFormField(
                          controller: stateController,
                          keyboardType: TextInputType.text,
                          cursorColor: color11,
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validatestate = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatestate = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "State",
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
                        if (validatestate.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validatestate,
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
                        TextFormField(
                          controller: pincodeController,
                          keyboardType: TextInputType.text,
                          cursorColor: color11,
                          onTap: () {
                            setState(() {
                              validatepincode = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validatepincode = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "Pincode",
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
                        if (validatepincode.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validatepincode,
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
                        TextFormField(
                          controller: geolocationController,
                          keyboardType: TextInputType.text,
                          cursorColor: color11,
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validategeolocation = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validategeolocation = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
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
                        if (validategeolocation.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validategeolocation,
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
                        TextFormField(
                          controller: outletcountController,
                          keyboardType: TextInputType.text,
                          cursorColor: color11,
                          onTap: () {
                            // closeDropdown();
                            setState(() {
                              validateoutletcount = "";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              validateoutletcount = "";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            labelText: "Outlet Count",
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
                        if (validateoutletcount.isNotEmpty) ...[
                          Container(
                            alignment: Alignment.topLeft,
                            margin:
                                EdgeInsets.only(left: 8, bottom: 10, top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ShakeWidget(
                              key: Key("value"),
                              duration: Duration(milliseconds: 700),
                              child: Text(
                                validateoutletcount,
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
                )
              ],
            )),
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
                _validateForm();
              },
              child: Container(
                height: 40,
                width: w * 0.43,
                decoration: BoxDecoration(
                  color: color1,
                  border: Border.all(
                    color: color1,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
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

  Widget _buildDateField(TextEditingController controller) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: () {
        _selectDate(context, controller);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
        hintText: "Expiry",
        suffixIcon: Container(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Image.asset(
              "assets/calendar.png",
              color: Color(0xff000000),
              width: 16,
              height: 16,
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
    );
  }
}
