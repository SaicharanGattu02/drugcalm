import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Services/otherservices.dart';
import '../providers/ConnectivityProviders.dart';
import '../utils/Mywidgets.dart';
import '../utils/constants.dart';

class Savingsscreen extends StatefulWidget {
  const Savingsscreen({super.key});

  @override
  State<Savingsscreen> createState() => _SavingsscreenState();
}

class _SavingsscreenState extends State<Savingsscreen> {

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
      appBar: CustomAppBar1(
        title: "SAVINGS",
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/vochar.png",
                  width: 150,
                  height: 75,
                ),
                Image.asset(
                  "assets/coupon.png",
                  width: 150,
                  height: 75,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/sack-coin.png",
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Heading 1",
                            style: TextStyle(
                              color: Color(0xff16192C),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: 'Inter',
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.info,
                            size: 20,
                            color: Color(0xffAFAFAF),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      _buildCircularProgress(30.0, color1, Color(0xffEFEFEF)),
                      SizedBox(height: 6),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              color1, // Make button background transparent
                          shadowColor: Colors
                              .transparent, // Remove default button shadow
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        child: Text(
                          'By Distributor',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/sack-coin.png",
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Heading 1",
                            style: TextStyle(
                              color: Color(0xff16192C),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: 'Inter',
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.info,
                            size: 20,
                            color: Color(0xffAFAFAF),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      _buildCircularProgress(
                          58.0, Color(0xffFF3B30), Color(0xffEFEFEF)),
                      SizedBox(height: 6),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              color1, // Make button background transparent
                          shadowColor: Colors
                              .transparent, // Remove default button shadow
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        child: Text(
                          'By Distributor',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/sack-coin.png",
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Heading 1",
                            style: TextStyle(
                              color: Color(0xff16192C),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: 'Inter',
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.info,
                            size: 20,
                            color: Color(0xffAFAFAF),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      _buildCircularProgress(28.0, color1, Color(0xffEFEFEF)),
                      SizedBox(height: 6),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              color1, // Make button background transparent
                          shadowColor: Colors
                              .transparent, // Remove default button shadow
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        child: Text(
                          'By Distributor',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/sack-coin.png",
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Heading 1",
                            style: TextStyle(
                              color: Color(0xff16192C),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: 'Inter',
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.info,
                            size: 20,
                            color: Color(0xffAFAFAF),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      _buildCircularProgress(
                          28.0, Color(0xff01A744), Color(0xffEFEFEF)),
                      SizedBox(height: 6),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              color1, // Make button background transparent
                          shadowColor: Colors
                              .transparent, // Remove default button shadow
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        child: Text(
                          'By Distributor',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ):NoInternetWidget();
  }

  Widget _buildCircularProgress(double percent, Color color, Color bgcolor) {
    return Container(
      decoration: BoxDecoration(
          color: color4,
          shape: BoxShape.circle,
          border: Border.all(color: Color(0xffEFEFEF))),
      width: 150,
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(136, 136),
            painter: RoundedProgressPainter(percent / 100, bgcolor, color),
          ),
          Text(
            '${percent.toInt()}%',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              fontFamily: "Inter",
            ),
          ),
        ],
      ),
    );
  }
}
