import 'package:drugcalm/utils/CustomAppBar.dart';
import 'package:flutter/material.dart';

import '../utils/CustomAppBar1.dart';
import '../utils/constants.dart';

class Productdetails extends StatefulWidget {
  const Productdetails({super.key});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar1(
        title: 'PRODUCT DETAIL',
        actions: [],
      ),
      body: Column(
        children: [
          Stack(children: [
            Container(
              padding: EdgeInsets.all(10),
              height: h * 0.25,
              decoration: BoxDecoration(
                color: color4,
              ),
              child: Center(
                child: Image.asset(
                  'assets/dolo250 Oral.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
                bottom: h * 0.03,
                left: w * 0.3,
                child: Image.asset(
                  'assets/prouduct labl.png',
                  fit: BoxFit.contain,
                  color: color4,
                  width: w * 0.35,
                  height: h * 0.2,
                )),
            Positioned(
                right: h * 0.02,
                top: h * 0.01,
                child: Image.asset(
                  'assets/share.png',
                  fit: BoxFit.contain,
                  width: w * 0.08,
                  height: h * 0.08,
                )),
            Positioned(
                right: h * 0.02,
                top: h * 0.06,
                child: Image.asset(
                  'assets/favrate.png',
                  fit: BoxFit.contain,
                  width: w * 0.08,
                  height: h * 0.08,
                )),
            Positioned(
                right: h * 0.02,
                top: h * 0.11,
                child: Image.asset(
                  'assets/block.png',
                  fit: BoxFit.contain,
                  width: w * 0.08,
                  height: h * 0.08,
                ))
          ]),
          SizedBox(
            height: h * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i <= 4; i++)
                Container(
                  margin: EdgeInsets.all(5),
                  height: h * 0.01,
                  width: w * 0.02,
                  decoration: BoxDecoration(
                      // color: currentindex == i ? color1 : color2,
                      color: color1,
                      borderRadius: BorderRadius.circular(100)),
                ),
            ],
          ),
          container(context,
              colors: color4,
              w: w,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    context,
                    'Dolo 250 Oral Suspension',
                    18,
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  text(context, 'by Micro Labs Ltd', 14,
                      color: color2, fontWeight: FontWeight.w400),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  RatingWidget(
                    initialRating: 4.0,
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Row(
                    children: [
                      text(context, 'Net Price:', 12, color: color),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      text(context, '₹ 93.81', 14),
                      SizedBox(
                        width: w * 0.02,
                      ),
                      text(context, 'MRP:', 12, color: color),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      text(context, '₹ 106.8', 14, color: color1),
                      SizedBox(
                        height: h * 0.01,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Row(
                    children: [
                      container(context,
                          borderRadius: BorderRadius.circular(4),
                          padding: EdgeInsets.all(6),
                          colors: Color(0xffFFE5B4),
                          child: text(context, 'BEST SELLER', 11,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        width: w * 0.02,
                      ),
                      text(context, 'IN', 11),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      text(context, 'NUTRACITTA STORE', 11,
                          textdecoration: TextDecoration.underline,
                          decorationcolor: color)
                    ],
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  text(context, 'STOCK AVAILABLE', 11,
                      fontWeight: FontWeight.w400),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Row(
                    children: [
                      container(
                        context,
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                        borderRadius: BorderRadius.circular(4),
                        colors: Color(0xffF1F1F1),
                        child: Row(
                          children: [
                            text(context, '7 DAYS RETURN', 11,
                                fontWeight: FontWeight.w400),
                            SizedBox(
                              width: w * 0.02,
                            ),
                            Image.asset('assets/about.png',
                                color: color, width: w * 0.04)
                          ],
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          container(
                            context,
                            border: Border.all(color: color5, width: 1),
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 8),
                            borderRadius: BorderRadius.circular(4),
                            child: Row(
                              children: [
                                text(context, 'DCPO', 11,color: color5,
                                    fontWeight: FontWeight.w400),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                Image.asset('assets/about.png',
                                    color: color5, width: w * 0.04)
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: w*0.02,),
                      Row(
                        children: [
                          container(
                            context,
                           colors: color5,
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 8),
                            borderRadius: BorderRadius.circular(4),
                            child: Row(
                              children: [
                                text(context, 'ALLOPATHY', 11,color: color4,
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  
                  // container(context, child: child)
                  
                ],
              ))
        ],
      ),
    );
  }
}
