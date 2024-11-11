import 'package:drugcalm/Screens/AddAddress.dart';
import 'package:drugcalm/Screens/My%20Orders%20Screen.dart';
import 'package:drugcalm/Screens/My%20Profile.dart';
import 'package:drugcalm/Screens/WishListScreen.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/CustomAppBar1.dart';
import 'AddressList.dart';
import 'BlockListScreen.dart';
import 'Madicine Request Scrfeen.dart';
import 'OrderScreen.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
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
          container(context,colors: color4,
            child:Column(
              children: [
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersScreen(),));
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
                
              ],
            )
          ),
            ],
          ),
        ),
      ),
    );
  }
}
