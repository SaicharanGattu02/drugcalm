import 'package:carousel_slider/carousel_slider.dart';
import 'package:drugcalm/Screens/CartScreen.dart';
import 'package:drugcalm/Screens/ProductDetails.dart';
import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:flutter/material.dart';

import '../others/Banners.dart';
import '../utils/constants.dart';

class Blocklistscreen extends StatefulWidget {
  const Blocklistscreen({super.key});

  @override
  State<Blocklistscreen> createState() => _BlocklistscreenState();
}

class _BlocklistscreenState extends State<Blocklistscreen> {
  int currentindex = 0;
  int _counter = 0;
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar1(title: 'BLOCKLIST', actions: [Container()]),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
              SizedBox(height: h * 0.01),

              // Use ListView.builder to generate the list items dynamically
              ListView.builder(
                shrinkWrap: true, // Ensures it doesn't take up infinite space
                physics:
                    NeverScrollableScrollPhysics(), // Disable scrolling here
                itemCount: 6,
                itemBuilder: (context, index) {
                  return InkResponse(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Productdetails(),
                          ));
                    },
                    child: Container(
                      width: w,
                      padding: EdgeInsets.only(
                          left: 8, right: 8, top: 16, bottom: 16),
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:
                            color12, // Assuming `color12` is a predefined color
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/dolo250 Oral.png.png',
                                fit: BoxFit.contain,
                                width: w * 0.235,
                              ),
                              SizedBox(width: w * 0.04),
                              Container(
                                width: w * 0.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    container(
                                      context,
                                      borderRadius: BorderRadius.circular(100),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 2),
                                      colors: color13,
                                      child: text(context, 'Best Seller', 6,
                                          fontWeight: FontWeight.w500,
                                          color: color4),
                                    ),
                                    text(
                                        context, 'Dolo 250 Oral Suspension', 14,
                                        fontWeight: FontWeight.w500,
                                        color: color11,
                                        textAlign: TextAlign.left,
                                        maxLines: 2),
                                    text(context, '60.0 ml in 1 bottle', 12,
                                        color: color,
                                        fontWeight: FontWeight.w400,
                                        textAlign: TextAlign.left),
                                    RatingWidget(initialRating: 4),
                                    Row(
                                      children: [
                                        text(context, 'Net Price:', 10,
                                            color: color,
                                            fontWeight: FontWeight.w400),
                                        SizedBox(width: w * 0.01),
                                        text(context, '₹ 93.81', 14),
                                        Spacer(),
                                        text(context, 'M.R.P: ', 10,
                                            color: color,
                                            fontWeight: FontWeight.w400),
                                        text(context, '₹106.8', 12,
                                            color: color1),
                                        SizedBox(height: h * 0.01),
                                      ],
                                    ),
                                    SizedBox(height: h * 0.008),
                                    Row(
                                      children: [
                                        container(context,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4),
                                            colors: Color(0xffFEF6F5),
                                            child: Row(
                                              children: [
                                                text(context, 'MARGIN', 10,
                                                    color: color11,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                SizedBox(width: w * 0.01),
                                                text(context, '16%', 10,
                                                    color: color1,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ],
                                            )),
                                        Spacer(),
                                        text(context, 'PTR', 10,
                                            color: color11,
                                            fontWeight: FontWeight.w400),
                                        SizedBox(width: w * 0.01),
                                        Image.asset('assets/about.png',
                                            color: color1, width: w * 0.03),
                                        SizedBox(width: w * 0.01),
                                        text(context, '₹180', 10,
                                            color: color11,
                                            fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                    SizedBox(height: h * 0.01),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 4),
                                          w: w * 0.2,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          colors: color1,
                                          context,
                                          child: Center(
                                            child: text(context, 'ADD', 12,
                                                color: color4,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Spacer(),
                                        Image.asset('assets/favrate.png',
                                            fit: BoxFit.contain,
                                            width: w * 0.06),
                                        Spacer(),
                                        Image.asset('assets/block.png',
                                            fit: BoxFit.contain,
                                            width: w * 0.06),
                                        Spacer(),
                                        Image.asset('assets/youtube.png',
                                            fit: BoxFit.contain,
                                            width: w * 0.08),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: h * 0.01),
                          SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                container(
                                  context,
                                  colors: color15.withOpacity(0.2),
                                  border: Border.all(color: color15, width: 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 3),
                                  borderRadius: BorderRadius.circular(100),
                                  child: text(context, 'GENERIC', 10,
                                      color: color,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: w * 0.01,
                                ),
                                container(
                                  context,
                                  colors: color15.withOpacity(0.2),
                                  border: Border.all(color: color15, width: 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 3),
                                  borderRadius: BorderRadius.circular(100),
                                  child: text(context, 'OTC', 10,
                                      color: color,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: w * 0.01,
                                ),
                                container(
                                  context,
                                  colors: color15.withOpacity(0.2),
                                  border: Border.all(color: color15, width: 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 3),
                                  borderRadius: BorderRadius.circular(100),
                                  child: text(context, 'SPECALITY', 10,
                                      color: color,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: w * 0.01,
                                ),
                                container(
                                  context,
                                  colors: color15.withOpacity(0.2),
                                  border: Border.all(color: color15, width: 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 3),
                                  borderRadius: BorderRadius.circular(100),
                                  child: text(context, 'OT CONSUMASABLE', 10,
                                      color: color,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: w * 0.01,
                                ),
                                container(
                                  context,
                                  colors: color15.withOpacity(0.2),
                                  border: Border.all(color: color15, width: 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 3),
                                  borderRadius: BorderRadius.circular(100),
                                  child: text(context, 'LAB CONSUMASABLE', 10,
                                      color: color,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: w * 0.01,
                                ),
                                container(
                                  context,
                                  colors: color4,
                                  border: Border.all(color: color15, width: 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 3),
                                  borderRadius: BorderRadius.circular(100),
                                  child: text(context, 'FMCG', 10,
                                      color: color,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: w * 0.01,
                                ),
                                container(
                                  context,
                                  colors: color4,
                                  border: Border.all(color: color15, width: 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 3),
                                  borderRadius: BorderRadius.circular(100),
                                  child: text(context, 'PRO', 10,
                                      color: color,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: h * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text(
                                context,
                                'Offer time',
                                10,
                                color: color16,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(width: w * 0.01),
                              text(
                                context,
                                '08:40:10',
                                10,
                                color: color16,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
