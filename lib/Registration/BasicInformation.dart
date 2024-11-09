import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Screens/Home.dart';
import '../utils/constants.dart';

class BasicInformaion extends StatefulWidget {
  const BasicInformaion({super.key});

  @override
  State<BasicInformaion> createState() => _BasicInformaionState();
}

class _BasicInformaionState extends State<BasicInformaion> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            width: w,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/Drug Clam Background.png',
                    ),
                    fit: BoxFit.cover)),
            child: container(context,
                colors: color4,
                padding: EdgeInsets.symmetric(vertical: 24),
                borderRadius: BorderRadius.circular(8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: color11,
                            size: 22,
                          ),
                          SizedBox(
                            width: w * 0.04,
                          ),
                          text(
                            context,
                            'Basic Information',
                            20,
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      ),
                    ),

                    Expanded(child: SingleChildScrollView(
                      child:
                      Column(children: [
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
                        SizedBox(height: h*0.01,),



                      ],),
                    ))
                  ],
                ))));
  }
}
