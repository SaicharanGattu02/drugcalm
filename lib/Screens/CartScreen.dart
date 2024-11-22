import 'package:cached_network_image/cached_network_image.dart';
import 'package:drugcalm/Screens/ApplyCoupon.dart';
import 'package:drugcalm/providers/CartProvider.dart';
import 'package:drugcalm/providers/ProductDetailsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/ShippingDetailsModel.dart';
import '../Services/UserApi.dart';
import '../Services/otherservices.dart';
import '../providers/ConnectivityProviders.dart';
import '../providers/ShippingDetailsProvider.dart';
import '../utils/CustomAppBar1.dart';
import '../utils/CustomSnackBar.dart';
import '../utils/constants.dart';
import 'AddressList.dart';
import 'OrderScreen.dart';
import 'ProductDetails.dart';
import 'SaltComposition.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  int _counter = 0;
  bool _isChecked = false;
  final spinkits = Spinkits1();
  String address = "";
  String order_value = "0";
  List<String> items = [];

  @override
  void initState() {
    Provider.of<ConnectivityProviders>(context, listen: false)
        .initConnectivity();
    GetCartList();
    super.initState();
  }

  Future<void> GetCartList() async {
    final cart_list_provider =
        Provider.of<CartProvider>(context, listen: false);
    cart_list_provider.fetchCartProducts();
    final shipping_provider =
        Provider.of<ShippingDetailsProvider>(context, listen: false);
    shipping_provider.fetchShippingDetails();
  }

  Future<void> PlacerOrderApi() async {
    await Userapi.placeOrder(order_value, address, items).then((data) => {
      if (data != null)
        {
          setState(() {
            if (data.settings?.success == 1) {
              CustomSnackBar.show(context, "Order Placed Successfully!");
              final cart_list_provider =
              Provider.of<CartProvider>(context, listen: false);
              cart_list_provider.cartList;
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrdersScreen(),
                  ));
            } else {
              CustomSnackBar.show(context, data.settings?.message ?? "");
            }
          })
        }
    });
  }

  @override
  void dispose() {
    Provider.of<ConnectivityProviders>(context, listen: false).dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> productData = [
    {
      'name': 'Dolo 250 Oral Suspension',
      'details': 'Bottle of 60 ml Oral Suspension',
      'quantity': '10S',
      'netPrice': '₹ 93.81',
      'mrp': '₹ 106.8',
      'scheme': '5+1',
      'margin': '16%',
      'ptr': '₹180',
      'dcpo': 'DCPO',
      'speciality': 'Spaciality',
      'coldBox': 'COLD BOX',
    },
  ];

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
                physics: AlwaysScrollableScrollPhysics(),
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
                      // Container(
                      //   padding: EdgeInsets.all(16),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(10)),
                      //       color: color1),
                      //   child: Row(
                      //     children: [
                      //       Image.asset(
                      //         "assets/join_membership.png",
                      //         width: 35,
                      //         height: 39,
                      //       ),
                      //       SizedBox(
                      //         width: 15,
                      //       ),
                      //       Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           text(context, "Join Membership to Save More.!",
                      //               14,
                      //               fontWeight: FontWeight.w400, color: color4),
                      //           text(context,
                      //               "Exclusive offers Designed for you.", 12,
                      //               fontWeight: FontWeight.w400, color: color4),
                      //         ],
                      //       )
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      Consumer<CartProvider>(
                          builder: (context, cartListProvider, child) {
                        final cart_list = cartListProvider.cartList;
                        final product_detail = Provider.of<ProductDetailsProvider>(context,listen: false);
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: cart_list.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var cartdata = cart_list[index];
                            // Add each item's ID to the items list
                            if (cartdata.id != null) {
                              items.add(cartdata.id ?? ""); // Add item ID to the list
                            }
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Productdetails(productid: product_detail.productData?.id??"",),
                                          ),
                                        );
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
                                              cartdata.product?.image ?? "",
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
                                                      cartdata.product?.name ??
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
                                                    cartdata.product?.subName ??
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
                                                  cartdata.product?.quantity
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
                                                cartdata.product?.netPrice
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
                                                cartdata.product?.mrp
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
                                                      cartdata.product?.margin
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
                                                    cartdata.product?.ptr
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
                        );
                      }),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // InkResponse(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => SaltComposition()));
                      //   },
                      //   child: container(
                      //       w: w,
                      //       padding: EdgeInsets.symmetric(
                      //           horizontal: 16, vertical: 8),
                      //       border: Border.all(color: color1, width: 1),
                      //       borderRadius: BorderRadius.circular(8),
                      //       context,
                      //       colors: color21,
                      //       child: Row(
                      //         children: [
                      //           Column(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               text(context, 'SALT Composition', 16,
                      //                   color: color1,
                      //                   fontWeight: FontWeight.w500,
                      //                   fontfamily: "Inter"),
                      //               SizedBox(
                      //                 height: h * 0.005,
                      //               ),
                      //               text(context, 'Paracetamol 650MG', 14,
                      //                   color: color11,
                      //                   fontWeight: FontWeight.w500,
                      //                   fontfamily: 'Inter'),
                      //             ],
                      //           ),
                      //           Spacer(),
                      //           Icon(
                      //             Icons.arrow_forward_ios_outlined,
                      //             size: 16,
                      //           )
                      //         ],
                      //       )),
                      // ),
                      // SizedBox(
                      //   height: h * 0.01,
                      // ),
                      // text(context, 'PROMO CODE:', 13,
                      //     fontfamily: 'Inter', fontWeight: FontWeight.w400),
                      // InkResponse(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => ApplyCoupon()));
                      //   },
                      //   child: container(
                      //       w: w,
                      //       margin: EdgeInsets.symmetric(vertical: 8),
                      //       border: Border.all(color: color22, width: 1),
                      //       padding: EdgeInsets.symmetric(
                      //           horizontal: 16, vertical: 8),
                      //       borderRadius: BorderRadius.circular(8),
                      //       context,
                      //       colors: color4,
                      //       child: Row(
                      //         children: [
                      //           Image.asset(
                      //             'assets/promocode.png',
                      //             fit: BoxFit.contain,
                      //             width: w * 0.04,
                      //           ),
                      //           SizedBox(
                      //             width: w * 0.01,
                      //           ),
                      //           text(context, 'Apply Coupon', 16,
                      //               color: color18,
                      //               fontWeight: FontWeight.w400,
                      //               fontfamily: 'Inter'),
                      //           Spacer(),
                      //           Icon(
                      //             Icons.arrow_forward_ios_outlined,
                      //             size: 16,
                      //           )
                      //         ],
                      //       )),
                      // ),
                      // text(context, 'Coupons Available for you', 16,
                      //     color: color11,
                      //     fontWeight: FontWeight.w500,
                      //     fontfamily: 'Inter'),
                      // SizedBox(
                      //   height: h * 0.01,
                      // ),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     children: [
                      //       Image.asset(
                      //         'assets/vochar.png',
                      //         fit: BoxFit.contain,
                      //         height: h * 0.12,
                      //       ),
                      //       SizedBox(
                      //         width: w * 0.01,
                      //       ),
                      //       Image.asset(
                      //         'assets/vochar (2).png',
                      //         fit: BoxFit.contain,
                      //         height: h * 0.12,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // InkResponse(
                      //   onTap: () {
                      //     // Navigator.push(context,
                      //     // MaterialPageRoute(builder: (context) => SaltComposition()));
                      //   },
                      //   child: container(
                      //       w: w,
                      //       margin: EdgeInsets.symmetric(vertical: 8),
                      //       border: Border.all(color: color22, width: 1),
                      //       padding: EdgeInsets.only(
                      //           left: 16, right: 16, top: 16, bottom: 16),
                      //       borderRadius: BorderRadius.circular(8),
                      //       context,
                      //       colors: color4,
                      //       child: Row(
                      //         children: [
                      //           Column(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               text(context, 'Mediqex Membership', 18,
                      //                   color: color18,
                      //                   fontWeight: FontWeight.w400,
                      //                   fontfamily: 'Inter'),
                      //               SizedBox(
                      //                 width: w * 0.01,
                      //               ),
                      //               text(
                      //                   context,
                      //                   'Get flat 25% off from your Mediqex Wallet',
                      //                   12,
                      //                   color: color,
                      //                   fontWeight: FontWeight.w400,
                      //                   fontfamily: 'Inter'),
                      //             ],
                      //           ),
                      //           Spacer(),
                      //           Icon(
                      //             Icons.arrow_forward_ios_outlined,
                      //             size: 18,
                      //           )
                      //         ],
                      //       )),
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     setState(() {
                      //       _isChecked = !_isChecked;
                      //     });
                      //   },
                      //   child: Row(
                      //     children: [
                      //       InkWell(
                      //           onTap: () {
                      //             setState(() {
                      //               _isChecked = !_isChecked;
                      //             });
                      //           },
                      //           child: Checkbox(
                      //               activeColor: color1,
                      //               side: BorderSide(
                      //                   color: color11.withOpacity(0.25)),
                      //               splashRadius: 30,
                      //               value: _isChecked,
                      //               onChanged: (bool? newvalue) {
                      //                 setState(() {
                      //                   _isChecked = !_isChecked;
                      //                 });
                      //               })),
                      //       SizedBox(
                      //         width: w * 0.01,
                      //       ),
                      //       text(context, '₹1 Donate', 18,
                      //           color: color18,
                      //           fontWeight: FontWeight.w400,
                      //           fontfamily: 'Inter'),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: h * 0.01),
                      Consumer<ShippingDetailsProvider>(
                          builder: (context, shippingProvider, child) {
                        final shipping_data = shippingProvider.shippingData;
                        if (shipping_data?.address != null) {
                          if (shipping_data?.address is Address) {
                            address = shipping_data?.address?.id ?? "";
                          }
                        }
                        // Handle null or invalid shipping_data cases
                        order_value = shipping_data?.totalAmount.toString() ?? "";
                        return Column(
                          children: [
                        if (address.isNotEmpty &&
                        address != "No address found") ...[
                            Row(
                              children: [
                                Text(
                                  "Delivery To",
                                  style: TextStyle(
                                    color: Color(0xff110B0F),
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    height: 28 / 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Spacer(),
                                InkResponse(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddressListScreen(),
                                        ));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 1),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: Color(0xff0AA44F), width: 1),
                                    ),
                                    child: Text(
                                      "Change",
                                      style: TextStyle(
                                        color: Color(0xff0AA44F),
                                        fontFamily: 'Inter',
                                        fontSize: 13,
                                        height: 28 / 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: h * 0.01),
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
                                        shipping_data?.address?.fullName ?? "",
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
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          shipping_data?.address?.addressType ??
                                              "",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.location_on_rounded,
                                          color: color1, size: 18),
                                      SizedBox(width: w * 0.02),
                                      Flexible(
                                        child: Text(
                                          "Address\n ${shipping_data?.address?.address}",
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
                            ],
                            SizedBox(
                              height: h * 0.01,
                            ),
                            container(context,
                                colors: color4,
                                borderRadius: BorderRadius.circular(8),
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16),
                                w: w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(context, 'Payment Details', 13,
                                        color: color23,
                                        fontWeight: FontWeight.w400),
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
                                        text(
                                            context,
                                            '₹${shipping_data?.totalAmount.toString()}',
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
                                            "₹${shipping_data?.shippingFee.toString()}",
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
                                            "₹${shipping_data?.deliveryCharges.toString()}",
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
                                            "₹${shipping_data?.handlingCharges.toString()}",
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
                                            "₹${shipping_data?.discount.toString()}",
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
                                            "₹${shipping_data?.totalAmount.toString()}",
                                            15,
                                            fontWeight: FontWeight.w500,
                                            color: color11)
                                      ],
                                    ),
                                  ],
                                )),
                          ],
                        );
                      }),

                      SizedBox(
                        height: h * 0.02,
                      ),
                      // Container(
                      //   width: w,
                      //   padding: const EdgeInsets.all(16),
                      //   decoration: BoxDecoration(
                      //       color: Color(0xffffffff),
                      //       borderRadius: BorderRadius.circular(8)),
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         children: [
                      //           text(context, 'Similar Products Schemes', 16,
                      //               fontfamily: "Inter",
                      //               fontWeight: FontWeight.w500),
                      //         ],
                      //       ),
                      //       SizedBox(
                      //         height: h * 0.01,
                      //       ),
                      //       Container(
                      //         child: SingleChildScrollView(
                      //           scrollDirection: Axis.horizontal,
                      //           child: Row(
                      //             children: List.generate(
                      //               4,
                      //               (index) {
                      //                 return Container(
                      //                   width: w * 0.6,
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
                      //                               fontWeight: FontWeight.w500,
                      //                               color: color1),
                      //                           SizedBox(
                      //                             height: h * 0.005,
                      //                           ),
                      //                           RatingWidget(
                      //                             initialRating: 4.0,
                      //                           ),
                      //                           SizedBox(
                      //                             height: h * 0.005,
                      //                           ),
                      //                           Row(
                      //                             children: [
                      //                               text(context, 'Net Price:',
                      //                                   12,
                      //                                   fontWeight:
                      //                                       FontWeight.w400,
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
                      //                                   fontWeight:
                      //                                       FontWeight.w400,
                      //                                   color: color),
                      //                               SizedBox(
                      //                                 width: w * 0.01,
                      //                               ),
                      //                               text(context, '₹ 106.8', 12,
                      //                                   fontWeight:
                      //                                       FontWeight.w400,
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
                      //                                 width: w * 0.01,
                      //                               ),
                      //                               text(context, '12%', 14,
                      //                                   color: color1),
                      //                               SizedBox(
                      //                                 width: w * 0.04,
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
                      //                                 width: w * 0.001,
                      //                               ),
                      //                               text(
                      //                                 context,
                      //                                 '₹ 106.8',
                      //                                 fontWeight:
                      //                                     FontWeight.w700,
                      //                                 11,
                      //                               ),
                      //                             ],
                      //                           ),
                      //                           SizedBox(
                      //                             height: h * 0.02,
                      //                           ),
                      //                           Row(
                      //                             children: [
                      //                               Expanded(
                      //                                 child: containertext1(
                      //                                     context,
                      //                                     'ADD TO CART',
                      //                                     onTap: () {}),
                      //                               ),
                      //                               SizedBox(
                      //                                 width: w * 0.02,
                      //                               ),
                      //                               Container(
                      //                                 height: 40,
                      //                                 padding:
                      //                                     EdgeInsets.all(10),
                      //                                 decoration: BoxDecoration(
                      //                                     border: Border.all(
                      //                                         color: color11,
                      //                                         width: 2),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(8)),
                      //                                 child: Image.asset(
                      //                                   'assets/favoutline.png',
                      //                                   width: 20,
                      //                                   height: 18,
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
                    ],
                  ),
                )),
            bottomNavigationBar: Consumer<ShippingDetailsProvider>(
                builder: (context, shippingProvider, child) {
              final shipping_data = shippingProvider.shippingData;
              return SafeArea(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 15,top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Total: ",
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontFamily: 'RozhaOne',
                              fontSize: 18,
                              height: 24 / 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "₹${shipping_data?.totalAmount.toString() ?? ""}",
                            style: TextStyle(
                              color: Color(0xff617C9D),
                              fontFamily: 'RozhaOne',
                              fontSize: 20,
                              height: 24 / 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          if (address.isNotEmpty &&
                              address != "No address found") {
                            PlacerOrderApi();
                          } else {
                            CustomSnackBar.show(
                                context, "Please Select address!");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddressListScreen(),
                                ));
                          }
                        },
                        child: Container(
                          width: w * 0.45,
                          height: h * 0.05,
                          // padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color:color1,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              "PLACE ORDER",
                              style: TextStyle(
                                color:  color4,
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
                    ],
                  ),
                ),
              );
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
