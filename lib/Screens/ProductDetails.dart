import 'package:cached_network_image/cached_network_image.dart';
import 'package:drugcalm/Screens/CartScreen.dart';
import 'package:drugcalm/providers/CartProvider.dart';
import 'package:drugcalm/utils/CustomSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:provider/provider.dart';
import '../Services/UserApi.dart';
import '../Services/otherservices.dart';
import '../providers/BlockedProvider.dart';
import '../providers/ConnectivityProviders.dart';
import '../providers/ProductDetailsProvider.dart';
import '../providers/WishlistProvider.dart';
import '../utils/CustomAppBar1.dart';
import '../utils/constants.dart';
import 'SaltComposition.dart';

class Productdetails extends StatefulWidget {
  String productid;
  Productdetails({super.key, required this.productid});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  int _counter = 0;
  bool _isChecked = false;

  @override
  void initState() {
    GetProductDetails();
    Provider.of<ConnectivityProviders>(context, listen: false)
        .initConnectivity();

    super.initState();
  }

  Future<void> GetProductDetails() async {
    final product_detail_provider =
        Provider.of<ProductDetailsProvider>(context, listen: false);

    product_detail_provider.fetchProductDetails(widget.productid);
  }

  final spinkits = Spinkits1();
  @override
  void dispose() {
    Provider.of<ConnectivityProviders>(context, listen: false).dispose();
    super.dispose();
  }

  Future<void> AddToCartApi(String productid, String quantity) async {
    final cart_provider = Provider.of<CartProvider>(context, listen: false);
    var res = await cart_provider.addToCartApi(productid, quantity);

    if (res != "" || res != null) {
      CustomSnackBar.show(context,res.toString() );
    }
  }




  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var connectiVityStatus = Provider.of<ConnectivityProviders>(context);
    return (connectiVityStatus.isDeviceConnected == "ConnectivityResult.wifi" ||
            connectiVityStatus.isDeviceConnected == "ConnectivityResult.mobile")
        ? Scaffold(
            appBar:
                CustomAppBar1(title: 'PRODUCT DETAIL', actions: [Container()]),
            body: Consumer<ProductDetailsProvider>(
                builder: (context, product_details, child) {
              final wishlist_status = product_details.isInWishlist;
              final blocklist_status = product_details.isInBlocklist;
              return SingleChildScrollView(
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
                          padding: EdgeInsets.all(6),
                          height: h * 0.3,
                          decoration: BoxDecoration(
                            color: color4,
                          ),
                          child: Center(
                            child: CachedNetworkImage(
                              imageUrl:
                                  product_details.productData?.image ?? "",
                              fit: BoxFit.cover,
                              placeholder: (BuildContext context, String url) {
                                return Center(
                                  child: spinkits.getSpinningLinespinkit(),
                                );
                              },
                              errorWidget: (BuildContext context, String url,
                                  dynamic error) {
                                // Handle error in case the image fails to load
                                return Icon(Icons.error);
                              },
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: h * 0.03,
                            left: w * 0.32,
                            child: Image.asset(
                              'assets/prouduct labl.png',
                              fit: BoxFit.contain,
                              color: color4,
                              width: w * 0.35,
                              height: h * 0.2,
                            )),
                        // Positioned(
                        //     right: h * 0.02,
                        //     top: h * 0.01,
                        //     child: Image.asset(
                        //       'assets/share.png',
                        //       fit: BoxFit.contain,
                        //       width: w * 0.08,
                        //       height: h * 0.08,
                        //     )),
                        Positioned(
                          right: h * 0.02,
                          top: h * 0.06,

                          child: InkResponse(
                            onTap: () {
                              if (wishlist_status ?? false) {
                                print("wishlist Status:${wishlist_status}");

                                context
                                    .read<WishlistProvider>()
                                    .removeFromWishlist(widget.productid);

                                product_details.toggleWishlistStatus();
                              } else {
                                print("wishlist Status:${wishlist_status}");
                                // Add to wishlist
                                context
                                    .read<WishlistProvider>()
                                    .addToWishlist(widget.productid);

                                product_details.toggleWishlistStatus();
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: wishlist_status == true
                                  ? Icon(
                                      Icons
                                          .favorite,
                                      size: 18,
                                      color: Colors
                                          .red, // Red c
                                    )
                                  : Icon(
                                      Icons
                                          .favorite_border, // Outline heart icon when item is NOT in wishlist
                                      size: 18,
                                      color: Colors
                                          .black, // Black color for outline icon
                                    ),
                            ),
                          ),



                          // child: Image.asset(
                          //   'assets/favrate.png',
                          //   color: Colors.red,
                          //   fit: BoxFit.contain,
                          //   width: w * 0.08,
                          //   height: h * 0.08,
                          // )),
                          // Positioned(
                          //     right: h * 0.02,
                          //     top: h * 0.11,
                          //     child: Image.asset(
                          //       'assets/block.png',
                          //       fit: BoxFit.contain,
                          //       width: w * 0.08,
                          //       height: h * 0.08,
                          //     ))
                        ),

                        Positioned(
                            right: h * 0.02,
                            top: h * 0.13,
                          child: InkResponse(
                            onTap: () {
                              if(product_details.productData?.isBlocked ?? false){
                                context.read<BlockListProvider>().removeBlockList(product_details.productData?.id??"");

                              }else{
                                context.read<BlockListProvider>().AddBlockList(product_details.productData?.id??"");
                              }



                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(100),
                              ),

                              child:
                              blocklist_status == true
                                  ? Icon(
                                Icons
                                    .block,
                                size: 18,
                                color: Colors
                                    .red,
                              )
                                  : Icon(
                                Icons
                                    .block,
                                size: 18,
                                color: Colors
                                    .black, // Black color for outline icon
                              ),
                            ),
                          ),
                        )
                      ]),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     for (int i = 0; i <= 4; i++)
                      //       Container(
                      //         margin: EdgeInsets.all(5),
                      //         height: h * 0.01,
                      //         width: w * 0.02,
                      //         decoration: BoxDecoration(
                      //             // color: currentindex == i ? color1 : color2,
                      //             color: color1,
                      //             borderRadius: BorderRadius.circular(100)),
                      //       ),
                      //   ],
                      // ),
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
                                product_details.productData?.name ?? "",
                                18,
                              ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              text(
                                  context,
                                  product_details
                                          .productData?.manufactureCompany ??
                                      "",
                                  14,
                                  color: color2,
                                  fontWeight: FontWeight.w400),
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
                                  text(
                                      context,
                                      '₹ ${product_details.productData?.netPrice ?? ""}',
                                      18),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  text(context, 'MRP:', 12, color: color),
                                  SizedBox(
                                    width: w * 0.01,
                                  ),
                                  text(
                                      context,
                                      '₹ ${product_details.productData?.mrp ?? ""}',
                                      14,
                                      color: color1),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              if (product_details.productData?.bestSeller ==
                                  true) ...[
                                Row(
                                  children: [
                                    container(context,
                                        borderRadius: BorderRadius.circular(4),
                                        padding: EdgeInsets.all(6),
                                        colors: Color(0xffFFE5B4),
                                        child: text(context, 'BEST SELLER', 11,
                                            fontWeight: FontWeight.w400)),
                                    // SizedBox(
                                    //   width: w * 0.02,
                                    // ),
                                    // text(
                                    //   context,
                                    //   'IN',
                                    //   11,
                                    //   fontWeight: FontWeight.w400,
                                    // ),
                                    // SizedBox(
                                    //   width: w * 0.01,
                                    // ),
                                    // text(context, 'NUTRACITTA STORE', 11,
                                    //     fontWeight: FontWeight.w400,
                                    //     textdecoration:
                                    //         TextDecoration.underline,
                                    //     decorationcolor: color)
                                  ],
                                ),
                              ],
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
                                  // Spacer(),
                                  // Row(
                                  //   children: [
                                  //     container(
                                  //       context,
                                  //       border:
                                  //           Border.all(color: color5, width: 1),
                                  //       padding: EdgeInsets.symmetric(
                                  //           horizontal: 6, vertical: 3),
                                  //       borderRadius: BorderRadius.circular(4),
                                  //       child: Row(
                                  //         children: [
                                  //           text(context, 'DCPO', 10,
                                  //               color: color5,
                                  //               fontWeight: FontWeight.w400),
                                  //           SizedBox(
                                  //             width: w * 0.02,
                                  //           ),
                                  //           Image.asset('assets/about.png',
                                  //               color: color5, width: w * 0.035)
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   width: w * 0.02,
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     container(
                                  //       context,
                                  //       colors: color5,
                                  //       padding: EdgeInsets.symmetric(
                                  //           horizontal: 6, vertical: 4),
                                  //       borderRadius: BorderRadius.circular(4),
                                  //       child: Row(
                                  //         children: [
                                  //           text(context, 'ALLOPATHY', 10,
                                  //               color: color4,
                                  //               fontWeight: FontWeight.w400),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                              // SizedBox(
                              //   height: h * 0.01,
                              // ),
                              // container(
                              //     padding: EdgeInsets.symmetric(
                              //         vertical: 4, horizontal: 10),
                              //     colors: Color(0xffEDF2F5),
                              //     borderRadius: BorderRadius.circular(4),
                              //     context,
                              //     child: Row(
                              //       children: [
                              //         text(context, 'Scheme', 12,
                              //             fontWeight: FontWeight.w400,
                              //             color: color2),
                              //         SizedBox(
                              //           width: w * 0.01,
                              //         ),
                              //         container(
                              //             padding: EdgeInsets.symmetric(
                              //                 vertical: 2, horizontal: 10),
                              //             borderRadius:
                              //                 BorderRadius.circular(4),
                              //             border: Border.all(
                              //                 color: color7, width: 1),
                              //             context,
                              //             child: text(
                              //               context,
                              //               '5+1',
                              //               10,
                              //               color: color10,
                              //               fontWeight: FontWeight.w400,
                              //             ))
                              //       ],
                              //     )),
                              // SizedBox(
                              //   height: h * 0.01,
                              // ),
                              // Row(
                              //   children: [
                              //     text(context, 'Free Delivery By', 12,
                              //         fontWeight: FontWeight.w400),
                              //     SizedBox(
                              //       width: w * 0.01,
                              //     ),
                              //     Icon(
                              //       Icons.access_time,
                              //       color: color6,
                              //       size: 18,
                              //     ),
                              //     SizedBox(
                              //       width: w * 0.01,
                              //     ),
                              //     text(context, 'Today, 2:45 pm', 12,
                              //         fontWeight: FontWeight.w400),
                              //     Spacer(),
                              //     Row(
                              //       children: [
                              //         container(
                              //           context,
                              //           border:
                              //               Border.all(color: color5, width: 1),
                              //           padding: EdgeInsets.symmetric(
                              //               horizontal: 6, vertical: 4),
                              //           borderRadius: BorderRadius.circular(4),
                              //           child: text(context, 'Cold Box', 11,
                              //               color: color5,
                              //               fontWeight: FontWeight.w400),
                              //         ),
                              //       ],
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: h * 0.02,
                              // ),
                              // Row(
                              //   children: [
                              //     Expanded(
                              //       child: container(
                              //           border:
                              //               Border.all(color: color1, width: 2),
                              //           padding: EdgeInsets.symmetric(
                              //               horizontal: 4, vertical: 4),
                              //           borderRadius: BorderRadius.circular(4),
                              //           context,
                              //           child: Column(
                              //             children: [
                              //               text(
                              //                   color: color,
                              //                   context,
                              //                   'Pack of 3 - 90 Gummies',
                              //                   13,
                              //                   fontWeight: FontWeight.w400),
                              //               SizedBox(
                              //                 height: h * 0.01,
                              //               ),
                              //               text(context, '₹64', 13,
                              //                   fontWeight: FontWeight.w400),
                              //             ],
                              //           )),
                              //     ),
                              //     SizedBox(
                              //       width: w * 0.02,
                              //     ),
                              //     Expanded(
                              //       child: container(
                              //           border:
                              //               Border.all(color: color7, width: 2),
                              //           padding: EdgeInsets.symmetric(
                              //               horizontal: 4, vertical: 4),
                              //           borderRadius: BorderRadius.circular(4),
                              //           context,
                              //           child: Column(
                              //             children: [
                              //               text(
                              //                   color: color,
                              //                   context,
                              //                   'Pack of 3 - 90 Gummies',
                              //                   13,
                              //                   fontWeight: FontWeight.w400),
                              //               SizedBox(
                              //                 height: h * 0.01,
                              //               ),
                              //               text(context, '₹64', 13,
                              //                   fontWeight: FontWeight.w400),
                              //             ],
                              //           )),
                              //     ),
                              //     SizedBox(
                              //       width: w * 0.02,
                              //     ),
                              //     Expanded(
                              //       child: container(
                              //           border:
                              //               Border.all(color: color7, width: 2),
                              //           padding: EdgeInsets.symmetric(
                              //               horizontal: 4, vertical: 4),
                              //           borderRadius: BorderRadius.circular(4),
                              //           context,
                              //           child: Column(
                              //             children: [
                              //               text(
                              //                   color: color,
                              //                   context,
                              //                   'Pack of 3 - 90 Gummies',
                              //                   13,
                              //                   fontWeight: FontWeight.w400),
                              //               SizedBox(
                              //                 height: h * 0.01,
                              //               ),
                              //               text(context, '₹64', 13,
                              //                   fontWeight: FontWeight.w400),
                              //             ],
                              //           )),
                              //     ),
                              //   ],
                              // )
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          '₹ ${product_details.productData?.mrp ?? ""}',
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
                                          borderRadius:
                                              BorderRadius.circular(4),
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
                                                '${product_details.productData?.margin ?? ""}%',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          '₹ ${product_details.productData?.netPrice ?? ""}',
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
                                      '+₹ ${product_details.productData?.ptr ?? ""}',
                                      14,
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: h * 0.01,
                                // ),
                                // container(
                                //   context,
                                //   padding: EdgeInsets.symmetric(
                                //       horizontal: 8, vertical: 8),
                                //   borderRadius: BorderRadius.circular(4),
                                //   colors: color6.withOpacity(0.1),
                                //   child: Row(
                                //     children: [
                                //       text(
                                //         context,
                                //         'Cash Discount(3.0%)',
                                //         11,
                                //         color: color6,
                                //       ),
                                //       Spacer(),
                                //       text(
                                //         context,
                                //         '-₹0.75%',
                                //         12,
                                //         color: color6,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: h * 0.01,
                                // ),
                                // Row(
                                //   children: [
                                //     text(
                                //       context,
                                //       'Gst(12.0%)',
                                //       14,
                                //     ),
                                //     Spacer(),
                                //     text(
                                //       context,
                                //       '+₹2.78',
                                //       14,
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: h * 0.01,
                                // ),
                                // Row(
                                //   children: [
                                //     text(
                                //       context,
                                //       'Delivery Charges',
                                //       14,
                                //     ),
                                //     Spacer(),
                                //     text(
                                //       context,
                                //       '+₹40',
                                //       14,
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: h * 0.01,
                                // ),
                                // Row(
                                //   children: [
                                //     text(
                                //       context,
                                //       'Handling Charges',
                                //       14,
                                //     ),
                                //     Spacer(),
                                //     text(
                                //       context,
                                //       '+₹4',
                                //       14,
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: h * 0.01,
                                // ),
                                // Divider(
                                //   height: 1,
                                //   color: color9,
                                // ),
                                // SizedBox(
                                //   height: h * 0.01,
                                // ),
                                // Row(
                                //   children: [
                                //     text(
                                //       context,
                                //       'Net Price',
                                //       14,
                                //     ),
                                //     Spacer(),
                                //     text(
                                //       context,
                                //       '₹146.20',
                                //       14,
                                //     ),
                                //   ],
                                // ),
                              ])),
                      InkResponse(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SaltComposition()));
                        },
                        child: container(
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
                                text(context, 'SALT Composition', 16,
                                    color: color4),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                text(context, 'Paracetamol 650MG', 16,
                                    color: color4),
                              ],
                            )),
                      ),
                      // container(
                      //     w: w,
                      //     margin: EdgeInsets.only(
                      //       left: 16,
                      //       right: 16,
                      //     ),
                      //     padding: EdgeInsets.only(
                      //         left: 16, right: 16, top: 16, bottom: 16),
                      //     borderRadius: BorderRadius.circular(8),
                      //     context,
                      //     colors: color4,
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Row(
                      //           children: [
                      //             text(
                      //               context,
                      //               'All substitutes',
                      //               16,
                      //             ),
                      //             Spacer(),
                      //             text(context, 'See All', 13,
                      //                 textdecoration: TextDecoration.underline,
                      //                 color: color6,
                      //                 fontWeight: FontWeight.w400,
                      //                 decorationcolor: color6),
                      //           ],
                      //         ),
                      //         SizedBox(
                      //           height: h * 0.01,
                      //         ),
                      //         text(
                      //             context,
                      //             'For informational purposes only. Consult a doctor before taking any medicines.',
                      //             13,
                      //             color: color,
                      //             fontWeight: FontWeight.w400,
                      //             textAlign: TextAlign.left),
                      //         SizedBox(
                      //           height: h * 0.01,
                      //         ),
                      //         Divider(
                      //           height: 1,
                      //           color: color9,
                      //         ),
                      //         SizedBox(
                      //           height: h * 0.01,
                      //         ),
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Column(
                      //               mainAxisAlignment: MainAxisAlignment.start,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 container(
                      //                   context,
                      //                   w: w * 0.5,
                      //                   padding: EdgeInsets.all(0),
                      //                   child: text(
                      //                     context,
                      //                     'Fevago DS Suspension',
                      //                     textAlign: TextAlign.start,
                      //                     14,
                      //                     color: color11,
                      //                   ),
                      //                 ),
                      //                 text(context, 'Cipla Ltd', 13,
                      //                     color: color,
                      //                     fontWeight: FontWeight.w400,
                      //                     textAlign: TextAlign.left),
                      //               ],
                      //             ),
                      //             Spacer(),
                      //             Column(
                      //               children: [
                      //                 text(
                      //                   context,
                      //                   '₹45.02/oral sus',
                      //                   14,
                      //                   color: color11,
                      //                   fontWeight: FontWeight.w400,
                      //                 ),
                      //                 text(context, '13% cheaper', 13,
                      //                     color: color,
                      //                     fontWeight: FontWeight.w400,
                      //                     textAlign: TextAlign.left),
                      //               ],
                      //             ),
                      //           ],
                      //         ),
                      //         SizedBox(
                      //           height: h * 0.01,
                      //         ),
                      //         Divider(
                      //           height: 1,
                      //           color: color9,
                      //         ),
                      //         SizedBox(
                      //           height: h * 0.01,
                      //         ),
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Column(
                      //               mainAxisAlignment: MainAxisAlignment.start,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 container(
                      //                   context,
                      //                   w: w * 0.5,
                      //                   padding: EdgeInsets.all(0),
                      //                   child: text(
                      //                     context,
                      //                     'Dolopar 250 Suspension',
                      //                     textAlign: TextAlign.start,
                      //                     14,
                      //                     color: color11,
                      //                   ),
                      //                 ),
                      //                 text(context, 'Micro Labs Ltd', 13,
                      //                     color: color,
                      //                     fontWeight: FontWeight.w400,
                      //                     textAlign: TextAlign.left),
                      //               ],
                      //             ),
                      //             Spacer(),
                      //             Column(
                      //               children: [
                      //                 text(
                      //                   context,
                      //                   '₹45.02/oral sus',
                      //                   14,
                      //                   color: color11,
                      //                   fontWeight: FontWeight.w400,
                      //                 ),
                      //                 text(context, '13% cheaper', 13,
                      //                     color: color,
                      //                     fontWeight: FontWeight.w400,
                      //                     textAlign: TextAlign.left),
                      //               ],
                      //             ),
                      //           ],
                      //         ),
                      //         SizedBox(
                      //           height: h * 0.01,
                      //         ),
                      //         Divider(
                      //           height: 1,
                      //           color: color9,
                      //         ),
                      //         SizedBox(
                      //           height: h * 0.01,
                      //         ),
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             container(
                      //               context,
                      //               w: w * 0.5,
                      //               padding: EdgeInsets.all(0),
                      //               child: Column(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.start,
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   text(
                      //                     context,
                      //                     'Pacimol DS Oral Suspension',
                      //                     textAlign: TextAlign.start,
                      //                     14,
                      //                     color: color11,
                      //                   ),
                      //                   text(context, 'Ipca Laboratories Ltd',
                      //                       13,
                      //                       color: color,
                      //                       fontWeight: FontWeight.w400,
                      //                       textAlign: TextAlign.left),
                      //                 ],
                      //               ),
                      //             ),
                      //             Spacer(),
                      //             Column(
                      //               children: [
                      //                 text(
                      //                   context,
                      //                   '₹45.02/oral sus',
                      //                   14,
                      //                   color: color11,
                      //                   fontWeight: FontWeight.w400,
                      //                 ),
                      //                 text(context, '13% cheaper', 13,
                      //                     color: color,
                      //                     fontWeight: FontWeight.w400,
                      //                     textAlign: TextAlign.left),
                      //               ],
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     )),
                      container(
                          w: w,
                          margin: EdgeInsets.all(16),
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 16),
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
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 16),
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
                      // container(
                      //     w: w,
                      //     margin: EdgeInsets.only(
                      //         left: 16, right: 16, top: 16, bottom: 16),
                      //     padding: EdgeInsets.only(
                      //         left: 16, right: 16, top: 16, bottom: 16),
                      //     borderRadius: BorderRadius.circular(8),
                      //     context,
                      //     colors: color4,
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         text(context,
                      //             'Compare To Levipil 500mg VS LEVAZO SR', 18,
                      //             textAlign: TextAlign.left),
                      //         SizedBox(
                      //           height: h * 0.01,
                      //         ),
                      //         container(
                      //             w: w,
                      //             padding: EdgeInsets.only(
                      //                 left: 8, right: 8, top: 16, bottom: 16),
                      //             borderRadius: BorderRadius.circular(8),
                      //             colors: color12,
                      //             context,
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.start,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.start,
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     Image.asset(
                      //                       'assets/dolo250 Oral.png.png',
                      //                       fit: BoxFit.contain,
                      //                       width: w * 0.235,
                      //                     ),
                      //                     SizedBox(
                      //                       width: w * 0.04,
                      //                     ),
                      //                     Container(
                      //                       width: w * 0.5,
                      //                       child: Column(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment.start,
                      //                         crossAxisAlignment:
                      //                             CrossAxisAlignment.start,
                      //                         children: [
                      //                           container(context,
                      //                               borderRadius:
                      //                                   BorderRadius.circular(
                      //                                       100),
                      //                               padding:
                      //                                   EdgeInsets.symmetric(
                      //                                       horizontal: 4,
                      //                                       vertical: 2),
                      //                               colors: color13,
                      //                               child:
                      //                                   text(context,
                      //                                       'Best Seller', 6,
                      //                                       fontWeight:
                      //                                           FontWeight.w500,
                      //                                       color: color4)),
                      //                           text(
                      //                               context,
                      //                               'Dolo 250 Oral Suspension',
                      //                               14,
                      //                               fontWeight: FontWeight.w500,
                      //                               color: color11,
                      //                               textAlign: TextAlign.left,
                      //                               maxLines: 2),
                      //                           text(context,
                      //                               '60.0 ml in 1 bottle', 12,
                      //                               color: color,
                      //                               fontWeight: FontWeight.w400,
                      //                               textAlign: TextAlign.left),
                      //                           RatingWidget(
                      //                             initialRating: 4,
                      //                           ),
                      //                           Row(
                      //                             children: [
                      //                               text(context, 'Net Price:',
                      //                                   10,
                      //                                   color: color,
                      //                                   fontWeight:
                      //                                       FontWeight.w400),
                      //                               SizedBox(
                      //                                 width: w * 0.01,
                      //                               ),
                      //                               text(
                      //                                   context, '₹ 93.81', 14),
                      //                               Spacer(),
                      //                               text(context, 'M.R.P: ', 10,
                      //                                   color: color,
                      //                                   fontWeight:
                      //                                       FontWeight.w400),
                      //                               // Spacer(),
                      //                               text(context, '₹106.8', 12,
                      //                                   color: color1),
                      //                               SizedBox(
                      //                                 height: h * 0.01,
                      //                               ),
                      //                             ],
                      //                           ),
                      //                           SizedBox(
                      //                             height: h * 0.008,
                      //                           ),
                      //                           Row(
                      //                             children: [
                      //                               container(context,
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(4),
                      //                                   padding: EdgeInsets
                      //                                       .symmetric(
                      //                                           horizontal: 4),
                      //                                   colors:
                      //                                       Color(0xffFEF6F5),
                      //                                   child: Row(
                      //                                     children: [
                      //                                       text(context,
                      //                                           'MARGIN', 10,
                      //                                           color: color11,
                      //                                           fontWeight:
                      //                                               FontWeight
                      //                                                   .w400),
                      //                                       SizedBox(
                      //                                         width: w * 0.01,
                      //                                       ),
                      //                                       text(context, '16%',
                      //                                           10,
                      //                                           color: color1,
                      //                                           fontWeight:
                      //                                               FontWeight
                      //                                                   .w400),
                      //                                     ],
                      //                                   )),
                      //                               Spacer(),
                      //                               text(context, 'PTR', 10,
                      //                                   color: color11,
                      //                                   fontWeight:
                      //                                       FontWeight.w400),
                      //                               SizedBox(
                      //                                 width: w * 0.01,
                      //                               ),
                      //                               Image.asset(
                      //                                   'assets/about.png',
                      //                                   color: color1,
                      //                                   width: w * 0.03),
                      //                               SizedBox(
                      //                                 width: w * 0.01,
                      //                               ),
                      //                               text(context, '₹180', 10,
                      //                                   color: color11,
                      //                                   fontWeight:
                      //                                       FontWeight.w400),
                      //                             ],
                      //                           ),
                      //                           SizedBox(
                      //                             height: h * 0.01,
                      //                           ),
                      //                           Row(
                      //                             mainAxisAlignment:
                      //                                 MainAxisAlignment.start,
                      //                             crossAxisAlignment:
                      //                                 CrossAxisAlignment.start,
                      //                             children: [
                      //                               container(
                      //                                   padding: EdgeInsets
                      //                                       .symmetric(
                      //                                           vertical: 4),
                      //                                   w: w * 0.2,
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(4),
                      //                                   colors: color1,
                      //                                   context,
                      //                                   child: Center(
                      //                                       child: text(context,
                      //                                           'Add', 12,
                      //                                           color: color4,
                      //                                           fontWeight:
                      //                                               FontWeight
                      //                                                   .w400))),
                      //                               Spacer(),
                      //                               Image.asset(
                      //                                 'assets/favrate.png',
                      //                                 fit: BoxFit.contain,
                      //                                 width: w * 0.06,
                      //                               ),
                      //                               Spacer(),
                      //                               Image.asset(
                      //                                 'assets/block.png',
                      //                                 fit: BoxFit.contain,
                      //                                 width: w * 0.06,
                      //                               ),
                      //                               Spacer(),
                      //                               Image.asset(
                      //                                 'assets/youtube.png',
                      //                                 fit: BoxFit.contain,
                      //                                 width: w * 0.08,
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     )
                      //                   ],
                      //                 ),
                      //                 SizedBox(
                      //                   height: h * 0.01,
                      //                 ),
                      //                 SingleChildScrollView(
                      //                   physics: BouncingScrollPhysics(),
                      //                   scrollDirection: Axis.horizontal,
                      //                   child: Row(
                      //                     children: [
                      //                       container(
                      //                         context,
                      //                         colors: color15.withOpacity(0.2),
                      //                         border: Border.all(
                      //                             color: color15, width: 1),
                      //                         padding: EdgeInsets.symmetric(
                      //                             horizontal: 6, vertical: 3),
                      //                         borderRadius:
                      //                             BorderRadius.circular(100),
                      //                         child: text(
                      //                             context, 'GENERIC', 10,
                      //                             color: color,
                      //                             fontWeight: FontWeight.w400),
                      //                       ),
                      //                       SizedBox(
                      //                         width: w * 0.01,
                      //                       ),
                      //                       container(
                      //                         context,
                      //                         colors: color15.withOpacity(0.2),
                      //                         border: Border.all(
                      //                             color: color15, width: 1),
                      //                         padding: EdgeInsets.symmetric(
                      //                             horizontal: 6, vertical: 3),
                      //                         borderRadius:
                      //                             BorderRadius.circular(100),
                      //                         child: text(context, 'OTC', 10,
                      //                             color: color,
                      //                             fontWeight: FontWeight.w400),
                      //                       ),
                      //                       SizedBox(
                      //                         width: w * 0.01,
                      //                       ),
                      //                       container(
                      //                         context,
                      //                         colors: color15.withOpacity(0.2),
                      //                         border: Border.all(
                      //                             color: color15, width: 1),
                      //                         padding: EdgeInsets.symmetric(
                      //                             horizontal: 6, vertical: 3),
                      //                         borderRadius:
                      //                             BorderRadius.circular(100),
                      //                         child: text(
                      //                             context, 'SPECALITY', 10,
                      //                             color: color,
                      //                             fontWeight: FontWeight.w400),
                      //                       ),
                      //                       SizedBox(
                      //                         width: w * 0.01,
                      //                       ),
                      //                       container(
                      //                         context,
                      //                         colors: color15.withOpacity(0.2),
                      //                         border: Border.all(
                      //                             color: color15, width: 1),
                      //                         padding: EdgeInsets.symmetric(
                      //                             horizontal: 6, vertical: 3),
                      //                         borderRadius:
                      //                             BorderRadius.circular(100),
                      //                         child: text(context,
                      //                             'OT CONSUMASABLE', 10,
                      //                             color: color,
                      //                             fontWeight: FontWeight.w400),
                      //                       ),
                      //                       SizedBox(
                      //                         width: w * 0.01,
                      //                       ),
                      //                       container(
                      //                         context,
                      //                         colors: color15.withOpacity(0.2),
                      //                         border: Border.all(
                      //                             color: color15, width: 1),
                      //                         padding: EdgeInsets.symmetric(
                      //                             horizontal: 6, vertical: 3),
                      //                         borderRadius:
                      //                             BorderRadius.circular(100),
                      //                         child: text(context,
                      //                             'LAB CONSUMASABLE', 10,
                      //                             color: color,
                      //                             fontWeight: FontWeight.w400),
                      //                       ),
                      //                       SizedBox(
                      //                         width: w * 0.01,
                      //                       ),
                      //                       container(
                      //                         context,
                      //                         colors: color4,
                      //                         border: Border.all(
                      //                             color: color15, width: 1),
                      //                         padding: EdgeInsets.symmetric(
                      //                             horizontal: 6, vertical: 3),
                      //                         borderRadius:
                      //                             BorderRadius.circular(100),
                      //                         child: text(context, 'FMCG', 10,
                      //                             color: color,
                      //                             fontWeight: FontWeight.w400),
                      //                       ),
                      //                       SizedBox(
                      //                         width: w * 0.01,
                      //                       ),
                      //                       container(
                      //                         context,
                      //                         colors: color4,
                      //                         border: Border.all(
                      //                             color: color15, width: 1),
                      //                         padding: EdgeInsets.symmetric(
                      //                             horizontal: 6, vertical: 3),
                      //                         borderRadius:
                      //                             BorderRadius.circular(100),
                      //                         child: text(context, 'PRO', 10,
                      //                             color: color,
                      //                             fontWeight: FontWeight.w400),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   height: h * 0.01,
                      //                 ),
                      //                 Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.center,
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.center,
                      //                   children: [
                      //                     text(
                      //                       context,
                      //                       'Offer time',
                      //                       10,
                      //                       color: color16,
                      //                       fontWeight: FontWeight.w400,
                      //                     ),
                      //                     SizedBox(
                      //                       width: w * 0.01,
                      //                     ),
                      //                     text(
                      //                       context,
                      //                       '08:40:10',
                      //                       10,
                      //                       color: color16,
                      //                       fontWeight: FontWeight.w400,
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ],
                      //             )),
                      //         SizedBox(
                      //           height: h * 0.01,
                      //         ),
                      //         Stack(children: [
                      //           Positioned(
                      //             left: 0,
                      //             top: h * 0.025,
                      //             child: Dash(
                      //                 direction: Axis.horizontal,
                      //                 length: w * 0.8,
                      //                 dashLength: 2,
                      //                 dashColor: color17),
                      //           ),
                      //           Center(
                      //             child: container(
                      //                 padding: EdgeInsets.all(6),
                      //                 borderRadius: BorderRadius.circular(100),
                      //                 colors: color1,
                      //                 context,
                      //                 child: text(context, 'VS', 20,
                      //                     fontWeight: FontWeight.w800,
                      //                     color: color4)),
                      //           ),
                      //         ]),
                      //         Stack(
                      //           children: [
                      //             container(context,
                      //                 colors: color12,
                      //                 borderRadius: BorderRadius.circular(8),
                      //                 w: w,
                      //                 h: h * 0.07,
                      //                 margin:
                      //                     EdgeInsets.only(top: 16, bottom: 16),
                      //                 child: Center(
                      //                     child: Image.asset(
                      //                   'assets/add_circle_.png',
                      //                   fit: BoxFit.contain,
                      //                   width: w * 0.1,
                      //                 ))),
                      //             Positioned(
                      //                 right: w * 0.02,
                      //                 top: h * 0.031,
                      //                 child: Image.asset(
                      //                   'assets/cancel.png',
                      //                   width: w * 0.04,
                      //                 ))
                      //           ],
                      //         ),
                      //         container(context,
                      //             margin: EdgeInsets.only(top: 16),
                      //             padding: EdgeInsets.symmetric(
                      //                 vertical: 14, horizontal: 8),
                      //             colors: color4,
                      //             border: Border.all(color: color1, width: 1),
                      //             borderRadius: BorderRadius.circular(2),
                      //             child: Center(
                      //                 child: text(context,
                      //                     'COMPARE LEVIPIL VS LEVAZOSR75MG', 14,
                      //                     color: color1)))
                      //       ],
                      //     )),
                      // Container(
                      //   width: w,
                      //   margin: EdgeInsets.only(left: 16, bottom: 16),
                      //   padding: const EdgeInsets.all(16),
                      //   decoration: BoxDecoration(
                      //       color: Color(0xffffffff),
                      //       borderRadius: BorderRadius.circular(8)),
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         children: [
                      //           text(context, 'Near expiry Products', 16),
                      //           Spacer(),
                      //           text(context, 'SEE ALL', 16,
                      //               color: color1, fontWeight: FontWeight.w400),
                      //           Icon(
                      //             Icons.arrow_forward_ios_outlined,
                      //             color: color1,
                      //             size: 18,
                      //           )
                      //         ],
                      //       ),
                      //       SizedBox(
                      //         height: h * 0.01,
                      //       ),
                      //       Container(
                      //         // child: ListView.builder(
                      //         //   scrollDirection: Axis.horizontal,
                      //         //   itemCount: grid3.length,
                      //         //   itemBuilder: (context, index) {
                      //         //     return
                      //         child: SingleChildScrollView(
                      //           scrollDirection: Axis.horizontal,
                      //           child: Row(
                      //             children: List.generate(
                      //               4,
                      //               (index) {
                      //                 return Container(
                      //                   width: w * 0.8,
                      //                   padding: EdgeInsets.all(8),
                      //                   margin: EdgeInsets.only(right: 8),
                      //                   decoration: BoxDecoration(
                      //                       border: Border.all(
                      //                         color: color1.withOpacity(0.2),
                      //                         width: 1,
                      //                       ),
                      //                       borderRadius:
                      //                           BorderRadius.circular(8)),
                      //                   child: Center(
                      //                     child: InkWell(
                      //                       onTap: () {
                      //                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomizeProductBar()));
                      //                       },
                      //                       child: Column(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment.start,
                      //                         crossAxisAlignment:
                      //                             CrossAxisAlignment.start,
                      //                         children: [
                      //                           Container(
                      //                               child: Center(
                      //                             child: Image.asset(
                      //                               'assets/HCQS 200 Tablet.png',
                      //                               fit: BoxFit.contain,
                      //                             ),
                      //                           )),
                      //                           SizedBox(
                      //                             height: h * 0.01,
                      //                           ),
                      //                           text(context, 'HCQS 200 Tablet',
                      //                               14),
                      //                           SizedBox(
                      //                             height: h * 0.02,
                      //                           ),
                      //                           text(
                      //                               context,
                      //                               '15.0 tablets in 1 strip',
                      //                               10,
                      //                               color: color1),
                      //                           SizedBox(
                      //                             height: h * 0.01,
                      //                           ),
                      //                           Row(
                      //                             children: [
                      //                               text(context, 'Net Price:',
                      //                                   12,
                      //                                   color: color),
                      //                               SizedBox(
                      //                                 width: w * 0.01,
                      //                               ),
                      //                               text(
                      //                                   context, '₹ 93.81', 14),
                      //                               SizedBox(
                      //                                 width: w * 0.02,
                      //                               ),
                      //                               text(context, 'MRP:', 12,
                      //                                   color: color),
                      //                               SizedBox(
                      //                                 width: w * 0.01,
                      //                               ),
                      //                               text(context, '₹ 106.8', 14,
                      //                                   color: color1),
                      //                               SizedBox(
                      //                                 height: h * 0.01,
                      //                               ),
                      //                             ],
                      //                           ),
                      //                           SizedBox(
                      //                             height: h * 0.01,
                      //                           ),
                      //                           Row(
                      //                             children: [
                      //                               text(context, 'MARGIN', 12,
                      //                                   fontWeight:
                      //                                       FontWeight.w500),
                      //                               SizedBox(
                      //                                 width: w * 0.02,
                      //                               ),
                      //                               text(context, '12%', 14,
                      //                                   color: color1),
                      //                               SizedBox(
                      //                                 width: w * 0.01,
                      //                               ),
                      //                               text(context, 'PTR', 12,
                      //                                   fontWeight:
                      //                                       FontWeight.w500),
                      //                               Icon(
                      //                                 Icons.info,
                      //                                 color: color1,
                      //                                 size: 18,
                      //                               ),
                      //                               SizedBox(
                      //                                 width: w * 0.02,
                      //                               ),
                      //                               text(
                      //                                 context,
                      //                                 '₹ 106.8',
                      //                                 14,
                      //                               ),
                      //                             ],
                      //                           ),
                      //                           SizedBox(
                      //                             height: h * 0.02,
                      //                           ),
                      //                           Row(
                      //                             children: [
                      //                               Expanded(
                      //                                 child: containertext(
                      //                                     context,
                      //                                     'ADD TO CART',
                      //                                     onTap: () {}),
                      //                               ),
                      //                               SizedBox(
                      //                                 width: w * 0.02,
                      //                               ),
                      //                               Container(
                      //                                 height: h * 0.055,
                      //                                 decoration: BoxDecoration(
                      //                                     border: Border.all(
                      //                                         color: color2,
                      //                                         width: 2),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(8)),
                      //                                 child: Image.asset(
                      //                                   'assets/favrate.png',
                      //                                   color: color2,
                      //                                   fit: BoxFit.contain,
                      //                                 ),
                      //                               )
                      //                             ],
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ),
                      //
                      //                   //   );
                      //                   // }
                      //                 );
                      //               },
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // container(
                      //     w: w,
                      //     context,
                      //     margin:
                      //         EdgeInsets.only(left: 16, bottom: 16, right: 16),
                      //     padding: const EdgeInsets.all(16),
                      //     colors: color4,
                      //     borderRadius: BorderRadius.circular(8),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         text(context, 'Other Information:', 20,
                      //             color: color18, fontWeight: FontWeight.w400),
                      //         text(
                      //             context,
                      //             'A Licensed Vendor Partner id dicis, vicimus. Paulum, cum regem Persem captum adduceret, eodem flumine invectio? Non enim quaero quid verum, sed quid cuique dicendum sit. Quid, quod homines infima fortuna, nulla spe rerum gerendarum, opifices denique delectantur historia? Omnes enim iucundum motum, quo sensus hilaretur.',
                      //             13,
                      //             color: color2,
                      //             fontWeight: FontWeight.w400,
                      //             textAlign: TextAlign.left),
                      //         SizedBox(
                      //           height: h * 0.01,
                      //         ),
                      //         text(context, 'Manufacturer / Marketing Address',
                      //             16,
                      //             color: color18,
                      //             fontWeight: FontWeight.w400,
                      //             textAlign: TextAlign.left),
                      //         SizedBox(
                      //           height: h * 0.01,
                      //         ),
                      //         text(
                      //             context,
                      //             product_details.productData?.manufactureCompany??"",
                      //             13,
                      //             color: color2,
                      //             fontWeight: FontWeight.w400,
                      //             textAlign: TextAlign.left),
                      //         SizedBox(
                      //           height: h * 0.01,
                      //         ),
                      //       ],
                      //     )),
                      container(
                          w: w,
                          context,
                          margin:
                              EdgeInsets.only(left: 16, bottom: 16, right: 16),
                          padding: const EdgeInsets.all(16),
                          colors: color4,
                          borderRadius: BorderRadius.circular(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text(context, 'Product Information:', 20,
                                  color: color18, fontWeight: FontWeight.w400),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              // text(
                              //     context,
                              //     'Nutracitta Biotin Beauty Blend - Multivitamins Gummies- Vitamin A, B7, B12, C, E & Zinc ',
                              //     13,
                              //     color: color18,
                              //     fontWeight: FontWeight.w700,
                              //     textAlign: TextAlign.left),
                              text(
                                  context,
                                  product_details.productData?.description ??
                                      "",
                                  13,
                                  color: color2,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.left),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              text(context, 'Manufacturer / Marketing Address',
                                  16,
                                  color: color18,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.left),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              text(
                                  context,
                                  product_details
                                          .productData?.manufactureCompany ??
                                      "",
                                  13,
                                  color: color2,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.left),
                              SizedBox(
                                height: h * 0.01,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              );
            }),

            bottomNavigationBar: Consumer<ProductDetailsProvider>(
                builder: (context, productDetailsProvider, child) {
              if (productDetailsProvider.isLoading) {
                return SizedBox
                    .shrink(); // Hide the bottom navigation bar when data is null or empty
              } else {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Cartscreen(),
                              ));
                        },
                        child: Container(
                          width: w * 0.45,
                          height: h * 0.06,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              border: Border.all(color: color1, width: 1),
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: Text(
                              "VIEW CART",
                              style: TextStyle(
                                color: color1,
                                fontFamily: 'RozhaOne',
                                fontSize: 16,
                                height: 21.06 / 16,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      InkResponse(
                          onTap: () {
                            AddToCartApi(widget.productid, "1");
                          },
                          child: Container(
                              width: w * 0.45,
                              height: h * 0.06,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: color1,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                  child: Text(
                                "ADD TO CART",
                                style: TextStyle(
                                  color: color4,
                                  fontFamily: 'RozhaOne',
                                  fontSize: 16,
                                  height: 21.06 / 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              )
                                  //     :
                                  // Row(
                                  //         mainAxisAlignment: MainAxisAlignment.center,
                                  //         children: [
                                  //           Container(width:w*0.06,height: h*0.03,
                                  //             decoration: BoxDecoration(
                                  //                 border: Border.all(
                                  //                     color: Color(0xffffffff), width: 1)),
                                  //             child: IconButton( padding: EdgeInsets.all(0),
                                  //               icon: Icon(Icons.remove,
                                  //                   size: 20,    color: Color(0xffE7C6A0),), // color11
                                  //               onPressed: () {
                                  //                 setState(() {
                                  //                   if (quantity > 0) quantity--;
                                  //                 });
                                  //                 AddToCartApi(quantity.toString());
                                  //               },
                                  //             ),
                                  //           ),
                                  //           SizedBox(
                                  //               width:
                                  //                   8), // Space between the icon and quantity
                                  //           Text(
                                  //             "$quantity", // Show the quantity next to the cart icon
                                  //             style: TextStyle(
                                  //               color: Color(0xffE7C6A0),
                                  //               fontFamily: 'RozhaOne',
                                  //               fontSize: 16,
                                  //               height: 21.06 / 16,
                                  //               fontWeight: FontWeight.w400,
                                  //             ),
                                  //             textAlign: TextAlign.center,
                                  //           ),
                                  //           SizedBox(width: 8),
                                  //           Container(width:w*0.06,height: h*0.03,
                                  //             decoration: BoxDecoration(
                                  //                 border: Border.all(
                                  //                     color: Color(0xffffffff), width: 1)),
                                  //             child: IconButton( padding: EdgeInsets.all(0),
                                  //               icon: Icon(Icons.add,
                                  //                 size: 20,    color: Color(0xffE7C6A0),), // color11
                                  //               onPressed: () {
                                  //                 setState(() {
                                  //                   if (quantity > 0) quantity++;
                                  //                 });
                                  //                 AddToCartApi(quantity.toString());
                                  //               },
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  )))
                    ],
                  ),
                );
              }
            }),

            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     container(
            //       w: w,
            //       context,
            //       padding: EdgeInsets.symmetric(vertical: 16),
            //       colors: color4,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding: EdgeInsets.symmetric(horizontal: 16),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Column(
            //                   mainAxisAlignment: MainAxisAlignment.start,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     text(context, 'In Stock', 12,
            //                         color: color18,
            //                         fontWeight: FontWeight.w400),
            //                     text(context, '990', 14,
            //                         fontWeight: FontWeight.w500,
            //                         color: color19),
            //                   ],
            //                 ),
            //                 Spacer(),
            //                 container(
            //                   w: w * 0.07,
            //                   h: h * 0.033,
            //                   colors: color4,
            //                   padding: EdgeInsets.all(0),
            //                   borderRadius: BorderRadius.circular(4),
            //                   border: Border.all(
            //                       color: color11.withOpacity(0.1), width: 1),
            //                   context,
            //                   child: IconButton(
            //                     padding: EdgeInsets.all(0),
            //                     icon: Icon(Icons.remove,
            //                         size: 18, color: color11), // color11
            //                     onPressed: () {
            //                       setState(() {
            //                         if (_counter > 0) _counter--;
            //                       });
            //                     },
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   width: w * 0.01,
            //                 ),
            //                 container(
            //                     w: w * 0.07,
            //                     h: h * 0.033,
            //                     colors: color4,
            //                     padding: EdgeInsets.all(0),
            //                     borderRadius: BorderRadius.circular(4),
            //                     border: Border.all(
            //                         color: color11.withOpacity(0.1), width: 1),
            //                     context,
            //                     child: Center(
            //                         child: text(context, '$_counter', 14))),
            //                 SizedBox(
            //                   width: w * 0.01,
            //                 ),
            //                 container(
            //                   w: w * 0.07,
            //                   h: h * 0.033,
            //                   colors: color1,
            //                   borderRadius: BorderRadius.circular(4),
            //                   padding: EdgeInsets.all(0),
            //                   context,
            //                   child: IconButton(
            //                     padding: EdgeInsets.all(0),
            //                     icon: Icon(Icons.add,
            //                         size: 18, color: color4), // color11
            //                     onPressed: () {
            //                       setState(() {
            //                         _counter++;
            //                       });
            //                     },
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           SizedBox(
            //             height: h * 0.01,
            //           ),
            //           container(
            //               w: w,
            //               context,
            //               colors: color13,
            //               padding: EdgeInsets.symmetric(vertical: 6),
            //               child: Center(
            //                   child: text(context,
            //                       'Congratulations ! 5+1 scheme is applied', 10,
            //                       color: color4))),
            //           SizedBox(
            //             height: h * 0.01,
            //           ),
            //           Padding(
            //             padding: EdgeInsets.symmetric(horizontal: 16),
            //             child: Row(
            //               children: [
            //                 Column(
            //                   mainAxisAlignment: MainAxisAlignment.start,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     text(
            //                       context,
            //                       'TO BE PAID',
            //                       13,
            //                       fontWeight: FontWeight.w400,
            //                       color: color,
            //                     ),
            //                     text(
            //                       context,
            //                       '₹2,545',
            //                       16,
            //                     ),
            //                     Row(
            //                       children: [
            //                         Image.asset(
            //                           'assets/Coin.png',
            //                           width: w * 0.045,
            //                         ),
            //                         SizedBox(
            //                           width: w * 0.01,
            //                         ),
            //                         text(
            //                           context,
            //                           'Redeem 30Coins',
            //                           12,
            //                           fontWeight: FontWeight.w400,
            //                           color: color11,
            //                         ),
            //                         InkWell(
            //                             onTap: () {
            //                               setState(() {
            //                                 _isChecked = !_isChecked;
            //                               });
            //                             },
            //                             child: Checkbox(
            //                                 activeColor: color1,
            //                                 side: BorderSide(
            //                                     color:
            //                                         color11.withOpacity(0.25)),
            //                                 splashRadius: 30,
            //                                 value: _isChecked,
            //                                 onChanged: (bool? newvalue) {
            //                                   setState(() {
            //                                     _isChecked = !_isChecked;
            //                                   });
            //                                 }))
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //                 Spacer(),
            //                 container(context,
            //                     borderRadius: BorderRadius.circular(8),
            //                     padding: EdgeInsets.symmetric(
            //                         horizontal: 16, vertical: 8),
            //                     colors: color1,
            //                     child: Row(
            //                       children: [
            //                         text(context, 'CHECKOUT', 13,
            //                             fontWeight: FontWeight.w400,
            //                             color: color4),
            //                         Icon(
            //                           Icons.arrow_forward,
            //                           color: color4,
            //                         )
            //                       ],
            //                     ))
            //               ],
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          )
        : NoInternetWidget();
  }
}
