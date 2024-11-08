import 'package:dotted_line/dotted_line.dart';

import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';


class ApplyCoupon extends StatefulWidget {
  const ApplyCoupon({super.key});

  @override
  State<ApplyCoupon> createState() => _ApplyCouponState();
}

class _ApplyCouponState extends State<ApplyCoupon> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar1(title: 'APPLY COUPON', actions: []),
      body: SingleChildScrollView(
        child: Container(
            width: w,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/Drug Clam Background.png',
                    ),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: h*0.06,
                  width: w,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      border: Border.all(color: color7),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      text(context, 'Enter Coupon Code', 15,color: color,
                          fontWeight: FontWeight.w500, fontfamily: 'Inter'),
                      Spacer(),
                      text(context, 'APPLY', 15,
                          fontWeight: FontWeight.w400, color: color1)
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
                for(int i=1;i<=4;i++)
                container(context,
                    colors: color4,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: color22, width: 1),
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(top: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            container(context,
                                w: w * 0.1,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/amazonpay.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            container(
                              context,
                              w: w * 0.25,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(
                                      context, 'Big Bachat Tuesday is LIVE.!', 15,
                                      color: color18,
                                      fontWeight: FontWeight.w400),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  text(
                                      context,
                                      'Get FLAT 5% OFF* during Big Bachat Tuesday on Healthcare Products on Orders above 100',
                                      textAlign: TextAlign.left,
                                      14,
                                      fontWeight: FontWeight.w400,
                                      color: color),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        SizedBox(
                            width: w * 0.08,
                            child: text(context, 'Expires 15 Days', 13,
                                fontWeight: FontWeight.w400, color: color1)),

                        SizedBox(
                          height: h * 0.01,
                        ),
                        DottedLine(dashColor:color,),
                        SizedBox(height: h*0.01,),
                        Row(
                          children: [
                            text(context, 'CODE:', 15,fontWeight: FontWeight.w400,color: color18),
                            text(context, 'BCH12', 15,fontWeight: FontWeight.w400,color: color18),
                            Spacer(),
                            text(context, 'APPLY', 15,
                                fontWeight: FontWeight.w400, color: color1)
                          ],
                        )
        
        
                      ],
                    )),
              ],
            )),
      ),
    );
  }
}
