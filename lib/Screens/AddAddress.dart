import 'package:drugcalm/providers/ConnectivityProviders.dart';
import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Model/AdressDeatilsModel.dart';
import '../Services/otherservices.dart';
import '../providers/AddressProvider.dart';
import '../utils/CustomSnackBar.dart';
import '../utils/ShakeWidget.dart';

class AddAddress extends StatefulWidget {
  String type;
  String productid;
  AddAddress({super.key, required this.type, required this.productid});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _PhoneController = TextEditingController();
  final TextEditingController _AlternatePhoneController =
  TextEditingController();
  final TextEditingController _HouseNumberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _AreaController = TextEditingController();
  String _validatePincode = "";
  String _validatename = "";
  String _validatephone = "";
  String _validatehouse = "";
  String _validatecity = "";
  String _validatearea = "";
  String? _selectedOption = 'Home';
  bool isLoading =false;
  final spinkits=Spinkits();


  @override
  void initState() {
    if(widget.type=='Edit'){
      GetAddressDetails(widget.productid);
     Provider.of<ConnectivityProviders>(context,listen: false).initConnectivity();
    }

    super.initState();
  }

  @override
  void dispose() {
    Provider.of<ConnectivityProviders>(context, listen: false).dispose();
    super.dispose();
  }

  // Method to update the selected value
  void _handleRadioValueChanged(String? value) {
    setState(() {
      _selectedOption = value;
    });
  }

  void _validateFields() {
    setState(() {
      isLoading=true;
      _validatePincode =
      _pincodeController.text.isEmpty || _pincodeController.text.length<6  ? "Please enter a valid pincode" : "";
      _validatename =
      _nameController.text.isEmpty ? "Please enter a valid full name" : "";
      _validatephone =
      _PhoneController.text.isEmpty || _PhoneController.text.length<10 ? "Please enter a valid phonenumber" : "";
      _validatehouse = _HouseNumberController.text.isEmpty
          ? "Please enter a housenumber"
          : "";
      _validatecity = _cityController.text.isEmpty ? "Please enter a city" : "";
      _validatearea =
      _AreaController.text.isEmpty ? "Please enter a area " : "";

      if(_validatePincode.isEmpty &&
          _validatename.isEmpty &&
          _validatephone.isEmpty &&
          _validatehouse.isEmpty &&
          _validatearea.isEmpty &&
          _validatecity.isEmpty) {
        if (widget.type == "Edit") {
          print("id>>${widget.productid}");
          UpdateAddressApi(widget.productid);
        } else {
          addAddressApi();
        }
      }else{
        isLoading=false;
      }
    });
  }




  String get address {
    return "${_HouseNumberController.text},${_cityController.text},${_AreaController.text}".trim();
  }

  AddressDetails? address_details;
  Future<void> GetAddressDetails(id) async {
    final fetch_address_details = Provider.of<AddressListProvider>(context, listen: false);

    // First, fetch the address details asynchronously
     address_details = await fetch_address_details.getaddressDetails(id);

    // Now update the state with the fetched data synchronously
    setState(() {
      _PhoneController.text = address_details?.mobile ?? "";
      _pincodeController.text = address_details?.pincode ?? "";
      _nameController.text = address_details?.fullName ?? "";
      _AlternatePhoneController.text = address_details?.alternateMobile ?? "";
      _selectedOption = address_details?.addressType ?? "";

      if (address_details?.address != "") {
        String address = address_details?.address ?? "";
        List<String> parts = address.split(",");

        // Set defaults if parts are missing
        String housenumber = parts.isNotEmpty ? parts[0] : "";
        String city = parts.length > 1 ? parts[1] : "";
        String roadname = parts.length > 2 ? parts[2] : "";

        _HouseNumberController.text = housenumber;
        _cityController.text = city;
        _AreaController.text = roadname;
      }
    });
  }




  Future<void> addAddressApi() async {
    final address_list_provider =
    Provider.of<AddressListProvider>(context, listen: false);
    var status = await address_list_provider.AddAddress(_pincodeController.text,
        _PhoneController.text, address, _selectedOption, _nameController.text,_AlternatePhoneController.text);
    setState(() {
      if (status == 1) {
        isLoading=false;
        Navigator.pop(context);
        CustomSnackBar.show(context, "Added Address Successfully");
      } else {
        isLoading=false;
      }
    });
  }

  Future<void> UpdateAddressApi(id) async {
    final address_list_provider = Provider.of<AddressListProvider>(context, listen: false);
    var status = await address_list_provider.UpdateFromAddressList(
        id,
        _pincodeController.text,
        _PhoneController.text,
        address,
        _selectedOption,_nameController.text,_AlternatePhoneController.text);
    setState(() {
      if (status == 1) {
        isLoading=false;
        Navigator.pop(context);
        CustomSnackBar.show(context, " Address  Updated Successfully");
      } else {
        isLoading=false;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    var connectionStatus =Provider.of<ConnectivityProviders>(context);

    return
      (connectionStatus.isDeviceConnected == "ConnectivityResult.wifi" ||
          connectionStatus.isDeviceConnected == "ConnectivityResult.mobile")
          ?
      Scaffold(
        appBar: CustomAppBar1(title: '${widget.type} Address', actions: [Container()],),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Color(0xffffffff)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Full Name',
                          style: TextStyle(
                              color: Color(0xff110B0F),
                              fontFamily: 'RozhaOne',
                              fontSize: 15,
                              height: 21.3 / 15,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.050,
                        child: TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.text,
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            setState(() {
                              // _validateTitle="";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              // _validateTitle="";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            hintText: "Full Name",
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
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'RozhaOne',
                            overflow: TextOverflow
                                .ellipsis, // Add ellipsis for long text
                          ),
                          textAlignVertical: TextAlignVertical
                              .center, // Vertically center the t
                        ),
                      ),
                      if (_validatename.isNotEmpty) ...[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ShakeWidget(
                            key: Key("value"),
                            duration: Duration(milliseconds: 700),
                            child: Text(
                              _validatename,
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
                        SizedBox(height: 3),
                      ],
                      Text('Phone Number',
                          style: TextStyle(
                              color: Color(0xff110B0F),
                              fontFamily: 'RozhaOne',
                              fontSize: 15,
                              height: 21.3 / 15,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.050,
                        child: TextFormField(
                          controller: _PhoneController,
                          keyboardType: TextInputType.phone,

                          inputFormatters: [
                            FilteringTextInputFormatter
                                .digitsOnly, // Only allow digits
                            LengthLimitingTextInputFormatter(
                                10), // Limit input to 10 digits
                          ],
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            setState(() {
                              // _validateTitle="";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              // _validateTitle="";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            hintText: "PhoneNumber",
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
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'RozhaOne',
                            overflow: TextOverflow
                                .ellipsis, // Add ellipsis for long text
                          ),
                          textAlignVertical: TextAlignVertical
                              .center,
                        ),
                      ),
                      if (_validatephone.isNotEmpty) ...[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ShakeWidget(
                            key: Key("value"),
                            duration: Duration(milliseconds: 700),
                            child: Text(
                              _validatephone,
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
                        SizedBox(height: 3),
                      ],
                      Text('Alternate Phone Number',
                          style: TextStyle(
                              color: Color(0xff110B0F),
                              fontFamily: 'RozhaOne',
                              fontSize: 15,
                              height: 21.3 / 15,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.050,
                        child: TextFormField(
                          controller: _AlternatePhoneController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter
                                .digitsOnly, // Only allow digits
                            LengthLimitingTextInputFormatter(
                                10), // Limit input to 10 digits
                          ],
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            setState(() {
                              // _validateTitle="";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              // _validateTitle="";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            hintText: "PhoneNumber",
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
                          ),style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'RozhaOne',
                          overflow: TextOverflow
                              .ellipsis, // Add ellipsis for long text
                        ),
                          textAlignVertical: TextAlignVertical
                              .center, // Vertically center the t
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Pincode',
                          style: TextStyle(
                              color: Color(0xff110B0F),
                              fontFamily: 'RozhaOne',
                              fontSize: 15,
                              height: 21.3 / 15,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 3,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(

                            height:
                            MediaQuery.of(context).size.height * 0.050,
                            child: TextFormField(
                              controller: _pincodeController,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly, // Only allow digits
                                LengthLimitingTextInputFormatter(
                                    6), // Limit input to 10 digits
                              ],
                              cursorColor: Color(0xff8856F4),
                              onTap: () {
                                setState(() {
                                  // _validateTitle="";
                                });
                              },
                              onChanged: (v) {
                                setState(() {
                                  // _validateTitle="";
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                hintText: "Pincode",
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
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'RozhaOne',
                                overflow: TextOverflow
                                    .ellipsis, // Add ellipsis for long text
                              ),
                              textAlignVertical: TextAlignVertical
                                  .center,
                            ),
                          ),
                          if (_validatePincode.isNotEmpty) ...[
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                  left: 8, bottom: 10, top: 5),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: ShakeWidget(
                                key: Key("value"),
                                duration: Duration(milliseconds: 700),
                                child: Text(
                                  _validatePincode,
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
                            SizedBox(height: 3),
                          ],
                        ],
                      ),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text('House Number, Building Name',
                          style: TextStyle(
                              color: Color(0xff110B0F),
                              fontFamily: 'RozhaOne',
                              fontSize: 15,
                              height: 21.3 / 15,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.050,
                        child: TextFormField(
                          controller: _HouseNumberController,
                          keyboardType: TextInputType.text,
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            setState(() {
                              // _validateTitle="";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              // _validateTitle="";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            hintText: "Address",
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
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'RozhaOne',
                            overflow: TextOverflow
                                .ellipsis, // Add ellipsis for long text
                          ),
                          textAlignVertical: TextAlignVertical
                              .center,
                        ),
                      ),
                      if (_validatehouse.isNotEmpty) ...[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ShakeWidget(
                            key: Key("value"),
                            duration: Duration(milliseconds: 700),
                            child: Text(
                              _validatehouse,
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
                        SizedBox(height: 3),
                      ],
                      SizedBox(
                        height: 3,
                      ),
                      Text('City',
                          style: TextStyle(
                              color: Color(0xff110B0F),
                              fontFamily: 'RozhaOne',
                              fontSize: 15,
                              height: 21.3 / 15,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.050,
                        child: TextFormField(
                          controller: _cityController,
                          keyboardType: TextInputType.text,
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            setState(() {
                              // _validateTitle="";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              // _validateTitle="";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            hintText: "city",
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
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'RozhaOne',
                            overflow: TextOverflow
                                .ellipsis, // Add ellipsis for long text
                          ),
                          textAlignVertical: TextAlignVertical
                              .center,
                        ),
                      ),
                      if (_validatecity.isNotEmpty) ...[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ShakeWidget(
                            key: Key("value"),
                            duration: Duration(milliseconds: 700),
                            child: Text(
                              _validatecity,
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
                        SizedBox(height: 3),
                      ],
                      SizedBox(
                        height: 2,
                      ),
                      Text('Road name,Area Colony',
                          style: TextStyle(
                              color: Color(0xff110B0F),
                              fontFamily: 'RozhaOne',
                              fontSize: 15,
                              height: 21.3 / 15,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.050,
                        child: TextFormField(
                          controller: _AreaController,
                          keyboardType: TextInputType.text,
                          cursorColor: Color(0xff8856F4),
                          onTap: () {
                            setState(() {
                              // _validateTitle="";
                            });
                          },
                          onChanged: (v) {
                            setState(() {
                              // _validateTitle="";
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            hintText: "Road name,Area Colony",
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
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'RozhaOne',
                            overflow: TextOverflow
                                .ellipsis, // Add ellipsis for long text
                          ),
                          textAlignVertical: TextAlignVertical
                              .center,
                        ),
                      ),
                      if (_validatearea.isNotEmpty) ...[
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 8, bottom: 10, top: 5),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ShakeWidget(
                            key: Key("value"),
                            duration: Duration(milliseconds: 700),
                            child: Text(
                              _validatearea,
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
                        SizedBox(height: 3),
                      ],
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start, // Centers the row
                          children: <Widget>[
                            // Home radio button
                            Row(
                              children: [
                                Radio<String>(
                                  activeColor: color1,
                                  value: 'Home',
                                  groupValue: _selectedOption,
                                  onChanged: _handleRadioValueChanged,
                                ),
                                Text('Home',
                                    style: TextStyle(
                                        color: Color(0xff110B0F),
                                        fontFamily: 'Inter',
                                        fontSize: 15,
                                        height: 21.3 / 15,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),

                            // Office radio button
                            Row(
                              children: [
                                Radio<String>(
                                  activeColor: color1,
                                  value: 'Office',
                                  groupValue: _selectedOption,
                                  onChanged: _handleRadioValueChanged,
                                ),
                                Text('Office',
                                    style: TextStyle(
                                        color: Color(0xff110B0F),
                                        fontFamily: 'Inter',
                                        fontSize: 15,
                                        height: 21.3 / 15,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            Row(
                              children: [
                                Radio<String>(
                                  activeColor: Color(0xffCAA16C),
                                  value: 'Other',
                                  groupValue: _selectedOption,
                                  onChanged: _handleRadioValueChanged,
                                ),
                                Text('Other',
                                    style: TextStyle(
                                        color: Color(0xff110B0F),
                                        fontFamily: 'RozhaOne',
                                        fontSize: 15,
                                        height: 21.3 / 15,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: InkResponse(
          onTap: () {
            if(isLoading){

            }else{
              _validateFields();
            }
          },
          child: Container(
            width: w,
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            height: MediaQuery.of(context).size.height * 0.050,
            decoration: BoxDecoration(
              color: color1,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(
              child:isLoading ?spinkits.getFadingCircleSpinner(color: color1):
              Text(
                "SAVE ADDRESS",
                style: TextStyle(
                  color: color4,
                  fontFamily: "RozhaOne",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 21 / 16,
                ),
              ),
            ),
          ),
        ),
      )
    :NoInternetWidget();
  }
}
