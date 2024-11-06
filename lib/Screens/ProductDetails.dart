
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/Drug Clam Background.png'),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  borderRadius: BorderRadius.circular(8),
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
                          text(context, '₹ 93.81', 18),
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
                          text(
                            context,
                            'IN',
                            11,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            width: w * 0.01,
                          ),
                          text(context, 'NUTRACITTA STORE', 11,
                              fontWeight: FontWeight.w400,
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            borderRadius: BorderRadius.circular(4),
                            colors: Color(0xffF1F1F1),
                            child: Row(
                              children: [
                                text(context, '7 DAYS RETURN', 10,
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
                                    horizontal: 6, vertical: 3),
                                borderRadius: BorderRadius.circular(4),
                                child: Row(
                                  children: [
                                    text(context, 'DCPO', 10,
                                        color: color5,
                                        fontWeight: FontWeight.w400),
                                    SizedBox(
                                      width: w * 0.02,
                                    ),
                                    Image.asset('assets/about.png',
                                        color: color5, width: w * 0.035)
                                  ],
                                ),
                              ),
                            ],
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
                                    text(context, 'ALLOPATHY', 10,
                                        color: color4,
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
                      container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                          colors: Color(0xffEDF2F5),
                          borderRadius: BorderRadius.circular(4),
                          context,
                          child: Row(
                            children: [
                              text(context, 'Scheme', 12,
                                  fontWeight: FontWeight.w400, color: color2),
                              SizedBox(
                                width: w * 0.01,
                              ),
                              container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 10),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: color7, width: 1),
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
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Row(
                        children: [
                          text(context, 'Free Delivery By', 14,
                              fontWeight: FontWeight.w400),
                          SizedBox(
                            width: w * 0.01,
                          ),
                          Icon(
                            Icons.access_time,
                            color: color6,
                            size: 18,
                          ),
                          SizedBox(
                            width: w * 0.01,
                          ),
                          text(context, 'Today, 2:45 pm', 14,
                              fontWeight: FontWeight.w400),
                          Spacer(),
                          Row(
                            children: [
                              container(
                                context,
                                border: Border.all(color: color5, width: 1),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4),
                                borderRadius: BorderRadius.circular(4),
                                child: text(context, 'Cold Box', 11,
                                    color: color5, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: container(
                                border: Border.all(color: color1, width: 2),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 4),
                                borderRadius: BorderRadius.circular(4),
                                context,
                                child: Column(
                                  children: [
                                    text(
                                        color: color,
                                        context,
                                        'Pack of 3 - 90 Gummies',
                                        13,
                                        fontWeight: FontWeight.w400),
                                    SizedBox(
                                      height: h * 0.01,
                                    ),
                                    text(context, '₹64', 13,
                                        fontWeight: FontWeight.w400),
                                  ],
                                )),
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          Expanded(
                            child: container(
                                border: Border.all(color: color7, width: 2),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 4),
                                borderRadius: BorderRadius.circular(4),
                                context,
                                child: Column(
                                  children: [
                                    text(
                                        color: color,
                                        context,
                                        'Pack of 3 - 90 Gummies',
                                        13,
                                        fontWeight: FontWeight.w400),
                                    SizedBox(
                                      height: h * 0.01,
                                    ),
                                    text(context, '₹64', 13,
                                        fontWeight: FontWeight.w400),
                                  ],
                                )),
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          Expanded(
                            child: container(
                                border: Border.all(color: color7, width: 2),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 4),
                                borderRadius: BorderRadius.circular(4),
                                context,
                                child: Column(
                                  children: [
                                    text(
                                        color: color,
                                        context,
                                        'Pack of 3 - 90 Gummies',
                                        13,
                                        fontWeight: FontWeight.w400),
                                    SizedBox(
                                      height: h * 0.01,
                                    ),
                                    text(context, '₹64', 13,
                                        fontWeight: FontWeight.w400),
                                  ],
                                )),
                          ),
                        ],
                      )
                    ],
                  )),
              container(context,
                  colors: color4,
                  w: w,
                  margin: EdgeInsets.only(left: 16, right: 16, top: 2),
                  padding: EdgeInsets.all(16),
                  borderRadius: BorderRadius.circular(8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(
                                    color: color8,
                                    context,
                                    'MRP',
                                    10,
                                    fontWeight: FontWeight.w400),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                text(
                                  context,
                                  '₹175',
                                  14,
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                container(
                                  context,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  borderRadius: BorderRadius.circular(4),
                                  colors: color6.withOpacity(0.1),
                                  child: Row(
                                    children: [
                                      text(
                                        context,
                                        'Margin',
                                        11,
                                        color: color6,
                                      ),
                                      SizedBox(
                                        width: w * 0.02,
                                      ),
                                      text(
                                        context,
                                        '18%',
                                        12,
                                        color: color6,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(
                                    color: color8,
                                    context,
                                    'NET PRICE',
                                    10,
                                    fontWeight: FontWeight.w400),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                text(
                                  context,
                                  '₹121.78',
                                  14,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Divider(
                          height: 1,
                          color: color9,
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          children: [
                            text(
                              context,
                              'PTR',
                              14,
                            ),
                            Spacer(),
                            text(
                              context,
                              '+₹175',
                              14,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        container(
                          context,
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          borderRadius: BorderRadius.circular(4),
                          colors: color6.withOpacity(0.1),
                          child: Row(
                            children: [
                              text(
                                context,
                                'Cash Discount(3.0%)',
                                11,
                                color: color6,
                              ),
                              Spacer(),
                              text(
                                context,
                                '-₹0.75%',
                                12,
                                color: color6,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          children: [
                            text(
                              context,
                              'Gst(12.0%)',
                              14,
                            ),
                            Spacer(),
                            text(
                              context,
                              '+₹2.78',
                              14,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          children: [
                            text(
                              context,
                              'Delivery Charges',
                              14,
                            ),
                            Spacer(),
                            text(
                              context,
                              '+₹40',
                              14,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          children: [
                            text(
                              context,
                              'Handling Charges',
                              14,
                            ),
                            Spacer(),
                            text(
                              context,
                              '+₹4',
                              14,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Divider(
                          height: 1,
                          color: color9,
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          children: [
                            text(
                              context,
                              'Net Price',
                              14,
                            ),
                            Spacer(),
                            text(
                              context,
                              '₹146.20',
                              14,
                            ),
                          ],
                        ),
                      ])),
              container(
                  w: w,
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.only(
                      left: w * 0.1, right: 16, top: 16, bottom: 16),
                  borderRadius: BorderRadius.circular(8),
                  context,
                  colors: color1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(context, 'SALT Composition', 16, color: color4),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      text(context, 'Paracetamol 650MG', 16, color: color4),
                    ],
                  )),
              container(
                  w: w,
                  margin: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                  borderRadius: BorderRadius.circular(8),
                  context,
                  colors: color4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          text(
                            context,
                            'All substitutes',
                            16,
                          ),
                          Spacer(),
                          text(context, 'See All', 13,
                              textdecoration: TextDecoration.underline,
                              color: color6,
                              fontWeight: FontWeight.w400,
                              decorationcolor: color6),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      text(
                          context,
                          'For informational purposes only. Consult a doctor before taking any medicines.',
                          13,
                          color: color,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Divider(
                        height: 1,
                        color: color9,
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text(
                                context,
                                'Fevago DS Suspension',
                                14,
                                color: color11,
                              ),
                              text(context, 'Cipla Ltd', 13,
                                  color: color,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.left),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              text(
                                context,
                                '₹45.02/oral sus',
                                14,
                                color: color11,
                                fontWeight: FontWeight.w400,
                              ),
                              text(context, '13% cheaper', 13,
                                  color: color,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.left),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Divider(
                        height: 1,
                        color: color9,
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text(
                                context,
                                'Dolopar 250 Suspension',
                                14,
                                color: color11,
                              ),
                              text(context, 'Micro Labs Ltd', 13,
                                  color: color,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.left),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              text(
                                context,
                                '₹45.02/oral sus',
                                14,
                                color: color11,
                                fontWeight: FontWeight.w400,
                              ),
                              text(context, '13% cheaper', 13,
                                  color: color,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.left),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Divider(
                        height: 1,
                        color: color9,
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text(
                                context,
                                'Pacimol DS Oral Suspension',
                                14,
                                color: color11,
                              ),
                              text(context, 'Ipca Laboratories Ltd', 13,
                                  color: color,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.left),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              text(
                                context,
                                '₹45.02/oral sus',
                                14,
                                color: color11,
                                fontWeight: FontWeight.w400,
                              ),
                              text(context, '13% cheaper', 13,
                                  color: color,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.left),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
              container(
                  w: w,
                  margin: EdgeInsets.all(16),
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                  borderRadius: BorderRadius.circular(8),
                  context,
                  colors: color4,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/Product_Return.png',
                            fit: BoxFit.contain,
                            width: w * 0.06,
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          text(context, 'Product Note', 13,
                              color: color,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.left),
                        ],
                      )
                    ],
                  )),
              container(
                  w: w,
                  margin: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                  borderRadius: BorderRadius.circular(8),
                  context,
                  colors: color4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/cod.png',
                            fit: BoxFit.contain,
                            width: w * 0.06,
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          text(context, 'Cash on Delivery', 13,
                              color: color,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.left),
                          SizedBox(
                            width: w * 0.01,
                          ),
                          text(
                            context,
                            'Availabale',
                            13,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/time.png',
                            fit: BoxFit.contain,
                            width: w * 0.06,
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          text(context, 'Expires on or After', 13,
                              color: color,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.left),
                          SizedBox(
                            width: w * 0.01,
                          ),
                          text(
                            context,
                            'Availabale',
                            13,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/Product_Return.png',
                            fit: BoxFit.contain,
                            width: w * 0.06,
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          text(context, 'Easy 7Days', 13,
                              color: color,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.left),
                          SizedBox(
                            width: w * 0.01,
                          ),
                          text(
                            context,
                            'Return Available',
                            13,
                          ),
                        ],
                      ),
                    ],
                  )),
              container(
                  w: w,
                  margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                  borderRadius: BorderRadius.circular(8),
                  context,
                  colors: color4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(context, 'Compare To Levipil 500mg VS LEVAZO SR', 18,
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      container(
                          w: w,
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 16, bottom: 16),
                          borderRadius: BorderRadius.circular(8),
                          colors: color12,
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
                                    fit: BoxFit.contain,
                                    width: w * 0.235,
                                  ),
                                  SizedBox(
                                    width: w * 0.04,
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
                                            Spacer(),
                                            Image.asset(
                                              'assets/favrate.png',
                                              fit: BoxFit.contain,
                                              width: w * 0.06,
                                            ),
                                            Spacer(),
                                            Image.asset(
                                              'assets/block.png',
                                              fit: BoxFit.contain,
                                              width: w * 0.06,
                                            ),
                                            Spacer(),
                                            Image.asset(
                                              'assets/youtube.png',
                                              fit: BoxFit.contain,
                                              width: w * 0.08,
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
                          )),
                      SizedBox(
                        height: h * 0.01,
                      ),


                      container(
                          padding: EdgeInsets.all(8),
                          borderRadius: BorderRadius.circular(100),
                          colors: color1,
                          context,
                          child: text(context, 'VS', 20,
                              fontWeight: FontWeight.w800, color: color4))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
