import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:drugcalm/Authentication/SignIn.dart';
import 'package:drugcalm/Screens/My%20Profile.dart';
import 'package:drugcalm/Screens/SavingsScreen.dart';
import 'package:drugcalm/Screens/WishListScreen.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/otherservices.dart';
import '../providers/ConnectivityProviders.dart';
import '../providers/LanguageProvider.dart';
import '../utils/CustomAppBar1.dart';
import '../utils/Preferances.dart';
import 'AddressList.dart';
import 'BlockListScreen.dart';
import 'Madicine Request Scrfeen.dart';
import 'OrderListScreen.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {

  @override
  void initState() {
    Provider.of<ConnectivityProviders>(context, listen: false).initConnectivity();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<ConnectivityProviders>(context,listen: false).dispose();
    super.dispose();
  }

  // List of language names (displayed in the dropdown)
  final List<String> _languages = ['English', 'Hindi', 'Telugu', 'French'];

  // Corresponding language codes
  final List<String> _languageCodes = ['en', 'hi', 'te', 'fr'];

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var connectiVityStatus =Provider.of<ConnectivityProviders>(context);

    return
      (connectiVityStatus.isDeviceConnected == "ConnectivityResult.wifi" ||
          connectiVityStatus.isDeviceConnected == "ConnectivityResult.mobile")
          ?
      Scaffold(
      appBar: CustomAppBar1(
        title: 'PROFILE',
        actions: [Container()],
      ),
      body: Container(
        width: w,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/Drug Clam Background.png',
                ),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              container(context,colors: color4,
                  child:Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/wallet.png",width: 50,height: 50,),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(context, '₹20,546', 18,
                              color: color11,
                              fontfamily: "Inter",
                              fontWeight: FontWeight.w500),
                          text(context, 'Payment to be received', 13,
                              color: color20,
                              fontfamily: "Inter",
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_outlined,size: 18,),
                    ],
                  ),
                  Divider(
                    color: color9,
                    height: 30,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(context, 'Utilized', 10,
                              color: color8,
                              fontfamily: "Poppins",
                              fontWeight: FontWeight.w400),
                          text(context, '₹20,546', 14,
                              color: color11,
                              fontfamily: "Poppins",
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          text(context, 'Sanctioned', 10,
                              color: color8,
                              fontfamily: "Poppins",
                              fontWeight: FontWeight.w400),
                          text(context, '₹17,500', 14,
                              color: color11,
                              fontfamily: "Poppins",
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    ],
                  )
                ],
              )),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Savingsscreen(),));
            },
            child: container(context,colors: color4,
              child:Column(
                children: [
                  // Container(
                  //     width: w * 0.72,
                  //     child: DropdownButtonHideUnderline(
                  //       child: DropdownButton2<String>(
                  //         isExpanded: true,
                  //         // Ensure selectedLanguage is null or empty initially so that the hint appears
                  //         value: context
                  //             .watch<LanguageProvider>()
                  //             .selectedLanguage
                  //             .isEmpty
                  //             ? null // Show the hint if the value is null or empty
                  //             : context
                  //             .watch<LanguageProvider>()
                  //             .selectedLanguage,
                  //         hint: text(context, "Select language", 16),
                  //         items: _languages.asMap().entries.map((entry) {
                  //           return DropdownMenuItem<String>(
                  //             value: _languageCodes[entry.key],  // Get the corresponding language code
                  //             child: Text(
                  //               entry.value,  // Display the language name
                  //               style: TextStyle(
                  //                 fontSize: 15,
                  //                 fontFamily: "Inter",
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           );
                  //         }).toList(),
                  //         onChanged: (String? newValue) {
                  //           if (newValue != null) {
                  //             context
                  //                 .read<LanguageProvider>()
                  //                 .setLanguage(newValue);
                  //           }
                  //         },
                  //         buttonStyleData: ButtonStyleData(
                  //           height: 45,
                  //           width: double.infinity,
                  //           padding:
                  //           const EdgeInsets.only(left: 14, right: 14),
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(7),
                  //               color: Color(0xffE9F7FF),
                  //               border: Border.all(color: color7)),
                  //         ),
                  //         iconStyleData: const IconStyleData(
                  //           icon: Icon(
                  //             Icons.arrow_drop_down,
                  //             size: 25,
                  //           ),
                  //           iconSize: 14,
                  //           iconEnabledColor: Colors.black,
                  //           iconDisabledColor: Colors.black,
                  //         ),
                  //         dropdownStyleData: DropdownStyleData(
                  //           maxHeight: 200,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(14),
                  //             color: Colors.white,
                  //           ),
                  //           scrollbarTheme: ScrollbarThemeData(
                  //             radius: const Radius.circular(40),
                  //             thickness: MaterialStateProperty.all(6),
                  //             thumbVisibility:
                  //             MaterialStateProperty.all(true),
                  //           ),
                  //         ),
                  //         menuItemStyleData: const MenuItemStyleData(
                  //           height: 40,
                  //           padding: EdgeInsets.only(left: 14, right: 14),
                  //         ),
                  //       ),
                  //     )),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: Color(0xffD4DDEB))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(context, 'Dashboard', 16,
                            color: color11,
                            fontfamily: "Inter",
                            fontWeight: FontWeight.w500),
                        Icon(Icons.arrow_forward_ios_outlined,size: 18,color: color1,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Color(0xffD4DDEB))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(context, 'Short Book', 16,
                            color: color11,
                            fontfamily: "Inter",
                            fontWeight: FontWeight.w500),
                        Icon(Icons.arrow_forward_ios_outlined,size: 18,color: color1,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkResponse(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineRequest(),));
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: Color(0xffD4DDEB))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(context, 'Request New', 16,
                              color: color11,
                              fontfamily: "Inter",
                              fontWeight: FontWeight.w500),
                          Icon(Icons.arrow_forward_ios_outlined,size: 18,color: color1,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Color(0xffD4DDEB))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(context, 'Pay Dues', 16,
                            color: color11,
                            fontfamily: "Inter",
                            fontWeight: FontWeight.w500),
                        Icon(Icons.arrow_forward_ios_outlined,size: 18,color: color1,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkResponse(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile(),));
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: Color(0xffD4DDEB))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(context, 'My Profile', 16,
                              color: color11,
                              fontfamily: "Inter",
                              fontWeight: FontWeight.w500),
                          Icon(Icons.arrow_forward_ios_outlined,size: 18,color: color1,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkResponse(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddressListScreen(),));
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: Color(0xffD4DDEB))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(context, 'Address List', 16,
                              color: color11,
                              fontfamily: "Inter",
                              fontWeight: FontWeight.w500),
                          Icon(Icons.arrow_forward_ios_outlined,size: 18,color: color1,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkResponse(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersListScreen(),));
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: Color(0xffD4DDEB))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(context, 'Orders', 16,
                              color: color11,
                              fontfamily: "Inter",
                              fontWeight: FontWeight.w500),
                          Icon(Icons.arrow_forward_ios_outlined,size: 18,color: color1,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkResponse(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Wishlistscreen(),));
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: Color(0xffD4DDEB))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(context, 'Wishlist', 16,
                              color: color11,
                              fontfamily: "Inter",
                              fontWeight: FontWeight.w500),
                          Icon(Icons.arrow_forward_ios_outlined,size: 18,color: color1,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Blocklistscreen(),));
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: Color(0xffD4DDEB))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(context, 'Block List', 16,
                              color: color11,
                              fontfamily: "Inter",
                              fontWeight: FontWeight.w500),
                          Icon(Icons.arrow_forward_ios_outlined,size: 18,color: color1,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Color(0xffD4DDEB))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(context, 'Wallet', 16,
                            color: color11,
                            fontfamily: "Inter",
                            fontWeight: FontWeight.w500),
                        Icon(Icons.arrow_forward_ios_outlined,size: 18,color: color1,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Color(0xffD4DDEB))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(context, 'Earn For Refer', 16,
                            color: color11,
                            fontfamily: "Inter",
                            fontWeight: FontWeight.w500),
                        Icon(Icons.arrow_forward_ios_outlined,size: 18,color: color1,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Color(0xffD4DDEB))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(context, 'Become a Seller', 16,
                            color: color11,
                            fontfamily: "Inter",
                            fontWeight: FontWeight.w500),
                        Icon(Icons.arrow_forward_ios_outlined,size: 18,color: color1,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Color(0xffD4DDEB))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(context, 'Settings', 16,
                            color: color11,
                            fontfamily: "Inter",
                            fontWeight: FontWeight.w500),
                        Icon(Icons.arrow_forward_ios_outlined,size: 18,color: color1,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Color(0xffD4DDEB))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(context, 'Help', 16,
                            color: color11,
                            fontfamily: "Inter",
                            fontWeight: FontWeight.w500),
                        Icon(Icons.arrow_forward_ios_outlined,size: 18,color: color1,),
                      ],
                    ),
                  ), 
                  SizedBox(height: 10,),
                  
                  InkResponse(onTap: (){
                    PreferenceService().remove('token');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                  },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: Color(0xffD4DDEB))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(context, 'LogOut', 16,
                              color: color11,
                              fontfamily: "Inter",
                              fontWeight: FontWeight.w500),
                          Icon(Icons.arrow_forward_ios_outlined,size: 18,color: color1,),
                        ],
                      ),
                    ),
                  ),

                ],
              )
            ),
          ),
            ],
          ),
        ),
      ),
    ):NoInternetWidget();
  }
}
