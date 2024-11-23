import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:drugcalm/Screens/CartScreen.dart';
import 'package:drugcalm/Screens/ProductDetails.dart';
import 'package:drugcalm/Services/UserApi.dart';
import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:drugcalm/utils/CustomSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/BLockListModel.dart';
import '../Model/GetCartListModel.dart';
import '../Services/otherservices.dart';
import '../others/Banners.dart';
import '../providers/CartProvider.dart';
import '../providers/ConnectivityProviders.dart';
import '../providers/WishlistProvider.dart';
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
    GetBlockList();
    Provider.of<ConnectivityProviders>(context, listen: false)
        .initConnectivity();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<ConnectivityProviders>(context, listen: false).dispose();
    super.dispose();
  }

  final spinkits = Spinkits1();

  List<BlockList> data = [];

  Future<void> GetBlockList() async {
    var res = await Userapi.getBlockList();
    if (res != null) {
      setState(() {
        if (res.settings?.success == 1) {
          data = res.data ?? [];
        } else {}
      });
    }
  }

  Future<void> updateBlockList(String id) async{
    var res = await Userapi.updateBlockListapi(id) ;
    if(res !=null){
      setState(() {

        if(res.settings?.success==1){
          GetBlockList();
          CustomSnackBar.show(context, res.settings?.message ?? "");
        }else{
          CustomSnackBar.show(context, res.settings?.message ?? "");
        }
      });
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
            appBar: CustomAppBar1(title: 'BLOCKLIST', actions: [Container()]),
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'assets/Drug Clam Background.png',
                ),
                fit: BoxFit.cover,
              )),
              child: CustomScrollView(
                slivers: [
                  // SliverToBoxAdapter(
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  //     decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //             image: AssetImage('assets/Drug Clam Background.png'),
                  //             fit: BoxFit.cover)),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         CarouselSlider(
                  //           options: CarouselOptions(
                  //             height: h * 0.14,
                  //             autoPlay: true,
                  //             onPageChanged: (index, reason) {
                  //               setState(() {
                  //                 currentindex = index;
                  //               });
                  //             },
                  //             viewportFraction: 1,
                  //           ),
                  //           items: [
                  //             BannerImage(),
                  //             BannerImage(),
                  //             BannerImage(),
                  //           ],
                  //         ),
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             for (int i = 0; i <= 2; i++)
                  //               Container(
                  //                 margin: EdgeInsets.all(5),
                  //                 height: h * 0.01,
                  //                 width: w * 0.02,
                  //                 decoration: BoxDecoration(
                  //                     color: currentindex == i ? color1 : color2,
                  //                     borderRadius: BorderRadius.circular(100)),
                  //               ),
                  //           ],
                  //         ),
                  //         // SizedBox(
                  //         //   height: h * 0.01,
                  //         // ),
                  //         // text(context, 'Available Medicine', 18,
                  //         //     fontfamily: 'SFPD',
                  //         //     fontWeight: FontWeight.w500,
                  //         //     color: color11),
                  //         SizedBox(
                  //           height: h * 0.01,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final block_list_Data = data[index];
                        if (data.length == 0) {
                          return Center(
                            child: Column(
                              children: [
                                SizedBox(height: w * 0.2),
                                Image.asset(
                                  'assets/not_connect_wifi_wishlist.png',
                                  width: 160,
                                  height: 160,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 30),
                                Text(
                                  "No Product",
                                  style: TextStyle(
                                    color: color1,
                                    fontFamily: 'RozhaOne',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Come back for the product we are updating the product soon!",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontFamily: 'RozhaOne',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        }

                        return Container(
                          width: w,
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 16, bottom: 16),
                          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: color12, // Add your color
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: InkResponse(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Productdetails(
                                                        productid:
                                                            block_list_Data
                                                                    .product
                                                                    ?.id ??
                                                                ""),
                                              ));
                                        },
                                        child: Container(
                                          constraints: BoxConstraints.expand(),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/water_mark.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: block_list_Data
                                                    .product?.image ??
                                                "",
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
                                    SizedBox(width: w * 0.04),

                                    // Content Column
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        constraints: BoxConstraints.expand(),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkResponse(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Productdetails(
                                                              productid:
                                                                  block_list_Data
                                                                          .product
                                                                          ?.id ??
                                                                      ""),
                                                    ));
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  if (block_list_Data.product
                                                          ?.bestSeller ??
                                                      false) ...[
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 4,
                                                              vertical: 2),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            color13, // Your color
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                      child: Text(
                                                        'Best Seller',
                                                        style: TextStyle(
                                                          fontSize: 6,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              color4, // Your color
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  Row(
                                                    children: [
                                                      SizedBox(width: w*0.48,
                                                        child: Text(
                                                          block_list_Data.product
                                                                  ?.name ??
                                                              "",
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                color11, // Your color
                                                          ),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      InkResponse(onTap: (){
                                                        updateBlockList(block_list_Data.product?.id??"");

                                                      },
                                                        child: container(
                                                            padding:
                                                                EdgeInsets.all(5),
                                                            colors: color1
                                                                .withOpacity(0.1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            context,
                                                            child: Icon(
                                                              Icons.close,
                                                              color: color16,
                                                              size: 14,
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                  Text(
                                                    block_list_Data
                                                            .product?.subName ??
                                                        "",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          color, // Your color
                                                    ),
                                                  ),
                                                  RatingWidget(
                                                      initialRating: 4),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Net Price:',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              color, // Your color
                                                        ),
                                                      ),
                                                      SizedBox(width: w * 0.01),
                                                      Text(
                                                        block_list_Data.product
                                                                ?.netPrice ??
                                                            "",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        'M.R.P:',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              color, // Your color
                                                        ),
                                                      ),
                                                      Text(
                                                        block_list_Data
                                                                .product?.mrp ??
                                                            "",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              color1, // Your color
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: h * 0.01),
                                                    ],
                                                  ),
                                                  SizedBox(height: h * 0.008),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 4),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color(
                                                              0xffFEF6F5), // Your color
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'MARGIN',
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    color11, // Your color
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width:
                                                                    w * 0.01),
                                                            Text(
                                                              block_list_Data
                                                                      .product
                                                                      ?.margin
                                                                      .toString() ??
                                                                  "",
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                                color:
                                                                    color1, // Your color
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        'PTR',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color:
                                                              color11, // Your color
                                                        ),
                                                      ),
                                                      SizedBox(width: w * 0.01),
                                                      Image.asset(
                                                        'assets/about.png',
                                                        color:
                                                            color1, // Your color
                                                        width: w * 0.03,
                                                      ),
                                                      SizedBox(width: w * 0.01),
                                                      Text(
                                                        block_list_Data
                                                                .product?.ptr ??
                                                            "",
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color:
                                                              color11, // Your color
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: h * 0.01),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment
                                            //           .spaceBetween,
                                            //   children: [
                                            // Quantity Selector
                                            //     if (block_list_Data.product?.quantity ==
                                            //         0) ...[
                                            // InkResponse(
                                            //   onTap: () async {
                                            //     var msg =
                                            //         await cart_provider
                                            //             .addToCartApi(
                                            //                 data.product
                                            //                         ?.id ??
                                            //                     "",
                                            //                 "1");
                                            //
                                            //     // After adding to the cart, update the product quantity in ProductListProvider
                                            //     if (msg != null) {
                                            //       WishlistProvider
                                            //           wishlistListProvider =
                                            //           Provider.of<
                                            //                   WishlistProvider>(
                                            //               context,
                                            //               listen: false);
                                            //
                                            // Ensure you're using the correct 'product.id' here, not 'product' itself.
                                            //       String productId = data
                                            //               .product?.id ??
                                            //           ''; // Store the product ID in a local variable
                                            //
                                            // var product = wishlistListProvider.wishlistProducts.firstWhere(
                                            //         (p) => p.product?.id == productId,  // Use the local 'productId' variable
                                            //     orElse: () => Wishlist(product: Product(id: '-1'))  // Return a default product if not found
                                            // );
                                            // Ensure the product is found before updating
                                            //       if (data.product?.id !=
                                            //           '-1') {
                                            //         data.product
                                            //             ?.quantity = (data
                                            //                     .product
                                            //                     ?.quantity ??
                                            //                 0) +
                                            //             1; // Safe addition
                                            //         wishlistListProvider
                                            //             .notifyListeners(); // Notify listeners to update the UI
                                            //       }
                                            //     }
                                            //   },
                                            //   child: Container(
                                            //     padding:
                                            //         EdgeInsets.symmetric(
                                            //             vertical: 5),
                                            //     width: w * 0.3,
                                            //     decoration: BoxDecoration(
                                            //       color: color1,
                                            //       borderRadius:
                                            //           BorderRadius
                                            //               .circular(4),
                                            //     ),
                                            //     child: Center(
                                            //       child: Text(
                                            //         'ADD',
                                            //         style: TextStyle(
                                            //           fontSize: 12,
                                            //           fontWeight:
                                            //               FontWeight.w400,
                                            //           color: color4,
                                            //         ),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // )
                                            // ] else ...[
                                            // Handle the other case when the product quantity is more than 0
                                            // Container(
                                            //   decoration: BoxDecoration(
                                            //     color: color1,
                                            //     borderRadius:
                                            //         BorderRadius.circular(
                                            //             4),
                                            //   ),
                                            //   child: Row(
                                            //     mainAxisSize:
                                            //         MainAxisSize.min,
                                            //     mainAxisAlignment:
                                            //         MainAxisAlignment
                                            //             .center,
                                            //     children: [
                                            //       // Decrease quantity button
                                            //       GestureDetector(
                                            //         child: Container(
                                            //           padding: EdgeInsets
                                            //               .symmetric(
                                            //                   horizontal:
                                            //                       10,
                                            //                   vertical:
                                            //                       5),
                                            //           child: Icon(
                                            //               Icons.remove,
                                            //               color: color4,
                                            //               size: 20),
                                            //         ),
                                            //         onTap: () async {
                                            //           if ((data.product
                                            //                       ?.quantity ??
                                            //                   0) >
                                            //               0) {
                                            //             // Decrease the quantity
                                            //             int newQuantity =
                                            //                 (data.product
                                            //                             ?.quantity ??
                                            //                         0) -
                                            //                     1;
                                            //
                                            //             // Optimistically update the quantity in the cart provider
                                            //             cart_provider
                                            //                 .optimisticUpdateCartQuantity(
                                            //               data.product
                                            //                       ?.id ??
                                            //                   "",
                                            //               newQuantity,
                                            //             );
                                            //
                                            //             // Update the quantity in the server (API call)
                                            //             var res =
                                            //                 await cart_provider
                                            //                     .updateCartApi(
                                            //               data.product
                                            //                       ?.id ??
                                            //                   "",
                                            //               newQuantity
                                            //                   .toString(),
                                            //             );
                                            //
                                            //             // Optionally update the product list immediately
                                            //             // Notify listeners to update the UI
                                            //             if (res != 0) {
                                            //               wishlistListProvider
                                            //                   .wishlistProducts
                                            //                   .forEach(
                                            //                       (p) {
                                            //                 if (p.product
                                            //                         ?.id ==
                                            //                     data.product
                                            //                         ?.id) {
                                            //                   p.product
                                            //                           ?.quantity =
                                            //                       newQuantity; // Directly update the product's quantity
                                            //                 }
                                            //               });
                                            //
                                            //               // Notify the listeners of the product list provider to refresh the UI
                                            //               wishlistListProvider
                                            //                   .notifyListeners();
                                            //             }
                                            //           }
                                            //         },
                                            //       ),
                                            //
                                            //       // Animated counter to display the updated quantity
                                            //       AnimatedFlipCounter(
                                            //         value: block_list_Data.product
                                            //                 ?.quantity ??
                                            //             0,
                                            //         textStyle: TextStyle(
                                            //             fontSize: 15,
                                            //             color: color4,
                                            //             fontWeight:
                                            //                 FontWeight
                                            //                     .bold),
                                            //       ),

                                            // Increase quantity button
                                            // GestureDetector(
                                            //   child: Container(
                                            //     padding: EdgeInsets
                                            //         .symmetric(
                                            //             horizontal:
                                            //                 10,
                                            //             vertical:
                                            //                 5),
                                            //     child: Icon(
                                            //         Icons.add,
                                            //         color: color4,
                                            //         size: 20),
                                            //   ),
                                            //   onTap: () async {
                                            //     int newQuantity = (data
                                            //                 .product
                                            //                 ?.quantity ??
                                            //             0) +
                                            //         1;
                                            //
                                            //     // Optimistically update the quantity in the cart provider
                                            //     cart_provider
                                            //         .optimisticUpdateCartQuantity(
                                            //       data.product
                                            //               ?.id ??
                                            //           "",
                                            //       newQuantity,
                                            //     );
                                            //
                                            //     // Update the quantity in the server (API call)
                                            //     var res =
                                            //         await cart_provider
                                            //             .updateCartApi(
                                            //       data.product
                                            //               ?.id ??
                                            //           "",
                                            //       newQuantity
                                            //           .toString(),
                                            //     );
                                            //
                                            //     // Optionally update the product list immediately
                                            //     // Notify listeners to update the UI
                                            //     wishlistListProvider
                                            //         .wishlistProducts
                                            //         .forEach((p) {
                                            //       if (p.product
                                            //               ?.id ==
                                            //           data.product
                                            //               ?.id) {
                                            //         p.product
                                            //                 ?.quantity =
                                            //             newQuantity; // Directly update the product's quantity
                                            //       }
                                            //     });
                                            //
                                            //     // Notify the listeners of the product list provider to refresh the UI
                                            //     wishlistListProvider
                                            //         .notifyListeners();
                                            //   },
                                            // ),
                                            //     ],
                                            //   ),
                                            // )
                                            //     ],
                                            // GestureDetector(
                                            //   onTap: () {
                                            //     if (data.product
                                            //             ?.isInWishlist ??
                                            //         false) {
                                            //       context
                                            //           .read<
                                            //               WishlistProvider>()
                                            //           .removeFromWishlist(
                                            //               data.product
                                            //                       ?.id ??
                                            //                   "");
                                            //     } else {
                                            //       context
                                            //           .read<
                                            //               WishlistProvider>()
                                            //           .addToWishlist(data
                                            //                   .product
                                            //                   ?.id ??
                                            //               "");
                                            //     }
                                            //   },
                                            //   child: data.product
                                            //               ?.isInWishlist ??
                                            //           false
                                            //       ? Icon(Icons.favorite,
                                            //           size: 22,
                                            //           color: Colors.red)
                                            //       : Icon(
                                            //           Icons.favorite_border,
                                            //           size: 22,
                                            //           color: Colors.black),
                                            // ),
                                            // Image.asset(
                                            //   'assets/block.png',
                                            //   width: w * 0.06,
                                            //   fit: BoxFit.contain,
                                            // ),
                                            // Image.asset(
                                            //   'assets/youtube.png',
                                            //   width: w * 0.06,
                                            //   fit: BoxFit.contain,
                                            // ),
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                              // SizedBox(height: h * 0.01),
                              // SingleChildScrollView(
                              //   scrollDirection: Axis.horizontal,
                              //   child: Row(
                              //     children: [
                              //       _buildTag('GENERIC'),
                              //       _buildTag('OTC'),
                              //       _buildTag('SPECIALTY'),
                              //       _buildTag('OT CONSUMABLE'),
                              //       _buildTag('LAB CONSUMABLE'),
                              //       _buildTag('FMCG', isActive: true),
                              //       _buildTag('PRO'),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        );
                      },
                      childCount: data.length,
                    ),
                  ),
                ],
              ),
            ),
          )
        : NoInternetWidget();
  }
}
