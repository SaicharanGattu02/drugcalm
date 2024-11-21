import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:drugcalm/Screens/CartScreen.dart';
import 'package:drugcalm/Screens/ProductDetails.dart';
import 'package:drugcalm/providers/WishlistProvider.dart';
import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../others/Banners.dart';
import '../utils/CustomSnackBar.dart';
import '../utils/constants.dart';

class Wishlistscreen extends StatefulWidget {
  const Wishlistscreen({super.key});

  @override
  State<Wishlistscreen> createState() => _WishlistscreenState();
}

class _WishlistscreenState extends State<Wishlistscreen> {
  int currentindex = 0;
  int _counter = 0;
  bool _isChecked = false;
  final spinkits = Spinkits1();

  int _quantity = 1;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  void initState() {
    GetWishlistList();
    super.initState();
  }

  Future<void> GetWishlistList() async {
    final products_list_provider =
    Provider.of<WishlistProvider>(context, listen: false);
    products_list_provider.fetchWishList();
  }


  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar1(title: 'MY WISHLIST', actions: [Container()]),
      body:  Container(
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
            Consumer<WishlistProvider>(
              builder: (context, wishlistListProvider, child) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final product_list = wishlistListProvider.wishlistProducts;

                      // If still loading, show the loading indicator
                      // if (wishlistListProvider.) {
                      //   return Center(
                      //     child: Column(
                      //       children: [
                      //         SizedBox(height: w * 0.6),
                      //         CircularProgressIndicator(
                      //           color: Color(0xffE7C6A0),
                      //         ),
                      //       ],
                      //     ),
                      //   );
                      // }

                      // If the product list is empty, show "No Product" message
                      if (product_list.isEmpty) {
                        return Center(
                          child: Column(
                            children: [
                              SizedBox(height: w * 0.2),
                              Image.asset(
                                'assets/no_product.png',
                                width: 160,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 30),
                              Text(
                                "No Product",
                                style: TextStyle(
                                  color: Color(0xffCAA16C),
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

                      // Get the product at the current index
                      var data = product_list[index];

                      // Return the InkResponse for each product item
                      return InkResponse(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Productdetails(),
                            ),
                          );
                        },
                        child: Container(
                          width: w,
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 16, bottom: 16),
                          margin: EdgeInsets.only(
                              left: 16, right: 16, top: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: color12, // Add your color
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: w * 0.28,
                                    height: 140,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/water_mark.png',
                                          ),
                                          fit: BoxFit.cover,
                                        )),
                                    child: CachedNetworkImage(
                                      imageUrl: data.product?.image ?? "",
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
                                  SizedBox(width: w * 0.04),
                                  Container(
                                    width: w * 0.5,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 2),
                                          decoration: BoxDecoration(
                                            color:
                                            color13, // Add your color
                                            borderRadius:
                                            BorderRadius.circular(
                                                100),
                                          ),
                                          child: Text(
                                            'Best Seller',
                                            style: TextStyle(
                                              fontSize: 6,
                                              fontWeight: FontWeight.w500,
                                              color:
                                              color4, // Add your color
                                            ),
                                          ),
                                        ),
                                        Text(
                                          data.product?.name ?? "",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color:
                                            color11, // Add your color
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          data.product?.subName ?? "",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color:
                                            color, // Add your color
                                          ),
                                        ),
                                        RatingWidget(initialRating: 4),
                                        Row(
                                          children: [
                                            Text(
                                              'Net Price:',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight:
                                                FontWeight.w400,
                                                color:
                                                color, // Add your color
                                              ),
                                            ),
                                            SizedBox(width: w * 0.01),
                                            Text(
                                              data.product?.net_price ?? "",
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
                                                color, // Add your color
                                              ),
                                            ),
                                            Text(
                                              data.product?.mrp ?? "",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color:
                                                color1, // Add your color
                                              ),
                                            ),
                                            SizedBox(height: h * 0.01),
                                          ],
                                        ),
                                        SizedBox(height: h * 0.008),
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 4),
                                              decoration: BoxDecoration(
                                                color: Color(
                                                    0xffFEF6F5), // Add your color
                                                borderRadius:
                                                BorderRadius.circular(
                                                    4),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'MARGIN',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                      color11, // Add your color
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: w * 0.01),
                                                  Text(
                                                    data.product?.margin
                                                        .toString() ??
                                                        "",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                      color1, // Add your color
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
                                                color11, // Add your color
                                              ),
                                            ),
                                            SizedBox(width: w * 0.01),
                                            Image.asset(
                                              'assets/about.png',
                                              color:
                                              color1, // Add your color
                                              width: w * 0.03,
                                            ),
                                            SizedBox(width: w * 0.01),
                                            Text(
                                              data.product?.ptr ?? "",
                                              style: TextStyle(
                                                fontSize: 10,
                                                color:
                                                color11, // Add your color
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: h * 0.01),
                                        Row(
                                          children: [
                                            // Container(
                                            //   padding: EdgeInsets.symmetric(vertical: 4),
                                            //   width: w * 0.2,
                                            //   decoration: BoxDecoration(
                                            //     color: color1, // Add your color
                                            //     borderRadius: BorderRadius.circular(4),
                                            //   ),
                                            //   child: Center(
                                            //     child: Text(
                                            //       'ADD',
                                            //       style: TextStyle(
                                            //         fontSize: 12,
                                            //         fontWeight: FontWeight.w400,
                                            //         color: color4, // Add your color
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),

                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                color1, // Add your color
                                                borderRadius:
                                                BorderRadius.circular(
                                                    4),
                                              ),
                                              child: Row(
                                                mainAxisSize:
                                                MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  // "-" button to decrease quantity
                                                  GestureDetector(
                                                    child: Container(
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 5),
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: color4,
                                                          size: 20,
                                                        )),
                                                    onTap: _decrement,
                                                  ),
                                                  // Animated counter
                                                  AnimatedFlipCounter(
                                                    value: _quantity,
                                                    textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: color4,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  ),
                                                  // "+" button to increase quantity
                                                  GestureDetector(
                                                    child: Container(
                                                      padding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10,
                                                          vertical: 5),
                                                      child: Icon(
                                                        Icons.add,
                                                        color: color4,
                                                        size: 20,
                                                      ),
                                                    ),
                                                    onTap: _increment,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            InkResponse(
                                              onTap: () {
                                                if (data.product?.isInWishlist ??
                                                    false) {
                                                  // Remove from wishlist
                                                  context
                                                      .read<
                                                      WishlistProvider>()
                                                      .removeFromWishlist(
                                                      data.product?.id ??
                                                          "");
                                                } else {
                                                  // Add to wishlist
                                                  context
                                                      .read<
                                                      WishlistProvider>()
                                                      .addToWishlist(
                                                      data.product?.id ??
                                                          "");
                                                }
                                              },
                                              child: data.product?.isInWishlist ??
                                                  false
                                                  ? Icon(
                                                Icons
                                                    .favorite, // Filled heart icon when item is in wishlist
                                                size: 18,
                                                color: Colors
                                                    .red, // Red color for filled icon
                                              )
                                                  : Icon(
                                                Icons
                                                    .favorite_border, // Outline heart icon when item is NOT in wishlist
                                                size: 18,
                                                color: Colors
                                                    .black, // Black color for outline icon
                                              ),
                                            ),
                                            Spacer(),
                                            Image.asset(
                                              'assets/block.png',
                                              width: w * 0.06,
                                              fit: BoxFit.contain,
                                            ),
                                            Spacer(),
                                            Image.asset(
                                              'assets/youtube.png',
                                              width: w * 0.08,
                                              fit: BoxFit.contain,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
                        ),
                      );
                    },
                    childCount: wishlistListProvider.wishlistProducts.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}
