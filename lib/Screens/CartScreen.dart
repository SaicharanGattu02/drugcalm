import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/CustomAppBar1.dart';
import '../utils/constants.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar1(
        title: 'CART',
        actions: [Container()],
      ),
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
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: color1),
              child: Row(
                children: [
                  Image.asset(
                    "assets/join_membership.png",
                    width: 35,
                    height: 39,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(context, "Join Membership to Save More.!", 14,
                          fontWeight: FontWeight.w400, color: color4),
                      text(context, "Exclusive offers Designed for you.", 12,
                          fontWeight: FontWeight.w400, color: color4),
                    ],
                  )
                ],
              ),
            ),
            container(
                w: w,
                padding: EdgeInsets.only(top: 16, bottom: 16),
                margin: EdgeInsets.only(top: 15, bottom: 15),
                borderRadius: BorderRadius.circular(8),
                colors: color4,
                context,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/dolo250 Oral.png.png',
                                fit: BoxFit.contain,
                                width: w * 0.08,
                                height: h * 0.06,
                              ),
                              container(context,
                                  borderRadius: BorderRadius.circular(100),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3, vertical: 2),
                                  colors: color13,
                                  child: Center(
                                    child: text(context, 'Best Seller', 6,
                                        fontWeight: FontWeight.w500,
                                        color: color4),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: w * 0.32,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      text(context, 'Dolo 250 Oral Suspension',
                                          14,
                                          fontWeight: FontWeight.w500,
                                          color: color11,
                                          textAlign: TextAlign.left,
                                          maxLines: 2),
                                      text(context,
                                          'Bottle of 60 ml Oral Suspension', 12,
                                          color: color,
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.left),
                                    ],
                                  ),
                                  Spacer(),
                                  container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 4),
                                      colors: Color(0xffEDF2F5),
                                      borderRadius: BorderRadius.circular(4),
                                      border:
                                          Border.all(color: color, width: 1),
                                      context,
                                      child: text(context, '10S', 12,
                                          fontWeight: FontWeight.w400,
                                          color: color11)),
                                ],
                              ),
                              RatingWidget(
                                initialRating: 4,
                              ),
                              Row(
                                children: [
                                  text(context, 'Net Price:', 10,
                                      color: color,
                                      fontWeight: FontWeight.w400),
                                  SizedBox(
                                    width: w * 0.01,
                                  ),
                                  text(context, '₹ 93.81', 14),
                                  Spacer(),
                                  text(context, 'M.R.P: ', 10,
                                      color: color,
                                      fontWeight: FontWeight.w400),
                                  // Spacer(),
                                  text(context, '₹106.8', 12, color: color1),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.008,
                              ),
                              Row(
                                children: [
                                  container(
                                      // padding:
                                      // EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                                      colors: Color(0xffEDF2F5),
                                      borderRadius: BorderRadius.circular(4),
                                      context,
                                      child: Row(
                                        children: [
                                          text(context, 'Scheme', 12,
                                              fontWeight: FontWeight.w400,
                                              color: color2),
                                          SizedBox(
                                            width: w * 0.01,
                                          ),
                                          container(
                                              // padding: EdgeInsets.symmetric(
                                              //     vertical: 2, horizontal: 4),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              border: Border.all(
                                                  color: color7, width: 1),
                                              context,
                                              child: text(
                                                context,
                                                '5+1',
                                                10,
                                                color: color10,
                                                fontWeight: FontWeight.w400,
                                              ))
                                        ],
                                      )),
                                  Spacer(),
                                  container(context,
                                      borderRadius: BorderRadius.circular(4),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      colors: Color(0xffFEF6F5),
                                      child: Row(
                                        children: [
                                          text(context, 'MARGIN', 10,
                                              color: color11,
                                              fontWeight: FontWeight.w400),
                                          SizedBox(
                                            width: w * 0.01,
                                          ),
                                          text(context, '16%', 10,
                                              color: color1,
                                              fontWeight: FontWeight.w400),
                                        ],
                                      )),
                                  Spacer(),
                                  text(context, 'PTR', 10,
                                      color: color11,
                                      fontWeight: FontWeight.w400),
                                  SizedBox(
                                    width: w * 0.007,
                                  ),
                                  Image.asset('assets/about.png',
                                      color: color1, width: w * 0.016),
                                  SizedBox(
                                    width: w * 0.007,
                                  ),
                                  text(context, '₹180', 10,
                                      color: color11,
                                      fontWeight: FontWeight.w400),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              Row(
                                children: [
                                  container(
                                    context,
                                    border: Border.all(color: color5, width: 1),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 3),
                                    borderRadius: BorderRadius.circular(4),
                                    child: Row(
                                      children: [
                                        text(context, 'DCPO', 10,
                                            color: color5,
                                            fontWeight: FontWeight.w400),
                                        SizedBox(
                                          width: w * 0.01,
                                        ),
                                        Image.asset('assets/about.png',
                                            color: color5, width: w * 0.015)
                                      ],
                                    ),
                                  ),


                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      container(
                                        context,
                                        colors: color5,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 4),
                                        borderRadius: BorderRadius.circular(4),
                                        child: Row(
                                          children: [
                                            text(context, 'Spaciality', 10,
                                                color: color4,
                                                fontWeight: FontWeight.w400),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  container(
                                    context,colors: color5.withOpacity(0.11),
                                    border: Border.all(color: color5, width: 1),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 3),
                                    borderRadius: BorderRadius.circular(4),
                                    child: Row(
                                      children: [
                                        text(context, 'COLD BOX', 10,
                                            color: color5,
                                            fontWeight: FontWeight.w400),
                                        SizedBox(
                                          width: w * 0.01,
                                        ),
                                        Image.asset('assets/about.png',
                                            color: color5, width: w * 0.015)
                                      ],
                                    ),
                                  ),


                                ],
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        text(
                          context,
                          'Offer time',
                          10,
                          color: color16,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          width: w * 0.01,
                        ),
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
                )),
          ],
        ),
      )),
    );
  }
}
