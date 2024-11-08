import 'package:carousel_slider/carousel_slider.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';

import 'ProductDetails.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> grid = [
    {'image': 'assets/img2.png', 'title': 'Medicine'},
    {'image': 'assets/img2.png', 'title': 'Generic'},
    {'image': 'assets/img2.png', 'title': 'OTC'},
    {'image': 'assets/img2.png', 'title': 'Spaciality'},
    {'image': 'assets/img2.png', 'title': 'Company List'},
    {'image': 'assets/img2.png', 'title': 'Cosmotic'},
  ];
  List<Map<String, String>> grid2 = [
    {'image': 'assets/Antiboitics.png', 'title': 'Antibiotics'},
    {'image': 'assets/Anti-inflammatory.png', 'title': 'Anti-inflammatory'},
    {'image': 'assets/Antacids.png', 'title': 'Antacids'},
    {
      'image': 'assets/Anti-diarrheal Products.png',
      'title': 'Anti-diarrheal Products'
    },
    {
      'image': 'assets/Blood Pressure Monitors.png',
      'title': 'Blood Pressure Monitors'
    },
    {'image': 'assets/Thermometers.png', 'title': 'Thermometers'},
    {
      'image': 'assets/Dental Care Products.png',
      'title': 'Dental Care Products'
    },
    {'image': 'assets/Fitness Supplements.png', 'title': 'Fitness Supplements'},
    {
      'image': 'assets/Travel Medicine Kits.png',
      'title': 'Travel Medicine Kits'
    },
    {'image': 'assets/Liver.png', 'title': 'Liver'},
    {'image': 'assets/Ayurvedic.png', 'title': 'Ayurvedic'},
    {'image': 'assets/Kidney.png', 'title': 'Kidney'},
    {'image': 'assets/Wheelchairs.png', 'title': 'Wheelchairs'},
    {'image': 'assets/Eyes.png', 'title': 'EYE'},
    {'image': 'assets/helath.png', 'title': 'Health'},
    {'image': 'assets/EYEDrop.png', 'title': 'Eye Drops'},
    {'image': 'assets/Cancer.png', 'title': 'Cancer'},
    {'image': 'assets/EAR.png', 'title': 'EAR'},
  ];

  List<Map<String, String>> grid1 = [
    {
      'image': 'assets/glucophase.png',
    },
    {
      'image': 'assets/veklury.png',
    },
    {
      'image': 'assets/cialis.png',
    },
    {'image': 'assets/keytruda.png'},
    {'image': 'assets/viagra.png'},
    {'image': 'assets/adcirca.png'},
  ];

  List<Map<String, String>> grid4 = [
    {'certificates': 'assets/certificats1.png',},
    {'certificates': 'assets/certificats2.png',},
    {'certificates': 'assets/certificats3.png',},


  ];

  List<Map<String, String>> grid3 = [
    {
      'image': 'assets/HCQS 200 Tablet.png',
      'title': 'HCQS 200 Tablet.png',
      'strip': '15.0 tablets in 1 strip',
      'rating': '',
      'price': '93.81',
      'mrp': '106.8',
      'margin': '12',
      'ptr': '180'
    },
    {
      'image': 'assets/HCQS 200 Tablet.png',
      'title': 'HCQS 200 Tablet.png',
      'strip': '15.0 tablets in 1 strip',
      'rating': '',
      'price': '93.81',
      'mrp': '106.8',
      'margin': '12',
      'ptr': '180'
    },
  ];
  int currentindex = 0;

  bool _isAbout = false;
  bool _isTerms = false;
  bool _services = false;
  bool _faq = false;
  bool _contact = false;

  void _toggleAboutVisibility() {
    setState(() {
      _isAbout = !_isAbout;
    });
  }

  void _toggleisTermsVisibility() {
    setState(() {
      _isTerms = !_isTerms;
    });
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: h,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/Drug Clam Background.png'),
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                CarouselSlider(
                  options: CarouselOptions(
                      height: h * 0.16,
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
                  height: h * 0.02,
                ),
                Row(
                  children: [
                    text(context, 'Shopping By Categories', 16),
                    Spacer(),
                    text(context, 'SEE ALL', 16,
                        color: color1, fontWeight: FontWeight.w400),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: color1,
                      size: 18,
                    )
                  ],
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.67,
                  ),
                  itemCount: grid.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: h * 0.02,
                        ),
                        InkResponse(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => Productdetails(),
                            //   ),
                            // );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: color1.withOpacity(0.2),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Productdetails()));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                        child: Center(
                                      child: Image.asset(
                                        grid[index]['image']!,
                                        fit: BoxFit.cover,
                                        width: w * 0.23,
                                        height: h * 0.13,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        text(context, '${grid[index]['title']!}', 12,
                            fontWeight: FontWeight.w400)
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Row(
                  children: [
                    text(context, 'Shopping By Brands', 16),
                    Spacer(),
                    text(context, 'SEE ALL', 16,
                        color: color1, fontWeight: FontWeight.w400),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: color1,
                      size: 18,
                    )
                  ],
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1.41,
                  ),
                  itemCount: grid1.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: h * 0.02,
                        ),
                        InkResponse(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => Home(),
                            //   ),
                            // );
                          },
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomizeProductBar()));
                              },
                              child: Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Color(0xffffffff),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                        child: ClipRect(
                                          child: Image.asset(
                                            grid1[index]['image']!,
                                            fit: BoxFit.contain,
                                            width: w * 0.23,
                                            height: h * 0.05,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Container(
                  width: w,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Text(
                        "Search",
                        style: TextStyle(
                            color: Color(0xff9E7BCA),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: "Nunito"),
                      ),
                      Spacer(),
                      Image.asset(
                        "assets/atoz.png",
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Container(
                    width: w,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/WhatsApp svg.png",
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: w * 0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(context, 'Call Our Health Adviser to Book', 14,
                                fontWeight: FontWeight.w400),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            text(
                              context,
                              'Our Team of Experts will guide You',
                              14,
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                        )
                      ],
                    )),
                SizedBox(
                  height: h * 0.02,
                ),
                Container(
                  width: w,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          text(context, 'Near expiry Products', 16),
                          Spacer(),
                          text(context, 'SEE ALL', 16,
                              color: color1, fontWeight: FontWeight.w400),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: color1,
                            size: 18,
                          )
                        ],
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Container(
                        // child: ListView.builder(
                        //   scrollDirection: Axis.horizontal,
                        //   itemCount: grid3.length,
                        //   itemBuilder: (context, index) {
                        //     return
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              4,
                              (index) {
                                return Container(
                                  width: w * 0.8,
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: color1.withOpacity(0.2),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomizeProductBar()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Center(
                                            child: Image.asset(
                                              'assets/HCQS 200 Tablet.png',
                                              fit: BoxFit.contain,
                                            ),
                                          )),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          text(context, 'HCQS 200 Tablet', 14),
                                          SizedBox(
                                            height: h * 0.02,
                                          ),
                                          text(context,'15.0 tablets in 1 strip', 10,
                                              color: color1),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              text(context, 'Net Price:', 12,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 93.81', 14),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(context, 'MRP:', 12,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 106.8', 14,
                                                  color: color1),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              text(context, 'MARGIN', 12,
                                                  fontWeight: FontWeight.w500),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(context, '12%', 14,
                                                  color: color1),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, 'PTR', 12,
                                                  fontWeight: FontWeight.w500),
                                              Icon(
                                                Icons.info,
                                                color: color1,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(
                                                context,
                                                '₹ 106.8',
                                                14,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.02,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: containertext(
                                                    context, 'ADD TO CART',
                                                    onTap: () {}),
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              Container(
                                                height: h * 0.055,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: color2,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Image.asset(
                                                  'assets/fav.png',
                                                  color: color2,
                                                  fit: BoxFit.contain,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  //   );
                                  // }
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Container(
                  width: w,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          text(context, 'Rental Items', 16),
                          Spacer(),
                          text(context, 'SEE ALL', 16,
                              color: color1, fontWeight: FontWeight.w400),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: color1,
                            size: 18,
                          )
                        ],
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Container(
                        // child: ListView.builder(
                        //   scrollDirection: Axis.horizontal,
                        //   itemCount: grid3.length,
                        //   itemBuilder: (context, index) {
                        //     return
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              4,
                              (index) {
                                return Container(
                                  width: w * 0.8,
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: color1.withOpacity(0.2),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomizeProductBar()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Center(
                                            child: Image.asset(
                                              'assets/HCQS 200 Tablet.png',
                                              fit: BoxFit.contain,
                                            ),
                                          )),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          text(context, 'HCQS 200 Tablet', 14),
                                          SizedBox(
                                            height: h * 0.02,
                                          ),
                                          text(context,'15.0 tablets in 1 strip', 10,
                                              color: color1),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              text(context, 'Net Price:', 12,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 93.81', 14),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(context, 'MRP:', 12,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 106.8', 14,
                                                  color: color1),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              text(context, 'MARGIN', 12,
                                                  fontWeight: FontWeight.w500),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(context, '12%', 14,
                                                  color: color1),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, 'PTR', 12,
                                                  fontWeight: FontWeight.w500),
                                              Icon(
                                                Icons.info,
                                                color: color1,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(
                                                context,
                                                '₹ 106.8',
                                                14,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.02,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: containertext(
                                                    context, 'ADD TO CART',
                                                    onTap: () {}),
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              Container(
                                                height: h * 0.055,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: color2,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Image.asset(
                                                  'assets/fav.png',
                                                  color: color2,
                                                  fit: BoxFit.contain,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  //   );
                                  // }
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Container(
                  width: w,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          text(context, 'September Sell', 16),
                          Spacer(),
                          text(context, 'SEE ALL', 16,
                              color: color1, fontWeight: FontWeight.w400),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: color1,
                            size: 18,
                          )
                        ],
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Container(
                        // child: ListView.builder(
                        //   scrollDirection: Axis.horizontal,
                        //   itemCount: grid3.length,
                        //   itemBuilder: (context, index) {
                        //     return
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              4,
                              (index) {
                                return Container(
                                  width: w * 0.8,
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: color1.withOpacity(0.2),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomizeProductBar()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Center(
                                            child: Image.asset(
                                              'assets/HCQS 200 Tablet.png',
                                              fit: BoxFit.contain,
                                            ),
                                          )),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          text(context, 'HCQS 200 Tablet', 14),
                                          SizedBox(
                                            height: h * 0.02,
                                          ),
                                          text(context,'15.0 tablets in 1 strip', 10,
                                              color: color1),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              text(context, 'Net Price:', 12,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 93.81', 14),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(context, 'MRP:', 12,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 106.8', 14,
                                                  color: color1),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              text(context, 'MARGIN', 12,
                                                  fontWeight: FontWeight.w500),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(context, '12%', 14,
                                                  color: color1),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, 'PTR', 12,
                                                  fontWeight: FontWeight.w500),
                                              Icon(
                                                Icons.info,
                                                color: color1,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(
                                                context,
                                                '₹ 106.8',
                                                14,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.02,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: containertext(
                                                    context, 'ADD TO CART',
                                                    onTap: () {}),
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              Container(
                                                height: h * 0.055,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: color2,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Image.asset(
                                                  'assets/fav.png',
                                                  color: color2,
                                                  fit: BoxFit.contain,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  //   );
                                  // }
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Container(
                  width: w,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          text(context, 'Pro For Services', 16),
                          Spacer(),
                          text(context, 'SEE ALL', 16,
                              color: color1, fontWeight: FontWeight.w400),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: color1,
                            size: 18,
                          )
                        ],
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Container(
                        // child: ListView.builder(
                        //   scrollDirection: Axis.horizontal,
                        //   itemCount: grid3.length,
                        //   itemBuilder: (context, index) {
                        //     return
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              4,
                              (index) {
                                return Container(
                                  width: w * 0.8,
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: color1.withOpacity(0.2),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomizeProductBar()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Center(
                                            child: Image.asset(
                                              'assets/HCQS 200 Tablet.png',
                                              fit: BoxFit.contain,
                                            ),
                                          )),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          text(context, 'HCQS 200 Tablet', 14),
                                          SizedBox(
                                            height: h * 0.02,
                                          ),
                                          text(context,'15.0 tablets in 1 strip', 10,
                                              color: color1),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              text(context, 'Net Price:', 12,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 93.81', 14),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(context, 'MRP:', 12,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 106.8', 14,
                                                  color: color1),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              text(context, 'MARGIN', 12,
                                                  fontWeight: FontWeight.w500),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(context, '12%', 14,
                                                  color: color1),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, 'PTR', 12,
                                                  fontWeight: FontWeight.w500),
                                              Icon(
                                                Icons.info,
                                                color: color1,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(
                                                context,
                                                '₹ 106.8',
                                                14,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.02,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: containertext(
                                                    context, 'ADD TO CART',
                                                    onTap: () {}),
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              Container(
                                                height: h * 0.055,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: color2,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Image.asset(
                                                  'assets/fav.png',
                                                  color: color2,
                                                  fit: BoxFit.contain,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  //   );
                                  // }
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Container(
                  width: w,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          text(context, 'FMCG products', 16),
                          Spacer(),
                          text(context, 'SEE ALL', 16,
                              color: color1, fontWeight: FontWeight.w400),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: color1,
                            size: 18,
                          )
                        ],
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Container(
                        // child: ListView.builder(
                        //   scrollDirection: Axis.horizontal,
                        //   itemCount: grid3.length,
                        //   itemBuilder: (context, index) {
                        //     return
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              4,
                              (index) {
                                return Container(
                                  width: w * 0.8,
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: color1.withOpacity(0.2),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomizeProductBar()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Center(
                                            child: Image.asset(
                                              'assets/HCQS 200 Tablet.png',
                                              fit: BoxFit.contain,
                                            ),
                                          )),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          text(context, 'HCQS 200 Tablet', 14),
                                          SizedBox(
                                            height: h * 0.02,
                                          ),
                                          text(context,'15.0 tablets in 1 strip', 10,
                                              color: color1),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              text(context, 'Net Price:', 12,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 93.81', 14),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(context, 'MRP:', 12,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 106.8', 14,
                                                  color: color1),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              text(context, 'MARGIN', 12,
                                                  fontWeight: FontWeight.w500),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(context, '12%', 14,
                                                  color: color1),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, 'PTR', 12,
                                                  fontWeight: FontWeight.w500),
                                              Icon(
                                                Icons.info,
                                                color: color1,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(
                                                context,
                                                '₹ 106.8',
                                                14,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.02,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: containertext(
                                                    context, 'ADD TO CART',
                                                    onTap: () {}),
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              Container(
                                                height: h * 0.055,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: color2,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Image.asset(
                                                  'assets/fav.png',
                                                  color: color2,
                                                  fit: BoxFit.contain,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  //   );
                                  // }
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                text(context, 'BLOG', 16),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: color4, borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: w * 0.3,
                              child: Image.asset(
                                'assets/eye.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: Container(
                                width: 24, // Specify the width and height
                                height: 24,
                                decoration: BoxDecoration(
                                    color: Color(
                                        0xffFFE5B4), // Replace with a valid color code
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: color1,
                                        width: 1) // Or other styles if needed
                                    ),
                                child: Center(
                                    child: Image.asset(
                                  'assets/saved.png',
                                  fit: BoxFit.contain,
                                  width: 14,
                                  height: 14,
                                )),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: w * 0.55,
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text(context,
                                  'What Causing your Blood shot eyes?', 14,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.left),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              text(
                                context,
                                'Eye Spacialist',
                                14,
                                fontWeight: FontWeight.w500,
                                color: color,
                              ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              Row(
                                children: [
                                  ClipOval(
                                    child: CircleAvatar(
                                      radius: 14,
                                      foregroundImage:
                                          AssetImage('assets/profile.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  text(context, 'DORIS L.COLLINS', 14,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.left),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: color4, borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: w * 0.3,
                              child: Image.asset(
                                'assets/dentist.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: Container(
                                width: 24, // Specify the width and height
                                height: 24,
                                decoration: BoxDecoration(
                                    color: Color(
                                        0xffFFE5B4), // Replace with a valid color code
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: color1,
                                        width: 1) // Or other styles if needed
                                    ),
                                child: Center(
                                    child: Image.asset(
                                  'assets/saved.png',
                                  fit: BoxFit.contain,
                                  width: 14,
                                  height: 14,
                                )),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: w * 0.55,
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text(
                                  context,
                                  'Teething Troubles? Schedule a dentist Check Up',
                                  14,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.left),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              text(
                                context,
                                'Healthly Eating',
                                14,
                                fontWeight: FontWeight.w500,
                                color: color,
                              ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              Row(
                                children: [
                                  ClipOval(
                                    child: CircleAvatar(
                                      radius: 14,
                                      foregroundImage:
                                          AssetImage('assets/profile.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  text(context, 'WALTER L. Mertz', 14,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.left),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: color4, borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: w * 0.3,
                              child: Image.asset(
                                'assets/pregnant-.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: Container(
                                width: 22, // Specify the width and height
                                height: 22,
                                decoration: BoxDecoration(
                                    color: Color(
                                        0xffFFE5B4), // Replace with a valid color code
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: color1,
                                        width: 1) // Or other styles if needed
                                    ),
                                child: Center(
                                    child: Image.asset(
                                  'assets/saved.png',
                                  fit: BoxFit.contain,
                                  width: 14,
                                  height: 14,
                                )),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: w * 0.55,
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text(
                                  context,
                                  'Teething Troubles? Schedule a dentist Check Up',
                                  14,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.left),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              text(
                                context,
                                'Healthly Eating',
                                14,
                                fontWeight: FontWeight.w500,
                                color: color,
                              ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              Row(
                                children: [
                                  ClipOval(
                                    child: CircleAvatar(
                                      radius: 14,
                                      foregroundImage:
                                          AssetImage('assets/profile.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  text(context, 'WALTER L. MERTZ', 14,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.left),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 0.62,
                  ),
                  itemCount: grid2.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: h * 0.02,
                        ),
                        InkResponse(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => Home(),
                            //   ),
                            // );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: color1.withOpacity(0.2),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomizeProductBar()));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(8),
                                        child: Center(
                                          child: Image.asset(
                                            grid2[index]['image']!,
                                            fit: BoxFit.cover,
                                            width: w * 0.2,
                                            height: h * 0.1,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        text(context, '${grid2[index]['title']!}', 12,
                            fontWeight: FontWeight.w400)
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Row(
                  children: [
                    text(context, 'Speciality Medicines', 16),
                    Spacer(),
                    text(context, 'SEE ALL', 16,
                        color: color1, fontWeight: FontWeight.w400),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: color1,
                      size: 18,
                    )
                  ],
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.67,
                  ),
                  itemCount: grid.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: h * 0.02,
                        ),
                        InkResponse(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => Home(),
                            //   ),
                            // );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: color1.withOpacity(0.2),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomizeProductBar()));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                        child: Center(
                                      child: Image.asset(
                                        grid[index]['image']!,
                                        fit: BoxFit.cover,
                                        width: w * 0.23,
                                        height: h * 0.13,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        text(context, '${grid[index]['title']!}', 12,
                            fontWeight: FontWeight.w400)
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: color4, borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "About Us",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          InkResponse(
                            onTap: _toggleAboutVisibility,
                            child: Icon(
                              _isAbout
                                  ? Icons.keyboard_arrow_up_sharp
                                  : Icons.keyboard_arrow_down_sharp,
                              color: color1,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.01),
                      if (_isAbout) ...[
                        Divider(
                            thickness: 1, height: 1, color: Color(0xffEEF2F6)),
                        SizedBox(height: h * 0.01),
                        Text(
                          "Material: Premium Cotton Blend\nAvailable Colors: Red, Blue, Green, Black\nSizes: XS to 5XL\nCare Instructions: Machine wash cold, tumble dry low.",
                          style: TextStyle(
                            color: Color(0xff4B5565),
                            fontFamily: 'RozhaOne',
                            fontSize: 14,
                            height: 19.36 / 14,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ]
                    ],
                  ),
                ),
                SizedBox(height: h * 0.02),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: color4, borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Terms & Conditions",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          InkResponse(
                            onTap: _toggleisTermsVisibility,
                            child: Icon(
                              _isTerms
                                  ? Icons.keyboard_arrow_up_sharp
                                  : Icons.keyboard_arrow_down_sharp,
                              color: color1,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.01),
                      if (_isTerms) ...[
                        Divider(
                            thickness: 1, height: 1, color: Color(0xffEEF2F6)),
                        SizedBox(height: h * 0.01),
                        Text(
                          "Material: Premium Cotton Blend\nAvailable Colors: Red, Blue, Green, Black\nSizes: XS to 5XL\nCare Instructions: Machine wash cold, tumble dry low.",
                          style: TextStyle(
                            color: Color(0xff4B5565),
                            fontFamily: 'RozhaOne',
                            fontSize: 14,
                            height: 19.36 / 14,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ]
                    ],
                  ),
                ),
                SizedBox(height: h * 0.02),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: color4, borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Service Policy",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          InkResponse(
                            onTap: _toggleisTermsVisibility,
                            child: Icon(
                              _isTerms
                                  ? Icons.keyboard_arrow_up_sharp
                                  : Icons.keyboard_arrow_down_sharp,
                              color: color1,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.01),
                      if (_isTerms) ...[
                        Divider(
                            thickness: 1, height: 1, color: Color(0xffEEF2F6)),
                        SizedBox(height: h * 0.01),
                        Text(
                          "Material: Premium Cotton Blend\nAvailable Colors: Red, Blue, Green, Black\nSizes: XS to 5XL\nCare Instructions: Machine wash cold, tumble dry low.",
                          style: TextStyle(
                            color: Color(0xff4B5565),
                            fontFamily: 'RozhaOne',
                            fontSize: 14,
                            height: 19.36 / 14,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ]
                    ],
                  ),
                ),
                SizedBox(height: h * 0.02),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: color4, borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "FAQ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          InkResponse(
                            onTap: _toggleisTermsVisibility,
                            child: Icon(
                              _isTerms
                                  ? Icons.keyboard_arrow_up_sharp
                                  : Icons.keyboard_arrow_down_sharp,
                              color: color1,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.01),
                      if (_isTerms) ...[
                        Divider(
                            thickness: 1, height: 1, color: Color(0xffEEF2F6)),
                        SizedBox(height: h * 0.01),
                        Text(
                          "Material: Premium Cotton Blend\nAvailable Colors: Red, Blue, Green, Black\nSizes: XS to 5XL\nCare Instructions: Machine wash cold, tumble dry low.",
                          style: TextStyle(
                            color: Color(0xff4B5565),
                            fontFamily: 'RozhaOne',
                            fontSize: 14,
                            height: 19.36 / 14,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ]
                    ],
                  ),
                ),
                SizedBox(height: h * 0.02),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: color4, borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Contact Us",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          InkResponse(
                            onTap: _toggleisTermsVisibility,
                            child: Icon(
                              _isTerms
                                  ? Icons.keyboard_arrow_up_sharp
                                  : Icons.keyboard_arrow_down_sharp,
                              color: color1,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.01),
                      if (_isTerms) ...[
                        Divider(
                            thickness: 1, height: 1, color: Color(0xffEEF2F6)),
                        SizedBox(height: h * 0.01),
                        Text(
                          "Material: Premium Cotton Blend\nAvailable Colors: Red, Blue, Green, Black\nSizes: XS to 5XL\nCare Instructions: Machine wash cold, tumble dry low.",
                          style: TextStyle(
                            color: Color(0xff4B5565),
                            fontFamily: 'RozhaOne',
                            fontSize: 14,
                            height: 19.36 / 14,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ]
                    ],
                  ),
                ),
                SizedBox(height: h * 0.02),
                text(context, 'Certifications', 16),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 0.95,
                    ),
                    itemCount: grid4.length,
                    itemBuilder: (context, index) {
                      return Container(padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: color4,
                            borderRadius: BorderRadius.circular(8)),
                        child: Image.asset(grid4[index]['certificates']!),
                      );
                    }),


                SizedBox(height: h * 0.02),
                text(context, 'Social Links', 16),
                Row(children: [
                  Image.asset('assets/Facebook.png',fit: BoxFit.contain,width: w*0.1,height: h*0.1,),
                  SizedBox(width: w*0.02,),
                  Image.asset('assets/Twitter.png',fit: BoxFit.contain,width: w*0.1,height: h*0.1,),
                  SizedBox(width: w*0.02,),
                  Image.asset('assets/Instagram.png',fit: BoxFit.contain,width: w*0.1,height: h*0.1,),
                  SizedBox(width: w*0.02,),
                  Image.asset('assets/Linkedin.png',fit: BoxFit.contain,width: w*0.1,height: h*0.1,),
                  SizedBox(width: w*0.02,),

                  
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BannerImage extends StatelessWidget {
  const BannerImage({
    super.key,
    this.onpressed,
  });
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onpressed,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "assets/Why Insurance.png",
              fit: BoxFit.contain,
            ),
          )),
    );
  }
}

class BannerImage1 extends StatelessWidget {
  const BannerImage1({
    super.key,
    this.onpressed,
  });
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onpressed,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "assets/ad.png",
              fit: BoxFit.contain,
            ),
          )),
    );
  }
}
