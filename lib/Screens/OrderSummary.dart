import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'CartScreen.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  int currentindex = 0;
  int _counter = 0;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar1(title: 'ORDER SUMMARY', actions: []),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                  Row(
                    children: [
                      text(
                        context,
                        'Delivery Address',
                        15,
                        fontWeight: FontWeight.w400,
                        fontfamily: 'Inter',
                        color: color18,
                      ),
                      Spacer(),
                      text(context, 'CHANGE', 13,
                          textdecoration: TextDecoration.underline,
                          color: color1,
                          fontWeight: FontWeight.w400,
                          decorationcolor: color1),
                    ],
                  ),
                  container(context,
                      padding: EdgeInsets.all(16),
                      colors: color4,
                      margin: EdgeInsets.symmetric(vertical: 16),
                      borderRadius: BorderRadius.circular(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(context, 'Prashanth Chary', 16,
                              color: color18, fontWeight: FontWeight.w400),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          text(
                            context,
                            '303, The Platina, A-Block, Jayabheri Enclave,Gachibowli, Hyderabad, Telangana 500032',
                            14,
                            fontWeight: FontWeight.w400,
                            color: color,
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          text(
                            context,
                            'Mobile No: (+91) 83171 39834',
                            14,
                            fontWeight: FontWeight.w400,
                            color: color,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )),
                  text(
                    context,
                    'YOUR ITEMS',
                    15,
                    fontWeight: FontWeight.w500,
                    fontfamily: 'Inter',
                    color: color18,
                  ),
                  container(context,
                      padding: EdgeInsets.all(16),
                      colors: color4,
                      margin: EdgeInsets.symmetric(vertical: 16),
                      borderRadius: BorderRadius.circular(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              text(context, 'Arrival By Fri, 23 Dec', 16,
                                  color: color18, fontWeight: FontWeight.w400),
                              Spacer(),
                              text(context, '₹25', 16,
                                  color: color6, fontWeight: FontWeight.w400),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          text(
                            context,
                            'Nutracitta Biotin Beauty Blend - Multivitamins Gummies- Vitamin A, B7, B12, C, E & Zinc',
                            14,
                            fontWeight: FontWeight.w400,
                            color: color,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )),
                  container(context,
                      colors: color4,
                      borderRadius: BorderRadius.circular(8),
                      margin: EdgeInsets.only(bottom: 16),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      w: w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(context, 'PAYMENT DETAILS', 13,
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
                              text(context, '₹470', 15,
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
                                  fontfamily: 'Inter'),
                              Spacer(),
                              text(context, '₹70', 15,
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
                              text(context, '- ₹20', 15,
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
                                  color: color6,
                                  fontWeight: FontWeight.w500,
                                  fontfamily: 'Inter'),
                              Spacer(),
                              text(context, '₹520', 15,
                                  fontWeight: FontWeight.w500, color: color6)
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  text(
                      context,
                      '*Price shown includes of all Applicable taxes, fees and subjects to Availability.',
                      13,
                      fontWeight: FontWeight.w400,
                      color: color2,
                      textAlign: TextAlign.left),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  text(
                      context,
                      '*Coupon Discount Value may change if the total Order Value Changes.',
                      13,
                      fontWeight: FontWeight.w400,
                      color: color2,
                      textAlign: TextAlign.left), SizedBox(
                    height: h * 0.01,
                  ),
                  text(
                      context,
                      '* Items in your Cart will always reflect the cast recent as compared to the Prices in their details page.',
                      13,
                      fontWeight: FontWeight.w400,
                      color: color2,
                      textAlign: TextAlign.left),
                ],
              ),
            ),
          ],
        ),
      ),
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
                              color: color18, fontWeight: FontWeight.w400),
                          text(context, '990', 14,
                              fontWeight: FontWeight.w500, color: color19),
                        ],
                      ),
                      Spacer(),
                      container(
                        w: w * 0.04,
                        h: h * 0.035,
                        colors: color4,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: color11.withOpacity(0.1), width: 1),
                        context,
                        child: IconButton(
                          icon: Icon(Icons.remove,
                              size: 14, color: color11), // color11
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
                          w: w * 0.04,
                          h: h * 0.035,
                          colors: color4,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: color11.withOpacity(0.1), width: 1),
                          context,
                          child: text(context, '$_counter', 16)),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      container(
                        w: w * 0.04,
                        h: h * 0.035,
                        colors: color1,
                        borderRadius: BorderRadius.circular(4),
                        context,
                        child: IconButton(
                          icon: Icon(Icons.add,
                              size: 14, color: color4), // color11
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
                                width: w * 0.03,
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
                              SizedBox(
                                width: w * 0.02,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _isChecked = !_isChecked;
                                  });
                                },
                                child: container(
                                  w: w * 0.03,
                                  h: h * 0.03,
                                  context,
                                  border: Border.all(color: color1, width: 2),
                                  borderRadius: BorderRadius.circular(4),
                                  child: _isChecked
                                      ? Icon(
                                          Icons.check,
                                          color: color1,
                                          size: 20,
                                        )
                                      : Container(),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      InkResponse(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cartscreen()));
                        },
                        child: container(context,
                            borderRadius: BorderRadius.circular(4),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            colors: color1,
                            child: Row(
                              children: [
                                text(context, 'CHECKOUT', 13,
                                    fontWeight: FontWeight.w400, color: color4),
                                Icon(
                                  Icons.arrow_forward,
                                  color: color4,
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
