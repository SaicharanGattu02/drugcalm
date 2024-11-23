import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:drugcalm/Screens/OrderDetailsScreen.dart';
import 'package:drugcalm/Screens/OrderSummary.dart';
import 'package:drugcalm/Screens/ReturnOrderScreen.dart';
import 'package:drugcalm/Services/UserApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/OrdersListModel.dart';
import '../Services/otherservices.dart';
import '../providers/ConnectivityProviders.dart';
import '../utils/CustomAppBar1.dart';
import '../utils/CustomSnackBar.dart';
import '../utils/constants.dart';

class OrdersListScreen extends StatefulWidget {
  const OrdersListScreen({super.key});

  @override
  State<OrdersListScreen> createState() => _OrdersListScreenState();
}

class _OrdersListScreenState extends State<OrdersListScreen> {
  String selectedOption = "All";
  final List<String> dropdownOptions = ["All", "Live Orders", "Past Orders"];

  final Map<String, String> sortOptionToValue = {
    "All": "all",
    "Live Orders": "live_orders",
    "Past Orders": "live_orders",
  };

  bool isLoading = false;

  @override
  void initState() {
    Provider.of<ConnectivityProviders>(context, listen: false)
        .initConnectivity();
    getOrdersList("all");
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<ConnectivityProviders>(context, listen: false).dispose();
    super.dispose();
  }

  List<Data> orders_list = [];

  Future<void> getOrdersList(String sortOptionToValue) async {
    var res = await Userapi.getOrdersListapi(sortOptionToValue);
    if (res != null) {
      setState(() {
        if (res.settings?.success == 1) {
          orders_list = res.data ?? [];
          // filteredOrders = res.data ?? [];
          isLoading = false; // Hide loader if error occurs
        } else {
          CustomSnackBar.show(context, res.settings?.message ?? "");
          isLoading = false;
        }
      });
    }
  }

  final spinkits = Spinkits1();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    var connectiVityStatus = Provider.of<ConnectivityProviders>(context);
    return (connectiVityStatus.isDeviceConnected == "ConnectivityResult.wifi" ||
            connectiVityStatus.isDeviceConnected == "ConnectivityResult.mobile")
        ? Scaffold(
            appBar: CustomAppBar1(
              title: 'MY ORDERS',
              actions: [Container()],
            ),
            body: Container(
              width: w,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/Drug Clam Background.png',
                      ),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: w * 0.6,
                        height: 40,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            items: dropdownOptions.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Row(
                                  children: [
                                    Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            value: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value!;
                                print("Selected Option:${selectedOption}");
                                String sortValue =
                                    sortOptionToValue[selectedOption]!;
                                getOrdersList(sortValue);
                                print("sortOptionToValue:${sortValue}");
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 45,
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color(0xffffffff),
                              ),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 25,
                              ),
                              iconSize: 14,
                              iconEnabledColor: Colors.black,
                              iconDisabledColor: Colors.black,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all(6),
                                thumbVisibility:
                                    MaterialStateProperty.all(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                      ),
                      // Second Container with Calendar Icon
                      Container(
                        width: w * 0.12,
                        height: 40,
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/calendar_month.png',
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      // Third Container with Filter Icon
                      Container(
                        width: w * 0.12,
                        height: 40,
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/filter_alt.png',
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: orders_list.length,
                      itemBuilder: (BuildContext context, int index) {
                        final OrderListData = orders_list[index];
                        return
                          InkResponse(onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrderDetailScreen(id: "")));
                          },
                            child: container(context,
                              colors: color4,
                              borderRadius: BorderRadius.circular(8),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(bottom: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/order.png',
                                        fit: BoxFit.contain,
                                        width: w * 0.05,
                                      ),
                                      SizedBox(
                                        width: w * 0.01,
                                      ),
                                      text(context, 'Order ID :', 11,
                                          color: color1,
                                          fontfamily: "Poppins",
                                          fontWeight: FontWeight.w400),
                                      SizedBox(
                                        width: w * 0.01,
                                      ),
                                      text(
                                          context, '${OrderListData.orderId}', 10,
                                          color: color11,
                                          fontWeight: FontWeight.w400,
                                          fontfamily: "Poppins"),
                                      SizedBox(
                                        width: w * 0.03,
                                      ),
                                      if (selectedOption == "Live Orders") ...[
                                        Image.asset(
                                          'assets/calendar_month.png',
                                          fit: BoxFit.contain,
                                          width: w * 0.05,
                                        ),
                                        SizedBox(
                                          width: w * 0.01,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            text(context, 'Expected:', 11,
                                                color: color1,
                                                fontfamily: "Poppins",
                                                fontWeight: FontWeight.w400),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            text(context, '20 Dec 2024', 10,
                                                color: color11,
                                                fontfamily: "Poppins",
                                                fontWeight: FontWeight.w400),
                                          ],
                                        ),
                                      ] else ...[
                                        Spacer(),
                                        InkResponse(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                                color: color1),
                                            child: text(context, 'Reorder', 10,
                                                color: color4,
                                                fontfamily: "Poppins",
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ]
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
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Container(
                                          //   width: 40,
                                          //   height: 40,
                                          //   child: Image.asset(
                                          //     'assets/dolo250 Oral.png.png',
                                          //     fit: BoxFit.cover,
                                          //   ),
                                          // ),

                                          SizedBox(
                                            width: w * 0.02,
                                          ),
                                          Container(
                                              width: w * 0.8,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      text(
                                                          context,
                                                          fontfamily: 'Poppins',
                                                          'Order Value :',
                                                          13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          textAlign:
                                                              TextAlign.start),
                                                      text(
                                                          context,
                                                          fontfamily: 'Poppins',
                                                          ' ₹ ${OrderListData.orderValue.toString()}',
                                                          15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          textAlign:
                                                              TextAlign.start),
                                                      Spacer(),
                                                      // text(
                                                      //     context,
                                                      //     fontfamily: 'Poppins',
                                                      //     'Created At : ',
                                                      //     13,
                                                      //     fontWeight:
                                                      //         FontWeight.w500,
                                                      //     textAlign:
                                                      //         TextAlign.start),
                                                      text(
                                                        context,
                                                        fontfamily: 'Poppins',
                                                        OrderListData.createdAt ??
                                                            "",
                                                        15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ],
                                                  ),
                                                  SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        children: [
                                                          if (OrderListData
                                                                  .image !=
                                                              null)
                                                            for (int i = 0;
                                                                i <
                                                                        OrderListData
                                                                            .image!
                                                                            .length &&
                                                                    i < 2;
                                                                i++) //
                                                              Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(10),
                                                                margin: EdgeInsets
                                                                    .all(10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  color: color1
                                                                      .withOpacity(
                                                                          0.1),
                                                                ),
                                                                width: 80,
                                                                height: 80,
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl: OrderListData
                                                                          .image![
                                                                      i], // Access the individual image URL
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  placeholder:
                                                                      (BuildContext
                                                                              context,
                                                                          String
                                                                              url) {
                                                                    return Center(
                                                                      child: spinkits
                                                                          .getSpinningLinespinkit(),
                                                                    );
                                                                  },
                                                                  errorWidget:
                                                                      (BuildContext
                                                                              context,
                                                                          String
                                                                              url,
                                                                          dynamic
                                                                              error) {
                                                                    return Icon(
                                                                        Icons
                                                                            .error);
                                                                  },
                                                                ),
                                                              ),
                                                          // If there are more than 3 images, show the +count
                                                          if (OrderListData
                                                                      .image !=
                                                                  null &&
                                                              OrderListData.image!
                                                                      .length >
                                                                  3)
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right: 8.0),
                                                              child: Container(
                                                                
                                                                width: 80,
                                                                height: 80,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            4),
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: color1.withOpacity(0.1)),
                                                                child: Center(
                                                                  child: Text(
                                                                    '+${OrderListData.image!.length - 3} more',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color:
                                                                            color1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      )),
                                                  if (selectedOption ==
                                                      "Live Orders") ...[
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        text(context, 'Return :',
                                                            12,
                                                            fontfamily: "Poppins",
                                                            color: color,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            textAlign:
                                                                TextAlign.right),
                                                        text(
                                                            context,
                                                            'Eligible through 18 September 2024 ',
                                                            10,
                                                            fontfamily: "Inter",
                                                            color: color1,
                                                            textAlign:
                                                                TextAlign.right,
                                                            fontWeight:
                                                                FontWeight.w500),
                                                      ],
                                                    ),
                                                  ],
                                                  if (selectedOption ==
                                                      "Past Orders") ...[
                                                    Row(
                                                      children: [
                                                        text(
                                                          context,
                                                          'Expiry Date : ',
                                                          12,
                                                          color:
                                                              Color(0xff617C9D),
                                                          fontfamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        text(context, ' Dec-2025',
                                                            14,
                                                            color: color11,
                                                            fontfamily: "Poppins",
                                                            fontWeight:
                                                                FontWeight.w500),
                                                      ],
                                                    ),
                                                  ],
                                                ],
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: w * 0.055,
                                      ),
                                      if (selectedOption == "Live Orders") ...[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkResponse(
                                              onTap: () {},
                                              child: Expanded(
                                                child: container(
                                                    w: w * 0.4,
                                                    context,
                                                    borderRadius:
                                                        BorderRadius.circular(6),
                                                    border: Border.all(
                                                        color: Color(0xff617C9D),
                                                        width: 1),
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 8),
                                                    child: Center(
                                                      child: text(
                                                          context, 'CANCEL', 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xff617C9D)),
                                                    )),
                                              ),
                                            ),
                                            Spacer(),
                                            InkResponse(
                                              onTap: () {},
                                              child: Expanded(
                                                child: container(
                                                    w: w * 0.4,
                                                    context,
                                                    borderRadius:
                                                        BorderRadius.circular(6),
                                                    border: Border.all(
                                                        color: color1, width: 1),
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 8),
                                                    child: Center(
                                                      child: text(
                                                          context, 'TRACK', 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: color1),
                                                    )),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                      if (selectedOption == "Past Orders") ...[
                                        Divider(
                                          height: 1,
                                          color: color9,
                                        ),
                                        SizedBox(
                                          height: w * 0.05,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkResponse(
                                              onTap: () {
                                                // Cancel button logic
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  border: Border.all(
                                                      color: color1, width: 1),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                    vertical:
                                                        8), // Adjust padding to fit
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    // Icon(Icons.cancel, color: color1, size: 14), // Adjust icon size
                                                    SizedBox(width: 4),
                                                    Text(
                                                      'CANCEL',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: color1),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                            InkResponse(
                                              onTap: () {
                                                // Refill button logic
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  border: Border.all(
                                                      color: color2, width: 1),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16, vertical: 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    // Icon(Icons.refresh, color: color1, size: 14),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      'REFILL',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: color1),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                            InkResponse(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Returnorderscreen(),
                                                    ));
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  border: Border.all(
                                                      color: color2, width: 1),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16, vertical: 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    // Icon(Icons.undo, color: color1, size: 14),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      'RETURN',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: color1),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                            // Help Button
                                            InkResponse(
                                              onTap: () {
                                                // Help button logic
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  border: Border.all(
                                                      color: color13, width: 1),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16, vertical: 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    // Icon(Icons.help_outline, color: color1, size: 14),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      'HELP',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: color1),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: w * 0.03,
                                        ),
                                      ],
                                    ],
                                  )
                                ],
                              )),
                          );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        : NoInternetWidget();
  }
}
