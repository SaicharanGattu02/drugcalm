import 'package:carousel_slider/carousel_slider.dart';
import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:flutter/material.dart';

import '../others/Banners.dart';
import '../utils/constants.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: CustomAppBar1(
      //   title: 'SUBSCRIPTION',
      //   actions: [],
      // ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/Drug Clam Background.png'),
        )),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: h * 0.17,
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
              SizedBox(
                height: h * 0.01,
              ),
              container(context,
                  colors: color4,
                  w: w,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  borderRadius: BorderRadius.circular(8),
                  child: Row(
                    children: [
                      Container(
                        width: w * 0.5,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                text(context, '80', 36,
                                    fontWeight: FontWeight.w700,
                                    color: color11),
                                SizedBox(
                                  width: w * 0.01,
                                ),
                                text(context, 'COINS', 16, color: color),
                              ],
                            ),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            text(
                                context,
                                'You need to Earn 200 coinshere to buy 1 week subscription',
                                16,
                                fontWeight: FontWeight.w400,
                                color: color11,
                                textAlign: TextAlign.left),
                          ],
                        ),
                      ),
                      Container(
                        width: w * 0.32,
                        height: h * 0.12,
                        child: Image.asset(
                          'assets/rupess.png',
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: h * 0.01,
              ),
              text(context, 'Health Packages', 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: color18),
              SizedBox(
                height: h * 0.01,
              ),
              container(context,
                  colors: color4,
                  w: w,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  borderRadius: BorderRadius.circular(8),
                  child: Row(
                    children: [
                      Container(
                        width: w * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(context, 'BASIC', 20,
                                fontFamily: 'SFPD',
                                fontWeight: FontWeight.w700,
                                color: color11),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            text(
                                context,
                                '₹729.99/mo',
                                fontFamily: 'SFPD',
                                30,
                                fontWeight: FontWeight.w700,
                                color: color11,
                                textAlign: TextAlign.left),
                          ],
                        ),
                      ),
                      Container(
                        width: w * 0.32,
                        height: h * 0.12,
                        child: Image.asset(
                          'assets/healthpackages.png',
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
