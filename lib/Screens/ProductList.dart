import 'package:carousel_slider/carousel_slider.dart';
import 'package:drugcalm/Screens/CartScreen.dart';
import 'package:drugcalm/Screens/ProductDetails.dart';
import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/otherservices.dart';
import '../others/Banners.dart';
import '../providers/ConnectivityProviders.dart';
import '../utils/constants.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int currentindex = 0;
  int _counter = 0;
  bool _isChecked = false;

  @override
  void initState() {
    Provider.of<ConnectivityProviders>(context, listen: false).initConnectivity();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<ConnectivityProviders>(context,listen: false).dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var connectiVityStatus =Provider.of<ConnectivityProviders>(context);
    return
      (connectiVityStatus.isDeviceConnected == "ConnectivityResult.wifi" ||
          connectiVityStatus.isDeviceConnected == "ConnectivityResult.mobile")
          ?

      Scaffold(
      appBar: CustomAppBar1(title: 'DOLO', actions: []),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
              CarouselSlider(
                options: CarouselOptions(
                    height: h * 0.14,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentindex = index;
                      });
                    },
                    viewportFraction: 1),
                items: [
                  BannerImage(),
                  BannerImage(),
                  BannerImage(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i <= 2; i++)
                    Container(
                      margin: EdgeInsets.all(5),
                      height: h * 0.01,
                      width: w * 0.02,
                      decoration: BoxDecoration(
                          color: currentindex == i ? color1 : color2,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
              text(context, 'Available Medicine', 18,
                  fontfamily: 'SFPD',
                  fontWeight: FontWeight.w500,
                  color: color11),
              SizedBox(
                height: h * 0.01,
              ),

              for(int i=0;i<=4;i++)

              InkResponse(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Productdetails()));
              },
                child: container(
                    w: w,
                    padding: EdgeInsets.only(
                        left: 8, right: 8, top: 16, bottom: 16),margin: EdgeInsets.only(
                        bottom: 16),
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
                                                  context, 'ADD', 12,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                    )
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar:
      Column(mainAxisSize: MainAxisSize.min,
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
                        w: w * 0.07,
                        h: h*0.033,
                        colors: color4,
                        padding: EdgeInsets.all(0),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: color11.withOpacity(0.1), width: 1),
                        context,
                        child: IconButton( padding: EdgeInsets.all(0),
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
                          h: h*0.033,
                          colors: color4,  padding: EdgeInsets.all(0),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: color11.withOpacity(0.1), width: 1),
                          context,
                          child: Center(child: text(context, '$_counter', 14))),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      container(
                        w: w * 0.07,
                        h: h*0.033,

                        colors: color1,
                        borderRadius: BorderRadius.circular(4),  padding: EdgeInsets.all(0),
                        context,
                        child: IconButton( padding: EdgeInsets.all(0),
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
                      Column(mainAxisAlignment: MainAxisAlignment.start,
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
                                  child: Checkbox(activeColor: color1,side: BorderSide(color: color11.withOpacity(0.25)),splashRadius: 30,
                                      value: _isChecked, onChanged: (bool? newvalue){
                                        setState(() {
                                          _isChecked=!_isChecked;
                                        });
                                      })
                              )
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
    ):NoInternetWidget();
  }
}
