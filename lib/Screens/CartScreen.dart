import 'package:drugcalm/Screens/ApplyCoupon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/otherservices.dart';
import '../providers/ConnectivityProviders.dart';
import '../utils/CustomAppBar1.dart';
import '../utils/constants.dart';
import 'SaltComposition.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  int _counter = 0;
  bool _isChecked = false;

  @override
  void initState() {
    Provider.of<ConnectivityProviders>(context, listen: false)
        .initConnectivity();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<ConnectivityProviders>(context, listen: false).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    var connectiVityStatus = Provider.of<ConnectivityProviders>(context);
    return (connectiVityStatus.isDeviceConnected == "ConnectivityResult.wifi" ||
            connectiVityStatus.isDeviceConnected == "ConnectivityResult.mobile")
        ? Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            text(context, "Exclusive offers Designed for you.",
                                12,
                                fontWeight: FontWeight.w400, color: color4),
                          ],
                        )
                      ],
                    ),
                  ),
                  container(
                      w: w,
                      padding: EdgeInsets.only(top: 16, bottom: 16, right: 10),
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
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                width: w * 0.6,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            text(context,
                                                'Dolo 250 Oral Suspension', 14,
                                                fontWeight: FontWeight.w500,
                                                color: color11,
                                                textAlign: TextAlign.left,
                                                maxLines: 2),
                                            text(
                                                context,
                                                'Bottle of 60 ml Oral Suspension',
                                                12,
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
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                color: color, width: 1),
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
                                        container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2, horizontal: 4),
                                            colors: Color(0xffEDF2F5),
                                            borderRadius:
                                                BorderRadius.circular(4),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2,
                                                            horizontal: 4),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    border: Border.all(
                                                        color: color7,
                                                        width: 1),
                                                    context,
                                                    child: text(
                                                      context,
                                                      '5+1',
                                                      10,
                                                      color: color10,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ))
                                              ],
                                            )),
                                        Spacer(),
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
                                          border: Border.all(
                                              color: color5, width: 1),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 3),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: Row(
                                            children: [
                                              text(context, 'DCPO', 10,
                                                  color: color5,
                                                  fontWeight: FontWeight.w400),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              Image.asset('assets/about.png',
                                                  color: color5,
                                                  width: w * 0.015)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: w * 0.01,
                                        ),
                                        Row(
                                          children: [
                                            container(
                                              context,
                                              colors: color5,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6, vertical: 4),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              child: Row(
                                                children: [
                                                  text(
                                                      context, 'Spaciality', 10,
                                                      color: color4,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: w * 0.01,
                                        ),
                                        container(
                                          context,
                                          colors: color5.withOpacity(0.11),
                                          border: Border.all(
                                              color: color5, width: 1),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 3),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: Row(
                                            children: [
                                              text(context, 'COLD BOX', 10,
                                                  color: color5,
                                                  fontWeight: FontWeight.w400),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              Image.asset('assets/about.png',
                                                  color: color5,
                                                  width: w * 0.015)
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
                  InkResponse(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SaltComposition()));
                    },
                    child: container(
                        w: w,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        border: Border.all(color: color1, width: 1),
                        borderRadius: BorderRadius.circular(8),
                        context,
                        colors: color21,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(context, 'SALT Composition', 16,
                                    color: color1,
                                    fontWeight: FontWeight.w500,
                                    fontfamily: "Inter"),
                                SizedBox(
                                  height: h * 0.005,
                                ),
                                text(context, 'Paracetamol 650MG', 14,
                                    color: color11,
                                    fontWeight: FontWeight.w500,
                                    fontfamily: 'Inter'),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 16,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  text(context, 'PROMO CODE:', 13,
                      fontfamily: 'Inter', fontWeight: FontWeight.w400),
                  InkResponse(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ApplyCoupon()));
                    },
                    child: container(
                        w: w,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        border: Border.all(color: color22, width: 1),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        borderRadius: BorderRadius.circular(8),
                        context,
                        colors: color4,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/promocode.png',
                              fit: BoxFit.contain,
                              width: w * 0.04,
                            ),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            text(context, 'Apply Coupon', 16,
                                color: color18,
                                fontWeight: FontWeight.w400,
                                fontfamily: 'Inter'),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 16,
                            )
                          ],
                        )),
                  ),
                  text(context, 'Coupons Available for you', 16,
                      color: color11,
                      fontWeight: FontWeight.w500,
                      fontfamily: 'Inter'),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/vochar.png',
                          fit: BoxFit.contain,
                          height: h * 0.12,
                        ),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        Image.asset(
                          'assets/vochar (2).png',
                          fit: BoxFit.contain,
                          height: h * 0.12,
                        ),
                      ],
                    ),
                  ),
                  InkResponse(
                    onTap: () {
                      // Navigator.push(context,
                      // MaterialPageRoute(builder: (context) => SaltComposition()));
                    },
                    child: container(
                        w: w,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        border: Border.all(color: color22, width: 1),
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 16, bottom: 16),
                        borderRadius: BorderRadius.circular(8),
                        context,
                        colors: color4,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(context, 'Mediqex Membership', 18,
                                    color: color18,
                                    fontWeight: FontWeight.w400,
                                    fontfamily: 'Inter'),
                                SizedBox(
                                  width: w * 0.01,
                                ),
                                text(
                                    context,
                                    'Get flat 25% off from your Mediqex Wallet',
                                    12,
                                    color: color,
                                    fontWeight: FontWeight.w400,
                                    fontfamily: 'Inter'),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 18,
                            )
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                    child:
                    Row(
                      children: [

                        InkWell(
                            onTap: () {
                              setState(() {
                                _isChecked = !_isChecked;
                              });
                            },
                            child: Checkbox(
                                activeColor: color1,
                                side: BorderSide(
                                    color:
                                    color11.withOpacity(0.25)),
                                splashRadius: 30,
                                value: _isChecked,
                                onChanged: (bool? newvalue) {
                                  setState(() {
                                    _isChecked = !_isChecked;
                                  });
                                })),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        text(context, '₹1 Donate', 18,
                            color: color18,
                            fontWeight: FontWeight.w400,
                            fontfamily: 'Inter'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  container(context,
                      colors: color4,
                      borderRadius: BorderRadius.circular(8),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      w: w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(context, 'Payment Details', 13,
                              color: color23, fontWeight: FontWeight.w400),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Row(
                            children: [
                              text(context, 'Total Cost:', 12,
                                  color: color,
                                  fontWeight: FontWeight.w400,
                                  fontfamily: 'Inter'),
                              Spacer(),
                              text(context, '₹29', 15,
                                  fontWeight: FontWeight.w400, color: color18)
                            ],
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Row(
                            children: [
                              text(context, 'Shipping Fee', 12,
                                  color: color,
                                  fontWeight: FontWeight.w400,
                                  fontfamily: 'SFPD'),
                              Spacer(),
                              text(context, '₹02', 15,
                                  fontWeight: FontWeight.w400, color: color18)
                            ],
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Row(
                            children: [
                              text(context, 'Delivery Charges', 12,
                                  color: color,
                                  fontWeight: FontWeight.w400,
                                  fontfamily: 'Inter'),
                              Spacer(),
                              text(context, '+₹40', 15,
                                  fontWeight: FontWeight.w400, color: color18)
                            ],
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Row(
                            children: [
                              text(context, 'Handling Charges', 12,
                                  color: color,
                                  fontWeight: FontWeight.w400,
                                  fontfamily: 'Inter'),
                              Spacer(),
                              text(context, '+₹4', 15,
                                  fontWeight: FontWeight.w400, color: color18)
                            ],
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Row(
                            children: [
                              text(context, 'GST', 12,
                                  color: color,
                                  fontWeight: FontWeight.w400,
                                  fontfamily: 'Inter'),
                              Spacer(),
                              text(context, '₹12', 15,
                                  fontWeight: FontWeight.w400, color: color18)
                            ],
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Row(
                            children: [
                              text(context, 'Additional Discount', 12,
                                  color: color,
                                  fontWeight: FontWeight.w400,
                                  fontfamily: 'Inter'),
                              Spacer(),
                              text(context, '- ₹12', 15,
                                  fontWeight: FontWeight.w400, color: color6)
                            ],
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Divider(
                            height: 1,
                            color: color,
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Row(
                            children: [
                              text(context, 'Total Amount', 12,
                                  color: color11,
                                  fontWeight: FontWeight.w500,
                                  fontfamily: 'Inter'),
                              Spacer(),
                              text(context, '₹37', 15,
                                  fontWeight: FontWeight.w500, color: color11)
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    width: w,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            text(context, 'Similar Products Schemes', 16,
                                fontfamily: "Inter",
                                fontWeight: FontWeight.w500),
                            // Spacer(),
                            // text(context, 'SEE ALL', 16,
                            //     color: color1, fontWeight: FontWeight.w400),
                            // Icon(
                            //   Icons.arrow_forward_ios_outlined,
                            //   color: color1,
                            //   size: 18,
                            // )
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                4,
                                (index) {
                                  return Container(
                                    width: w * 0.6,
                                    padding: EdgeInsets.all(8),
                                    margin: EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: color1.withOpacity(0.2),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomizeProductBar()));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                child: Center(
                                              child: Image.asset(
                                                'assets/HCQS 200 Tablet.png',
                                                fit: BoxFit.contain,
                                              ),
                                            )),
                                            SizedBox(
                                              height: h * 0.01,
                                            ),
                                            text(
                                                context, 'HCQS 200 Tablet', 14),
                                            SizedBox(
                                              height: h * 0.02,
                                            ),
                                            text(context,
                                                '15.0 tablets in 1 strip', 10,
                                                fontWeight: FontWeight.w500,
                                                color: color1),
                                            SizedBox(
                                              height: h * 0.005,
                                            ),
                                            RatingWidget(
                                              initialRating: 4.0,
                                            ),
                                            SizedBox(
                                              height: h * 0.005,
                                            ),
                                            Row(
                                              children: [
                                                text(context, 'Net Price:', 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: color),
                                                SizedBox(
                                                  width: w * 0.01,
                                                ),
                                                text(context, '₹ 93.81', 14),
                                                SizedBox(
                                                  width: w * 0.02,
                                                ),
                                                text(context, 'MRP:', 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: color),
                                                SizedBox(
                                                  width: w * 0.01,
                                                ),
                                                text(context, '₹ 106.8', 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: color1),
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
                                                text(context, 'MARGIN', 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                SizedBox(
                                                  width: w * 0.01,
                                                ),
                                                text(context, '12%', 14,
                                                    color: color1),
                                                SizedBox(
                                                  width: w * 0.04,
                                                ),
                                                text(context, 'PTR', 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                Icon(
                                                  Icons.info,
                                                  color: color1,
                                                  size: 18,
                                                ),
                                                SizedBox(
                                                  width: w * 0.001,
                                                ),
                                                text(
                                                  context,
                                                  '₹ 106.8',
                                                  fontWeight: FontWeight.w700,
                                                  11,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: h * 0.02,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: containertext1(
                                                      context, 'ADD TO CART',
                                                      onTap: () {}),
                                                ),
                                                SizedBox(
                                                  width: w * 0.02,
                                                ),
                                                Container(
                                                  height: 40,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: color11,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Image.asset(
                                                    'assets/favoutline.png',
                                                    width: 20,
                                                    height: 18,
                                                    color: color2,
                                                    fit: BoxFit.contain,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    //   );
                                    // }
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                container(
                  w: w,
                  context,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  colors: color4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(context, 'In Stock', 12,
                                    color: color18,
                                    fontWeight: FontWeight.w400),
                                text(context, '990', 14,
                                    fontWeight: FontWeight.w500,
                                    color: color19),
                              ],
                            ),
                            Spacer(),
                            container(
                              w: w * 0.07,
                              h: h * 0.033,
                              colors: color4,
                              padding: EdgeInsets.all(0),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: color11.withOpacity(0.1), width: 1),
                              context,
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                icon: Icon(Icons.remove,
                                    size: 18, color: color11), // color11
                                onPressed: () {
                                  setState(() {
                                    if (_counter > 0) _counter--;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            container(
                                w: w * 0.07,
                                h: h * 0.033,
                                colors: color4,
                                padding: EdgeInsets.all(0),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: color11.withOpacity(0.1), width: 1),
                                context,
                                child: Center(
                                    child: text(context, '$_counter', 14))),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            container(
                              w: w * 0.07,
                              h: h * 0.033,
                              colors: color1,
                              borderRadius: BorderRadius.circular(4),
                              padding: EdgeInsets.all(0),
                              context,
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                icon: Icon(Icons.add,
                                    size: 18, color: color4), // color11
                                onPressed: () {
                                  setState(() {
                                    _counter++;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      container(
                          w: w,
                          context,
                          colors: color13,
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Center(
                              child: text(context,
                                  'Congratulations ! 5+1 scheme is applied', 10,
                                  color: color4))),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(
                                  context,
                                  'TO BE PAID',
                                  13,
                                  fontWeight: FontWeight.w400,
                                  color: color,
                                ),
                                text(
                                  context,
                                  '₹2,545',
                                  16,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/Coin.png',
                                      width: w * 0.045,
                                    ),
                                    SizedBox(
                                      width: w * 0.01,
                                    ),
                                    text(
                                      context,
                                      'Redeem 30Coins',
                                      12,
                                      fontWeight: FontWeight.w400,
                                      color: color11,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            _isChecked = !_isChecked;
                                          });
                                        },
                                        child: Checkbox(
                                            activeColor: color1,
                                            side: BorderSide(
                                                color:
                                                    color11.withOpacity(0.25)),
                                            splashRadius: 30,
                                            value: _isChecked,
                                            onChanged: (bool? newvalue) {
                                              setState(() {
                                                _isChecked = !_isChecked;
                                              });
                                            }))
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            container(context,
                                borderRadius: BorderRadius.circular(8),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                colors: color1,
                                child: Row(
                                  children: [
                                    text(context, 'CHECKOUT', 13,
                                        fontWeight: FontWeight.w400,
                                        color: color4),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: color4,
                                    )
                                  ],
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        : NoInternetWidget();
  }
}
