import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:drugcalm/Screens/CartScreen.dart';
import 'package:drugcalm/Screens/ProductDetails.dart';
import 'package:drugcalm/Services/UserApi.dart';
import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/ProductsListModel.dart';
import '../Services/otherservices.dart';
import '../others/Banners.dart';
import '../providers/CartProvider.dart';
import '../providers/ConnectivityProviders.dart';
import '../providers/ProductListProvider.dart';
import '../providers/WishlistProvider.dart';
import '../utils/CustomSnackBar.dart';
import '../utils/constants.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  int currentindex = 0;
  int _counter = 0;
  bool _isChecked = false;
  final spinkits = Spinkits1();
  @override
  void initState() {
    Provider.of<ConnectivityProviders>(context, listen: false)
        .initConnectivity();
    GetProductList();
    super.initState();
  }

  Future<void> GetProductList() async {
    final products_list_provider =
        Provider.of<ProductListProvider>(context, listen: false);
    products_list_provider.fetchProductsList();
  }

  @override
  void dispose() {
    Provider.of<ConnectivityProviders>(context, listen: false).dispose();
    super.dispose();
  }

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
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var connectiVityStatus = Provider.of<ConnectivityProviders>(context);
    return (connectiVityStatus.isDeviceConnected == "ConnectivityResult.wifi" ||
            connectiVityStatus.isDeviceConnected == "ConnectivityResult.mobile")
        ? Scaffold(
            appBar: CustomAppBar1(title: 'DOLO', actions: [Container()]),
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
                  Consumer<ProductListProvider>(
                    builder: (context, productListProvider, child) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final product_list =
                                productListProvider.productList;

                            // If still loading, show the loading indicator
                            if (productListProvider.isLoading) {
                              return Center(
                                child: Column(
                                  children: [
                                    SizedBox(height: w * 0.6),
                                    CircularProgressIndicator(
                                      color: Color(0xffE7C6A0),
                                    ),
                                  ],
                                ),
                              );
                            }

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
                            var product = product_list[index];
                            final cart_provider = Provider.of<CartProvider>(context, listen: false);

                            // Return the InkResponse for each product item
                            return Container(
                              width: w,
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, top: 16, bottom: 16),
                              margin:
                                  EdgeInsets.only(left: 16, right: 16, top: 16),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: InkResponse(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Productdetails(productid: product.id.toString(),),
                                                  ));
                                            },
                                            child: Container(
                                              constraints:
                                                  BoxConstraints.expand(),
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/water_mark.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl: product.image ?? "",
                                                fit: BoxFit.cover,
                                                placeholder:
                                                    (BuildContext context,
                                                        String url) {
                                                  return Center(
                                                    child: spinkits
                                                        .getSpinningLinespinkit(),
                                                  );
                                                },
                                                errorWidget:
                                                    (BuildContext context,
                                                        String url,
                                                        dynamic error) {
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
                                            constraints:
                                                BoxConstraints.expand(),
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
                                                              Productdetails(productid: product.id.toString(),),
                                                        ));
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      if (product.bestSeller ??
                                                          false) ...[
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal: 4,
                                                                  vertical: 2),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                color13, // Your color
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                          ),
                                                          child: Text(
                                                            'Best Seller',
                                                            style: TextStyle(
                                                              fontSize: 6,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  color4, // Your color
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                      Text(
                                                        product.name ?? "",
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
                                                      Text(
                                                        product.subName ?? "",
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
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  color, // Your color
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              width: w * 0.01),
                                                          Text(
                                                            product.net_price ??
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
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  color, // Your color
                                                            ),
                                                          ),
                                                          Text(
                                                            product.mrp ?? "",
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
                                                      SizedBox(
                                                          height: h * 0.008),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        4),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xffFEF6F5), // Your color
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  'MARGIN',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color:
                                                                        color11, // Your color
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width: w *
                                                                        0.01),
                                                                Text(
                                                                  product.margin
                                                                          .toString() ??
                                                                      "",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        10,
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
                                                          SizedBox(
                                                              width: w * 0.01),
                                                          Image.asset(
                                                            'assets/about.png',
                                                            color:
                                                                color1, // Your color
                                                            width: w * 0.03,
                                                          ),
                                                          SizedBox(
                                                              width: w * 0.01),
                                                          Text(
                                                            product.ptr ?? "",
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
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    // Quantity Selector
                                                    if (product.quantity == 0) ...[
                                                      InkResponse(
                                                        onTap: () async {
                                                          var msg = await cart_provider.addToCartApi(product.id ?? "", "1");

                                                          // After adding to the cart, update the product quantity in ProductListProvider
                                                          if (msg != null) {
                                                            ProductListProvider productListProvider = Provider.of<ProductListProvider>(context, listen: false);

                                                            // Ensure you're using the correct 'product.id' here, not 'product' itself.
                                                            String productId = product.id ?? '';  // Store the product ID in a local variable

                                                            // Safely find the product in the list (or return a default product if not found)
                                                            var Product = productListProvider.productList.firstWhere(
                                                                    (p) => p.id == productId,  // Use the local 'productId' variable
                                                                orElse: () => ProductsList(id: '-1')  // Return a default product if not found
                                                            );

                                                            // Ensure the product is found before updating
                                                            if (product.id != '-1') {
                                                              product.quantity = (product.quantity ?? 0) + 1;  // Safe addition
                                                              productListProvider.notifyListeners();  // Notify listeners to update the UI
                                                            }
                                                          }
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets.symmetric(vertical: 5),
                                                          width: w * 0.3,
                                                          decoration: BoxDecoration(
                                                            color: color1,
                                                            borderRadius: BorderRadius.circular(4),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'ADD',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.w400,
                                                                color: color4,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ] else ...[
                                                      // Handle the other case when the product quantity is more than 0
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          color: color1,
                                                          borderRadius: BorderRadius.circular(4),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            // Decrease quantity button
                                                            GestureDetector(
                                                              child: Container(
                                                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                                child: Icon(Icons.remove, color: color4, size: 20),
                                                              ),
                                                              onTap: () async {
                                                                if ((product.quantity ?? 0) > 0) {
                                                                  // Decrease the quantity
                                                                  int newQuantity = (product.quantity ?? 0) - 1;

                                                                  // Optimistically update the quantity in the cart provider
                                                                  cart_provider.optimisticUpdateCartQuantity(
                                                                    product.id ?? "",
                                                                    newQuantity,
                                                                  );

                                                                  // Update the quantity in the server (API call)
                                                                  var res = await cart_provider.updateCartApi(
                                                                    product.id ?? "",
                                                                    newQuantity.toString(),
                                                                  );

                                                                  // Optionally update the product list immediately
                                                                  // Notify listeners to update the UI
                                                                  if(res!=0){
                                                                    productListProvider.productList.forEach((p) {
                                                                      if (p.id == product.id) {
                                                                        p.quantity = newQuantity; // Directly update the product's quantity
                                                                      }
                                                                    });

                                                                    // Notify the listeners of the product list provider to refresh the UI
                                                                    productListProvider.notifyListeners();
                                                                  }
                                                                }
                                                              },
                                                            ),

                                                            // Animated counter to display the updated quantity
                                                            AnimatedFlipCounter(
                                                              value: product.quantity ?? 0,
                                                              textStyle: TextStyle(fontSize: 15, color: color4, fontWeight: FontWeight.bold),
                                                            ),

                                                            // Increase quantity button
                                                            GestureDetector(
                                                              child: Container(
                                                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                                child: Icon(Icons.add, color: color4, size: 20),
                                                              ),
                                                              onTap: () async {
                                                                int newQuantity = (product.quantity ?? 0) + 1;

                                                                // Optimistically update the quantity in the cart provider
                                                                cart_provider.optimisticUpdateCartQuantity(
                                                                  product.id ?? "",
                                                                  newQuantity,
                                                                );

                                                                // Update the quantity in the server (API call)
                                                                var res = await cart_provider.updateCartApi(
                                                                  product.id ?? "",
                                                                  newQuantity.toString(),
                                                                );

                                                                // Optionally update the product list immediately
                                                                // Notify listeners to update the UI
                                                                productListProvider.productList.forEach((p) {
                                                                  if (p.id == product.id) {
                                                                    p.quantity = newQuantity; // Directly update the product's quantity
                                                                  }
                                                                });

                                                                // Notify the listeners of the product list provider to refresh the UI
                                                                productListProvider.notifyListeners();
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                    GestureDetector(
                                                      onTap: () {
                                                        if (product
                                                                .isInWishlist ??
                                                            false) {
                                                          context
                                                              .read<
                                                                  WishlistProvider>()
                                                              .removeFromWishlist(
                                                                  product.id ??
                                                                      "");
                                                        } else {
                                                          context
                                                              .read<
                                                                  WishlistProvider>()
                                                              .addToWishlist(
                                                                  product.id ??
                                                                      "");
                                                        }
                                                      },
                                                      child: product
                                                                  .isInWishlist ??
                                                              false
                                                          ? Icon(Icons.favorite,
                                                              size: 22,
                                                              color: Colors.red)
                                                          : Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              size: 22,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    // Image.asset(
                                                    //   'assets/block.png',
                                                    //   width: w * 0.06,
                                                    //   fit: BoxFit.contain,
                                                    // ),
                                                    Image.asset(
                                                      'assets/youtube.png',
                                                      width: w * 0.06,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ],
                                                ),
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
                          childCount: productListProvider.productList.length,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // bottomNavigationBar: Column(
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

  Widget _buildTag(String label, {bool isActive = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: isActive ? color4 : color15.withOpacity(0.2), // Add your color
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: color15, // Add your color
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          color: color, // Add your color
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
