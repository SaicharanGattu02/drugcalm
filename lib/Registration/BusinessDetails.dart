import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:drugcalm/Registration/BasicInformation.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/ShakeWidget.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({super.key});

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  final TextEditingController _businessRegistraionController =TextEditingController();
  final TextEditingController _expiryController =TextEditingController();

  String validatebusinessRegistraion ="";
  String validateexpiry ="";



  String selectedOption = "Allopathy/Pharmaceutical";
  final List<String> dropdownOptions = ["Allopathy/Pharmaceutical", "Ayurvedic/Herbal", "Veterinary","OTC General","Surgical"];

  static Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
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
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                Row(
                    children: [
                      InkResponse(onTap: (){
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

                  SizedBox(height: h*0.01,),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
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
                                  print("Selected Option:${selectedOption}");
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 45,
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    border: Border.all(color: Color(0xffD0CBDB)),
                                    color: Color(0xffFCFAFF)),
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
                                width: w*0.88,
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
                          SizedBox(height:h*0.01,),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.050,
                            child: TextFormField(
                              controller: _businessRegistraionController,
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xff8856F4),
                              onTap:(){
                                // closeDropdown();
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              onChanged: (v){
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                hintText: "Business Registration Number",
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
                          SizedBox(height:h*0.01,),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.050,
                            child: TextFormField(
                              controller: _businessRegistraionController,
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xff8856F4),
                              onTap:(){
                                // closeDropdown();
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              onChanged: (v){
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                hintText: "Business License Number",
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
                          ], SizedBox(height:h*0.01,),
                          Row(
                            children: [
                    
                              Container(
                                width: w*0.5,
                                height: MediaQuery.of(context).size.height * 0.050,
                                child: TextFormField(
                                  controller: _businessRegistraionController,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xff8856F4),
                                  onTap:(){
                                    // closeDropdown();
                                    setState(() {
                                      validatebusinessRegistraion="";
                                    });
                                  },
                                  onChanged: (v){
                                    setState(() {
                                      validatebusinessRegistraion="";
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                    hintText: "Drug licence",
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
                              SizedBox(width: w*0.025,),
                              _buildDateField(
                                _expiryController,
                              ),
                    
                    
                            ],
                          ),
                    
                    
                    
                          SizedBox(height:h*0.01,),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.050,
                            child: TextFormField(
                              controller: _businessRegistraionController,
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xff8856F4),
                              onTap:(){
                                // closeDropdown();
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              onChanged: (v){
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                hintText: "GSTIN number",
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
                          SizedBox(height:h*0.01,),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.050,
                            child: TextFormField(
                              controller: _businessRegistraionController,
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xff8856F4),
                              onTap:(){
                                // closeDropdown();
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              onChanged: (v){
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                hintText: "PAN number",
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
                          SizedBox(height:h*0.01,),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.050,
                            child: TextFormField(
                              controller: _businessRegistraionController,
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xff8856F4),
                              onTap:(){
                                // closeDropdown();
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              onChanged: (v){
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                hintText: "municipal license number",
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
                          ], SizedBox(height:h*0.01,),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.050,
                            child: TextFormField(
                              controller: _businessRegistraionController,
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xff8856F4),
                              onTap:(){
                                // closeDropdown();
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              onChanged: (v){
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                hintText: "Address Information",
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
                          ], SizedBox(height:h*0.01,),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.050,
                            child: TextFormField(
                              controller: _businessRegistraionController,
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xff8856F4),
                              onTap:(){
                                // closeDropdown();
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              onChanged: (v){
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                hintText: "self pan",
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
                          SizedBox(height:h*0.01,),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.050,
                            child: TextFormField(
                              controller: _businessRegistraionController,
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xff8856F4),
                              onTap:(){
                                // closeDropdown();
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              onChanged: (v){
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                hintText: "Business Address",
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
                         SizedBox(height:h*0.01,),
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
                                    border: Border.all(color: Color(0xffD0CBDB)),
                                    color: Color(0xffFCFAFF)),
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
                                width: w*0.88,
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
                          SizedBox(height:h*0.01,),
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
                                    border: Border.all(color: Color(0xffD0CBDB)),
                                    color: Color(0xffFCFAFF)),
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
                                width: w*0.88,
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
                          SizedBox(height:h*0.01,),
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
                                    border: Border.all(color: Color(0xffD0CBDB)),
                                    color: Color(0xffFCFAFF)),
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
                                width: w*0.88,
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
                          SizedBox(height:h*0.01,),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.050,
                            child: TextFormField(
                              controller: _businessRegistraionController,
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xff8856F4),
                              onTap:(){
                                // closeDropdown();
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              onChanged: (v){
                                setState(() {
                                  validatebusinessRegistraion="";
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
                          SizedBox(height:h*0.01,),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.050,
                            child: TextFormField(
                              controller: _businessRegistraionController,
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xff8856F4),
                              onTap:(){
                                // closeDropdown();
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              onChanged: (v){
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                hintText: "Business Operations",
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
                          SizedBox(height:h*0.01,),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.050,
                            child: TextFormField(
                              controller: _businessRegistraionController,
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xff8856F4),
                              onTap:(){
                                // closeDropdown();
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              onChanged: (v){
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                hintText: "Operating Hours for delivery's",
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
                          SizedBox(height:h*0.01,),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.050,
                            child: TextFormField(
                              controller: _businessRegistraionController,
                              keyboardType: TextInputType.text,
                              cursorColor: Color(0xff8856F4),
                              onTap:(){
                                // closeDropdown();
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              onChanged: (v){
                                setState(() {
                                  validatebusinessRegistraion="";
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                hintText: "Number of Outlets",
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BasicInformation()));
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


  Widget _buildDateField(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.28,

          child: TextField(
            controller: controller,
            readOnly: true,
            onTap: () {
              _selectDate(context, controller);
            },
            decoration: InputDecoration(
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
          ),
        ),
      ],

    );
  }

}
