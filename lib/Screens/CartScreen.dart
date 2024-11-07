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
    var h= MediaQuery.of(context).size.height;
    var w= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar1(
        title: 'CART' ,
        actions: [Container()],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: w,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Drug Clam Background.png',),
                fit: BoxFit.cover
              )),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.all(Radius.circular(10)),
                  color: color1
                ),
                child: Row(
                  children: [
                    Image.asset("assets/join_membership.png",
                      width: 35,height: 39,
                    ),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text( context,
                          "Join Membership to Save More.!",16,fontWeight: FontWeight.w400,color: color4
                        ),
                        text(context,
                          "Exclusive offers Designed for you.",13,fontWeight: FontWeight.w400,color: color4
                        ),

                      ],
                    )
                  ],
                ),
              ),

              container(
                  w: w,
                  padding: EdgeInsets.only(
                      left: 16, right: 16 , top: 16, bottom: 16),
                  margin: EdgeInsets.only(top: 15,bottom: 15),
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
                          Image.asset(
                            'assets/dolo250 Oral.png.png',
                            fit: BoxFit.cover,
                            width:55,
                            height:55,
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          Container(
                            width: w * 0.5,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                container(context,
                                    borderRadius:
                                    BorderRadius.circular(100),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 2),
                                    colors: color13,
                                    child: text(
                                        context, 'Best Seller', 6,
                                        fontWeight: FontWeight.w500,
                                        color: color4)),
                                text(context,
                                    'Dolo 250 Oral Suspension', 14,
                                    fontWeight: FontWeight.w500,
                                    color: color11,
                                    textAlign: TextAlign.left,
                                    maxLines: 2),
                                text(context, '60.0 ml in 1 bottle', 12,
                                    color: color,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.left),
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
                                    text(context, '₹106.8', 12,
                                        color: color1),
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
                                            SizedBox(
                                              width: w * 0.01,
                                            ),
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
                                    SizedBox(
                                      width: w * 0.01,
                                    ),
                                    Image.asset('assets/about.png',
                                        color: color1, width: w * 0.03),
                                    SizedBox(
                                      width: w * 0.01,
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4),
                                        w: w * 0.2,
                                        borderRadius:
                                        BorderRadius.circular(4),
                                        colors: color1,
                                        context,
                                        child: Center(
                                            child: text(
                                                context, 'Add', 12,
                                                color: color4,
                                                fontWeight:
                                                FontWeight.w400))),
                                    Image.asset(
                                      'assets/favrate.png',
                                      fit: BoxFit.contain,
                                      width: 19,
                                      height: 19,
                                    ),
                                    Spacer(),
                                    Image.asset(
                                      'assets/block.png',
                                      fit: BoxFit.contain,
                                      width: 19,
                                      height: 19,
                                    ),
                                    Spacer(),
                                    Image.asset(
                                      'assets/youtube.png',
                                      fit: BoxFit.contain,
                                      width: 19,
                                      height: 19,
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
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            container(
                              context,
                              colors: color15.withOpacity(0.2),
                              border:
                              Border.all(color: color15, width: 1),
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
                              border:
                              Border.all(color: color15, width: 1),
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
                              border:
                              Border.all(color: color15, width: 1),
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
                              border:
                              Border.all(color: color15, width: 1),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 3),
                              borderRadius: BorderRadius.circular(100),
                              child: text(
                                  context, 'OT CONSUMASABLE', 10,
                                  color: color,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            container(
                              context,
                              colors: color15.withOpacity(0.2),
                              border:
                              Border.all(color: color15, width: 1),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 3),
                              borderRadius: BorderRadius.circular(100),
                              child: text(
                                  context, 'LAB CONSUMASABLE', 10,
                                  color: color,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            container(
                              context,
                              colors: color4,
                              border:
                              Border.all(color: color15, width: 1),
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
                              border:
                              Border.all(color: color15, width: 1),
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
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                  )
              ),
            ],
          ),
        )
      ),
    );
  }
}
