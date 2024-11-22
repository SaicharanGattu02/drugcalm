import 'package:cached_network_image/cached_network_image.dart';
import 'package:drugcalm/Model/AddressListModel.dart';
import 'package:drugcalm/Screens/AddressList.dart';
import 'package:drugcalm/Services/UserApi.dart';
import 'package:drugcalm/providers/ShippingDetailsProvider.dart';
import 'package:drugcalm/utils/CustomSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/OrderDetailsModel.dart';
import '../Model/ShippingDetailsModel.dart';
import '../utils/CustomAppBar1.dart';
import '../utils/constants.dart';

class OrderDetailScreen extends StatefulWidget {
  String id;
  OrderDetailScreen({super.key, required this.id});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  int currentindex = 0;
  int _counter = 0;
  bool _isChecked = false;
  String address = "";
  bool isLoading = false;
  final spinkits =Spinkits1();

  @override
  void initState() {
    getOrderDetailsApi();
    super.initState();
  }

  OrderDetails? orderdata;

  Future<void> getOrderDetailsApi() async {
    try {
      var res = await Userapi.getOrderDetails(widget.id);
      if (res != null) {
        setState(() {
          if (res.settings?.success==1) {
            orderdata = res.data;

            print("orderdata>>${orderdata}");
          } else {
            print(
                "API response status is not successful:");
          }
          isLoading = false;
        });
      } else {
        print("API response is null");
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error fetching order details: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: CustomAppBar1(title: 'ORDER DETAILS', actions: [Container()]),
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
                        text(context, 'Order ID:', 16,
                            fontfamily: 'Inter',
                            color: color1,
                            fontWeight: FontWeight.w500),
                        text(context, ' ${orderdata?.orderId.toString()}', 16,
                            fontfamily: 'Inter',
                            color: color11,
                            fontWeight: FontWeight.w500,
                          ),
                        // Spacer(),
                        // text(context, '${orderdata?.orderId.toString()}', 16,
                        //     fontfamily: 'Inter',
                        //     color: color11,
                        //     overflow: TextOverflow.ellipsis,
                        //     fontWeight: FontWeight.w500),
                      ],
                    ),

                    SizedBox(height: h * 0.02),
                    // container(context,
                    //     padding: EdgeInsets.all(16),
                    //     colors: color4,
                    //     margin: EdgeInsets.symmetric(vertical: 16),
                    //     borderRadius: BorderRadius.circular(8),
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Row(
                    //           children: [
                    //             text(context, 'Arrival By Fri, 23 Dec', 16,
                    //                 color: color18,
                    //                 fontWeight: FontWeight.w400),
                    //             Spacer(),
                    //             text(context, '₹25', 16,
                    //                 color: color6, fontWeight: FontWeight.w400),
                    //           ],
                    //         ),
                    //         SizedBox(
                    //           height: h * 0.01,
                    //         ),
                    //         text(
                    //           context,
                    //           'Nutracitta Biotin Beauty Blend - Multivitamins Gummies- Vitamin A, B7, B12, C, E & Zinc',
                    //           14,
                    //           fontWeight: FontWeight.w400,
                    //           color: color,
                    //           textAlign: TextAlign.left,
                    //         ),
                    //       ],
                    //     )),

            ListView.builder(
              shrinkWrap: true,
              itemCount: orderdata?.items.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var cartdata = orderdata?.items[index];

                return
                  Container(
                    width: double
                        .infinity, // Use full width of the container
                    padding: EdgeInsets.only(
                        left: 8, right: 8, top: 16, bottom: 16),
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: color4, // Add your color
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: InkResponse(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         Productdetails(productid: product_detail.productData?.id??"",),
                              //   ),
                              // );
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/water_mark.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                cartdata?.product?.image ?? "",
                                fit: BoxFit.cover,
                                placeholder: (BuildContext context,
                                    String url) {
                                  return Center(
                                    child: spinkits
                                        .getSpinningLinespinkit(),
                                  );
                                },
                                errorWidget: (BuildContext context,
                                    String url, dynamic error) {
                                  return Icon(Icons.error);
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: w * 0.48,
                                          child: Text(
                                            cartdata?.product?.name ??
                                                "",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight:
                                              FontWeight.w500,
                                              color:
                                              Color(0xFF000000),
                                            ),
                                            textAlign: TextAlign.left,
                                            maxLines: 1,
                                          ),
                                        ),
                                        Text(
                                          cartdata?.product?.subName ??
                                              "",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight:
                                            FontWeight.w400,
                                            color: Color(0xFF000000),
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 4),
                                      decoration: BoxDecoration(
                                        color: Color(0xffEDF2F5),
                                        borderRadius:
                                        BorderRadius.circular(4),
                                        border: Border.all(
                                            color: Color(0xFF617C9D),
                                            width: 1),
                                      ),
                                      child: Text(
                                        cartdata?.product?.quantity
                                            .toString() ??
                                            "",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                RatingWidget(initialRating: 4),
                                // Ensure RatingWidget is defined
                                Row(
                                  children: [
                                    Text(
                                      'Net Price:',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(width: w * 0.01),
                                    Text(
                                      cartdata?.product?.netPrice
                                          .toString() ??
                                          "",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Spacer(),
                                    Text(
                                      'M.R.P:',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      cartdata?.product?.mrp
                                          .toString() ??
                                          "",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: h * 0.008),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Container(
                                    //   padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                                    //   decoration: BoxDecoration(
                                    //     color: Color(0xffEDF2F5),
                                    //     borderRadius: BorderRadius.circular(4),
                                    //     border: Border.all(color: Color(0xFF000000), width: 1),
                                    //   ),
                                    //   child: Row(
                                    //     children: [
                                    //       Text(
                                    //         'Scheme',
                                    //         style: TextStyle(
                                    //           fontSize: 12,
                                    //           fontWeight: FontWeight.w400,
                                    //           color: Color(0xFF000000),
                                    //         ),
                                    //       ),
                                    //       SizedBox(width: w * 0.01),
                                    //       Container(
                                    //         padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                                    //         decoration: BoxDecoration(
                                    //           borderRadius: BorderRadius.circular(4),
                                    //           border: Border.all(color: Color(0xFF000000), width: 1),
                                    //         ),
                                    //         child: Text(
                                    //           product['scheme'] ?? '',
                                    //           style: TextStyle(
                                    //             fontSize: 10,
                                    //             color: Color(0xFF000000),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFEF6F5),
                                        borderRadius:
                                        BorderRadius.circular(4),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'MARGIN',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight:
                                              FontWeight.w400,
                                              color:
                                              Color(0xFF000000),
                                            ),
                                          ),
                                          SizedBox(width: w * 0.01),
                                          Text(
                                            cartdata?.product?.margin
                                                .toString() ??
                                                "",
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight:
                                              FontWeight.w400,
                                              color:
                                              Color(0xFF000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'PTR',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight:
                                            FontWeight.w400,
                                            color: Color(0xFF000000),
                                          ),
                                        ),
                                        SizedBox(width: w * 0.007),
                                        Image.asset(
                                          'assets/about.png',
                                          color: Color(0xFF000000),
                                          width: w * 0.016,
                                        ),
                                        SizedBox(width: w * 0.007),
                                        Text(
                                          cartdata?.product?.ptr
                                              .toString() ??
                                              "",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight:
                                            FontWeight.w400,
                                            color: Color(0xFF000000),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: h * 0.01),
                                // Row(
                                //   children: [
                                //     Container(
                                //       padding: EdgeInsets.symmetric(
                                //           horizontal: 6, vertical: 3),
                                //       decoration: BoxDecoration(
                                //         border: Border.all(
                                //             color: Color(0xFF000000),
                                //             width: 1),
                                //         borderRadius:
                                //         BorderRadius.circular(4),
                                //       ),
                                //       child: Row(
                                //         children: [
                                //           Text(
                                //             product['dcpo'] ?? '',
                                //             style: TextStyle(
                                //               fontSize: 10,
                                //               fontWeight:
                                //               FontWeight.w400,
                                //               color: Color(
                                //                   0xFF000000),
                                //             ),
                                //           ),
                                //           SizedBox(width: w * 0.01),
                                //           Image.asset(
                                //             'assets/about.png',
                                //             color: Color(0xFF000000),
                                //             width: w * 0.015,
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     SizedBox(width: w * 0.01),
                                //     Row(
                                //       children: [
                                //         Container(
                                //           padding: EdgeInsets
                                //               .symmetric(
                                //               horizontal: 6,
                                //               vertical: 4),
                                //           decoration: BoxDecoration(
                                //             color: Color(0xFF000000),
                                //             borderRadius:
                                //             BorderRadius.circular(
                                //                 4),
                                //           ),
                                //           child: Row(
                                //             children: [
                                //               Text(
                                //                 product['speciality'] ??
                                //                     '',
                                //                 style: TextStyle(
                                //                   fontSize: 10,
                                //                   fontWeight:
                                //                   FontWeight.w400,
                                //                   color:
                                //                   Color(0xFF000000),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //     SizedBox(width: w * 0.01),
                                //     Container(
                                //       padding: EdgeInsets.symmetric(
                                //           horizontal: 6, vertical: 3),
                                //       decoration: BoxDecoration(
                                //         color: Color(0xFF000000)
                                //             .withOpacity(0.11),
                                //         border: Border.all(
                                //             color: Color(0xFF000000),
                                //             width: 1),
                                //         borderRadius:
                                //         BorderRadius.circular(4),
                                //       ),
                                //       child: Row(
                                //         children: [
                                //           Text(
                                //             product['coldBox'] ?? '',
                                //             style: TextStyle(
                                //               fontSize: 10,
                                //               fontWeight:
                                //               FontWeight.w400,
                                //               color: Color(
                                //                   0xFF000000),
                                //             ),
                                //           ),
                                //           SizedBox(width: w * 0.01),
                                //           Image.asset(
                                //             'assets/about.png',
                                //             color: Color(0xFF000000),
                                //             width: w * 0.015,
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
              },

            )
                  ,
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xffFFFfff),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person_outline_rounded,
                                  color: color1, size: 18),
                              SizedBox(width: w * 0.02),
                              Text(
                                orderdata?.address.fullName??"",

                                style: TextStyle(
                                  color: Color(0xff110B0F),
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                  height: 28 / 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: w * 0.04),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Color(0xffE8EFFB),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  orderdata?.address.addressType??"",
                                  style: TextStyle(
                                    color: Color(0xff110B0F),
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    height: 18 / 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: h * 0.01),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on_rounded,
                                  color: color1, size: 18),
                              SizedBox(width: w * 0.02),
                              Flexible(
                                child: Text(
                                  "Address\n ${orderdata?.address.address??""}",
                                  style: TextStyle(
                                    color: Color(0xff110B0F),
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    height: 21 / 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                                text(context, 'Total Cost', 12,
                                    color: color,
                                    fontWeight: FontWeight.w400,
                                    fontfamily: 'Inter'),
                                Spacer(),
                                text(
                                    context,
                                   "${orderdata?.orderValue??""}",
                                    15,
                                    fontWeight: FontWeight.w400,
                                    color: color18)
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
                                text(
                                    context,
                                    "${orderdata?.shipping.shippingFee.toString()??""}",
                                    15,
                                    fontWeight: FontWeight.w400,
                                    color: color18)
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
                                text(
                                    context,
                                    "${orderdata?.shipping.deliveryCharges.toString()??""}",
                                    15,
                                    fontWeight: FontWeight.w400,
                                    color: color18)
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
                                text(
                                    context,
                                    "${orderdata?.shipping.handlingCharges.toString()??""}",
                                    15,
                                    fontWeight: FontWeight.w400,
                                    color: color18)
                              ],
                            ),
                            // SizedBox(
                            //   height: h * 0.01,
                            // ),
                            // Row(
                            //   children: [
                            //     text(context, 'GST', 12,
                            //         color: color,
                            //         fontWeight: FontWeight.w400,
                            //         fontfamily: 'Inter'),
                            //     Spacer(),
                            //     text(context, '₹12', 15,
                            //         fontWeight: FontWeight.w400,
                            //         color: color18)
                            //   ],
                            // ),
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
                                text(
                                    context,
                                    "${orderdata?.shipping.discount.toString()??""}",
                                    15,
                                    fontWeight: FontWeight.w400,
                                    color: color6)
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
                                text(
                                    context,
                                    "${orderdata?.shipping.totalAmount.toString()??""}",
                                    15,
                                    fontWeight: FontWeight.w500,
                                    color: color11)
                              ],
                            ),
                          ],
                        )),
                    // SizedBox(
                    //   height: h * 0.01,
                    // ),
                    // text(
                    //     context,
                    //     '*Price shown includes of all Applicable taxes, fees and subjects to Availability.',
                    //     13,
                    //     fontWeight: FontWeight.w400,
                    //     color: color2,
                    //     textAlign: TextAlign.left),
                    // SizedBox(
                    //   height: h * 0.01,
                    // ),
                    // text(
                    //     context,
                    //     '*Coupon Discount Value may change if the total Order Value Changes.',
                    //     13,
                    //     fontWeight: FontWeight.w400,
                    //     color: color2,
                    //     textAlign: TextAlign.left),
                    // SizedBox(
                    //   height: h * 0.01,
                    // ),
                    // text(
                    //     context,
                    //     '* Items in your Cart will always reflect the cast recent as compared to the Prices in their details page.',
                    //     13,
                    //     fontWeight: FontWeight.w400,
                    //     color: color2,
                    //     textAlign: TextAlign.left),
        ]
                ),
              ),
            ],
          ),
        ));
  }
}
