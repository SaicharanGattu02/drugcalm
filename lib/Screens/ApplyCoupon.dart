import 'package:dotted_line/dotted_line.dart';

import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/otherservices.dart';
import '../providers/ConnectivityProviders.dart';





class ApplyCoupon extends StatefulWidget {
  const ApplyCoupon({super.key});

  @override
  State<ApplyCoupon> createState() => _ApplyCouponState();
}

class _ApplyCouponState extends State<ApplyCoupon> {
  // Sample list of coupons to be used in ListView.builder
  List<Map<String, String>> coupons = [
    {
      'title': 'Big Bachat Tuesday is LIVE.!',
      'description': 'Get FLAT 5% OFF* during Big Bachat Tuesday on Healthcare Products on Orders above 100',
      'expiry': 'Expires 15 Days',
      'code': 'BCH12',
      'image': 'assets/amazonpay.png'
    },
    // You can add more coupon objects here
    {
      'title': 'Mega Sale on Health Products',
      'description': 'Get FLAT 10% OFF* on Orders above 500',
      'expiry': 'Expires 7 Days',
      'code': 'HEALTH10',
      'image': 'assets/amazonpay.png'
    },
    {
      'title': 'Weekend Special Discount',
      'description': 'Get FLAT 20% OFF* on all Healthcare Orders',
      'expiry': 'Expires 3 Days',
      'code': 'WEEKEND20',
      'image': 'assets/amazonpay.png'
    },
    {
      'title': 'Exclusive Offer for You',
      'description': 'Get 15% OFF* on Orders above 300',
      'expiry': 'Expires 5 Days',
      'code': 'EXCLUSIVE15',
      'image': 'assets/amazonpay.png'
    },
  ];



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


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;


    var connectiVityStatus =Provider.of<ConnectivityProviders>(context);
    return
      (connectiVityStatus.isDeviceConnected == "ConnectivityResult.wifi" ||
          connectiVityStatus.isDeviceConnected == "ConnectivityResult.mobile")
          ?

      Scaffold(
      appBar: CustomAppBar1(title: 'APPLY COUPON', actions: [Container()]),
      body: Container(
        width: w,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Drug Clam Background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: h * 0.06,
              width: w,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border.all(color: color7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  text(
                    context,
                    'Enter Coupon Code',
                    15,
                    color: color,
                    fontWeight: FontWeight.w500,
                    fontfamily: 'Inter',
                  ),
                  Spacer(),
                  text(
                      context,
                      'APPLY',
                      15,
                      fontWeight: FontWeight.w400,
                      color: color1
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            text(
              context,
              'Coupons',
              15,
              fontWeight: FontWeight.w400,
              fontfamily: 'Inter',
              color: color18,
            ),
            // ListView.builder to create a dynamic list of coupons
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,  // Makes the ListView take up only as much space as it needs
                physics: AlwaysScrollableScrollPhysics(), // Disable scrolling for the list inside a SingleChildScrollView
                itemCount: coupons.length,
                itemBuilder: (context, index) {
                  var coupon = coupons[index];
                  return Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      color: color4,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: color22, width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            container(
                              padding: EdgeInsets.all(0),
                              context,
                              w: 90.0,
                              h: 90.0,
                              child: Image.asset(
                                coupon['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width:w*0.03),
                            container(
                              padding: EdgeInsets.all(0),
                              context,
                              w: w * 0.53,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(
                                      context,
                                      coupon['title']!,
                                      14,
                                      color: color18,
                                      fontWeight: FontWeight.w400,
                                    fontfamily: "Inter",
                                    textAlign: TextAlign.start
                                  ),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  text(
                                    context,
                                    coupon['description']!,
                                    textAlign: TextAlign.left,
                                    13,
                                    fontWeight: FontWeight.w400,
                                    fontfamily: "Inter",
                                    color: color,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        SizedBox(
                          width: w * 0.3,
                          child: text(
                              context,
                              coupon['expiry']!,
                              13,
                              fontWeight: FontWeight.w400,
                              color: color1
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        DottedLine(dashColor: color,),
                        SizedBox(height: h * 0.01,),
                        Row(
                          children: [
                            text(
                                context,
                                'CODE:',
                                15,
                                fontWeight: FontWeight.w400,
                                color: color18
                            ),
                            text(
                                context,
                                coupon['code']!,
                                15,
                                fontWeight: FontWeight.w400,
                                color: color18
                            ),
                            Spacer(),
                            text(
                                context,
                                'APPLY',
                                15,
                                fontWeight: FontWeight.w400,
                                color: color1
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ):NoInternetWidget();
  }

}
