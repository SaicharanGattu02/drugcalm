import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:drugcalm/Screens/Brands.dart';
import 'package:drugcalm/Screens/CartScreen.dart';
import 'package:drugcalm/Screens/CategoriesScreen.dart';
import 'package:drugcalm/Screens/Lab%20And%20Diagnosticlist.dart';
import 'package:drugcalm/Screens/Notifications.dart';
import 'package:drugcalm/Screens/ProductList.dart';
import 'package:drugcalm/Screens/ProfileScreen.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/CategoriesProvider.dart';
import '../utils/CustomSnackBar.dart';
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
    {
      'certificates': 'assets/certificats1.png',
    },
    {
      'certificates': 'assets/certificats2.png',
    },
    {
      'certificates': 'assets/certificats3.png',
    },
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
  final spinkits = Spinkits1();

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
  void initState() {
    GetCategoriesList();
    super.initState();
  }

  Future<void> GetCategoriesList() async {
    final categories_list_provider =
        Provider.of<CategoriesProvider>(context, listen: false);
    categories_list_provider.fetchCategoriesList();
    categories_list_provider.fetchBrandsList();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        actions: <Widget>[Container()],
        toolbarHeight: h * 0.17,
        backgroundColor: color1,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkResponse(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/dclogo1.png",
                          width: w * 0.1,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 12),
                        Image.asset(
                          "assets/dc1.png",
                          width: w * 0.25,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.all(5),
                        icon: Image.asset(
                          "assets/notifications.png", // Your image asset
                          width: 25,
                          height: 25,
                          color: Color(
                              0xffffffff), // Set color filter on the image (optional)
                          fit: BoxFit
                              .contain, // Ensure the image is contained properly
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Notifications(),
                              ));
                        },
                      ),
                      SizedBox(
                        width: w * 0.005,
                      ),
                      IconButton(
                        padding: EdgeInsets.all(5),
                        icon: Icon(
                          Icons
                              .shopping_cart, // Use the shopping cart icon from the material icons
                          color:
                              Color(0xffffffff), // Set the icon color to white
                          size: 20, // Set the icon size
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Cartscreen(),
                              ));
                        },
                      ),
                      SizedBox(
                        width: w * 0.005,
                      ),
                      InkResponse(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profilescreen(),
                              ));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          child: ClipOval(
                            child: CircleAvatar(
                              radius: w * 0.038,
                              child: Image.asset(
                                "assets/profile.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.001,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/location.png",
                    width: w * 0.08,
                    fit: BoxFit.contain,
                  ),
                  text(context, 'Hyderabad', 15,
                      color: color4,
                      fontWeight: FontWeight.w400,
                      fontfamily: "Poppins"),
                  Icon(
                    Icons.arrow_drop_down,
                    color: color4,
                  )
                ],
              ),
              SizedBox(
                height: h * 0.01,
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
                      "Search by molicule",
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: "Nunito"),
                    ),
                    Spacer(),
                    Image.asset(
                      "assets/search.png",
                      width: 22,
                      height: 22,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: w * 0.02),
                    Image.asset(
                      "assets/filter.png",
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: w * 0.02),
                    Image.asset(
                      "assets/mic.png",
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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
                // SizedBox(
                //   height: h * 0.02,
                // ),
                // container(context,padding: EdgeInsets.all(0),
                //     w: w,
                //     borderRadius: BorderRadius.circular(8),
                //     colors: color4,
                //     child:
                //     Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             InkResponse(onTap:(){
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>LabDiognistic()));
                //   },
                //               child: container(context,w: w*0.3,
                //                 child: Column(
                //                   children: [
                //                     container(context,w: w*0.1, borderRadius: BorderRadius.circular(100),padding: EdgeInsets.all(8),
                //                         colors: color27, child: Image.asset('assets/Diagnostic & Lab Services.png',fit: BoxFit.contain,)),
                //                     SizedBox(height: h*0.01,),
                //                     text(context, 'Diagnostic & Lab Services', 10,fontWeight: FontWeight.w400,textAlign: TextAlign.center)
                //                   ],
                //                 ),
                //               ),
                //             ),
                //             container(context,w: w*0.3 ,
                //               child: Column(
                //                 children: [
                //                   container(context,w: w*0.1, borderRadius: BorderRadius.circular(100),padding: EdgeInsets.all(8),
                //                       colors: color27, child: Image.asset('assets/Hospital.png',fit: BoxFit.contain,)),
                //                   SizedBox(height: h*0.01,),
                //                   text(context, 'Hospital & Clinics', 10,fontWeight: FontWeight.w400,textAlign: TextAlign.center)
                //                 ],
                //               ),
                //             ),
                //             container(context,w: w*0.3 ,
                //               child: Column(
                //                 children: [
                //                   container(context,w: w*0.1, borderRadius: BorderRadius.circular(100),padding: EdgeInsets.all(8),
                //                       colors: color27, child: Image.asset('assets/Lab.png',fit: BoxFit.contain,)),
                //                   SizedBox(height: h*0.01,),
                //                   text(context, 'Medical Equipment Rental', 10,fontWeight: FontWeight.w400,textAlign: TextAlign.center)
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(height: h*0.01,),
                //         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             container(context,w: w*0.3,
                //               child: Column(
                //                 children: [
                //                   container(context,w: w*0.1, borderRadius: BorderRadius.circular(100),padding: EdgeInsets.all(8),
                //                       colors: color27, child: Image.asset('assets/Diagnostic & Lab Services.png',fit: BoxFit.contain,)),
                //                   SizedBox(height: h*0.01,),
                //                   text(context, 'Diagnostic & Lab Services', 10,fontWeight: FontWeight.w400,textAlign: TextAlign.center)
                //                 ],
                //               ),
                //             ),
                //             container(context,w: w*0.3 ,
                //               child: Column(
                //                 children: [
                //                   container(context,w: w*0.1, borderRadius: BorderRadius.circular(100),padding: EdgeInsets.all(8),
                //                       colors: color27, child: Image.asset('assets/Hospital.png',fit: BoxFit.contain,)),
                //                   SizedBox(height: h*0.01,),
                //                   text(context, 'Hospital & Clinics', 10,fontWeight: FontWeight.w400,textAlign: TextAlign.center)
                //                 ],
                //               ),
                //             ),
                //             container(context,w: w*0.3 ,
                //               child: Column(
                //                 children: [
                //                   container(context,w: w*0.1, borderRadius: BorderRadius.circular(100),padding: EdgeInsets.all(8),
                //                       colors: color27, child: Image.asset('assets/Lab.png',fit: BoxFit.contain,)),
                //                   SizedBox(height: h*0.01,),
                //                   text(context, 'Medical Equipment Rental', 10,fontWeight: FontWeight.w400,textAlign: TextAlign.center)
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(height: h*0.01,),
                //         Row(mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             container(context,w: w*0.3,
                //               child: Column(
                //                 children: [
                //                   container(context,w: w*0.1, borderRadius: BorderRadius.circular(100),padding: EdgeInsets.all(8),
                //                       colors: color27, child: Image.asset('assets/Diagnostic & Lab Services.png',fit: BoxFit.contain,)),
                //                   SizedBox(height: h*0.01,),
                //                   text(context, 'Consultancy for New Businesses', 10,fontWeight: FontWeight.w400,textAlign: TextAlign.center)
                //                 ],
                //               ),
                //             ),
                //
                //             container(context,w: w*0.3 ,
                //               child: Column(
                //                 children: [
                //                   container(context,w: w*0.1, borderRadius: BorderRadius.circular(100),padding: EdgeInsets.all(8),
                //                       colors: color27, child: Image.asset('assets/Blood Request.png',fit: BoxFit.contain,)),
                //                   SizedBox(height: h*0.01,),
                //                   text(context, 'Blood Request', 10,fontWeight: FontWeight.w400,textAlign: TextAlign.center)
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                // ),
                SizedBox(
                  height: h * 0.02,
                ),
                Consumer<CategoriesProvider>(
                    builder: (context, categoriesProvider, child) {
                  final categories_list = categoriesProvider.categoriesList;
                  if (categoriesProvider.isLoading) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Color(0xffE7C6A0),
                    ));
                  } else {
                    return Column(
                      children: [
                        Row(
                          children: [
                            text(context, 'Shopping By Categories', 16),
                            Spacer(),
                            InkResponse(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CategoriesScreen(),
                                    ));
                              },
                              child: text(context, 'SEE ALL', 16,
                                  color: color1, fontWeight: FontWeight.w400),
                            ),
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 0.0,
                            childAspectRatio: 0.66,
                          ),
                          itemCount: categories_list.length,
                          itemBuilder: (context, index) {
                            var data = categories_list[index];
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
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductList()));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      3.0), // Adjust the padding as needed
                                                  child: CachedNetworkImage(
                                                    imageUrl: data.image ?? "",
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
                                                      // Handle error in case the image fails to load
                                                      return Icon(Icons.error);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                text(context, '${data.categoryName ?? ""}', 12,
                                    fontWeight: FontWeight.w400)
                              ],
                            );
                          },
                        ),
                      ],
                    );
                  }
                }),
                Consumer<CategoriesProvider>(
                    builder: (context, categoriesProvider, child) {
                  final brands_list = categoriesProvider.brandsList;
                  return Column(
                    children: [
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Row(
                        children: [
                          text(context, 'Shopping By Brands', 16),
                          Spacer(),
                          InkResponse(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Brands(),
                                  ));
                            },
                            child: text(context, 'SEE ALL', 16,
                                color: color1, fontWeight: FontWeight.w400),
                          ),
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
                          mainAxisSpacing: 0.0,
                          childAspectRatio: 1.55,
                        ),
                        itemCount: brands_list.length,
                        itemBuilder: (context, index) {
                          var data= brands_list[index];
                          return Column(
                            children: [
                              SizedBox(
                                height: h * 0.02,
                              ),
                              InkResponse(
                                onTap: () {

                                },
                                child: Container(
                                  width:w*0.3,
                                    padding: EdgeInsets.all(2),
                                    height: w*0.14,
                                    decoration: BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(8)),
                                    child: Center(
                                      child: CachedNetworkImage(
                                        imageUrl: data.brandLogo ?? "",
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
                                          // Handle error in case the image fails to load
                                          return Icon(Icons.error);
                                        },
                                      ),
                                    )),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  );
                }),
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
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/WhatsApp svg.png",
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: w * 0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(context, 'Call Our Health Adviser to Book', 13,
                                fontWeight: FontWeight.w400),
                            SizedBox(
                              height: h * 0.005,
                            ),
                            text(
                              context,
                              'Our Team of Experts will guide You',
                              fontWeight: FontWeight.w600,
                              11,
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
                          text(context, 'Near expiry Products', 16,
                              fontWeight: FontWeight.w500),
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
                                  width: w * 0.6,
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
                                          text(context,
                                              '15.0 tablets in 1 strip', 10,
                                              fontWeight: FontWeight.w500,
                                              color: color1),
                                          SizedBox(
                                            height: h * 0.005,
                                          ),
                                          RatingWidget(
                                            initialRating: 4.0,
                                          ),
                                          SizedBox(
                                            height: h * 0.005,
                                          ),
                                          Row(
                                            children: [
                                              text(context, 'Net Price:', 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 93.81', 14),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(context, 'MRP:', 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 106.8', 12,
                                                  fontWeight: FontWeight.w400,
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
                                                width: w * 0.01,
                                              ),
                                              text(context, '12%', 14,
                                                  color: color1),
                                              SizedBox(
                                                width: w * 0.04,
                                              ),
                                              text(context, 'PTR', 12,
                                                  fontWeight: FontWeight.w500),
                                              Icon(
                                                Icons.info,
                                                color: color1,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: w * 0.001,
                                              ),
                                              text(
                                                context,
                                                '₹ 106.8',
                                                fontWeight: FontWeight.w700,
                                                11,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.02,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: containertext1(
                                                    context, 'ADD TO CART',
                                                    onTap: () {}),
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              Container(
                                                height: 40,
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: color11,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Image.asset(
                                                  'assets/favoutline.png',
                                                  width: 20,
                                                  height: 18,
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
                                  width: w * 0.6,
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
                                          text(context,
                                              '15.0 tablets in 1 strip', 10,
                                              fontWeight: FontWeight.w500,
                                              color: color1),
                                          SizedBox(
                                            height: h * 0.005,
                                          ),
                                          RatingWidget(
                                            initialRating: 4.0,
                                          ),
                                          SizedBox(
                                            height: h * 0.005,
                                          ),
                                          Row(
                                            children: [
                                              text(context, 'Net Price:', 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 93.81', 14),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(context, 'MRP:', 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 106.8', 12,
                                                  fontWeight: FontWeight.w400,
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
                                                width: w * 0.01,
                                              ),
                                              text(context, '12%', 14,
                                                  color: color1),
                                              SizedBox(
                                                width: w * 0.04,
                                              ),
                                              text(context, 'PTR', 12,
                                                  fontWeight: FontWeight.w500),
                                              Icon(
                                                Icons.info,
                                                color: color1,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: w * 0.001,
                                              ),
                                              text(
                                                context,
                                                '₹ 106.8',
                                                fontWeight: FontWeight.w700,
                                                11,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.02,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: containertext1(
                                                    context, 'ADD TO CART',
                                                    onTap: () {}),
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              Container(
                                                height: 40,
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: color11,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Image.asset(
                                                  'assets/favoutline.png',
                                                  width: 20,
                                                  height: 18,
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
                                  width: w * 0.6,
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
                                          text(context,
                                              '15.0 tablets in 1 strip', 10,
                                              fontWeight: FontWeight.w500,
                                              color: color1),
                                          SizedBox(
                                            height: h * 0.005,
                                          ),
                                          RatingWidget(
                                            initialRating: 4.0,
                                          ),
                                          SizedBox(
                                            height: h * 0.005,
                                          ),
                                          Row(
                                            children: [
                                              text(context, 'Net Price:', 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 93.81', 14),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(context, 'MRP:', 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 106.8', 12,
                                                  fontWeight: FontWeight.w400,
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
                                                width: w * 0.01,
                                              ),
                                              text(context, '12%', 14,
                                                  color: color1),
                                              SizedBox(
                                                width: w * 0.04,
                                              ),
                                              text(context, 'PTR', 12,
                                                  fontWeight: FontWeight.w500),
                                              Icon(
                                                Icons.info,
                                                color: color1,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: w * 0.001,
                                              ),
                                              text(
                                                context,
                                                '₹ 106.8',
                                                fontWeight: FontWeight.w700,
                                                11,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.02,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: containertext1(
                                                    context, 'ADD TO CART',
                                                    onTap: () {}),
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              Container(
                                                height: 40,
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: color11,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Image.asset(
                                                  'assets/favoutline.png',
                                                  width: 20,
                                                  height: 18,
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
                                  width: w * 0.6,
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
                                          text(context,
                                              '15.0 tablets in 1 strip', 10,
                                              fontWeight: FontWeight.w500,
                                              color: color1),
                                          SizedBox(
                                            height: h * 0.005,
                                          ),
                                          RatingWidget(
                                            initialRating: 4.0,
                                          ),
                                          SizedBox(
                                            height: h * 0.005,
                                          ),
                                          Row(
                                            children: [
                                              text(context, 'Net Price:', 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 93.81', 14),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(context, 'MRP:', 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 106.8', 12,
                                                  fontWeight: FontWeight.w400,
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
                                                width: w * 0.01,
                                              ),
                                              text(context, '12%', 14,
                                                  color: color1),
                                              SizedBox(
                                                width: w * 0.04,
                                              ),
                                              text(context, 'PTR', 12,
                                                  fontWeight: FontWeight.w500),
                                              Icon(
                                                Icons.info,
                                                color: color1,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: w * 0.001,
                                              ),
                                              text(
                                                context,
                                                '₹ 106.8',
                                                fontWeight: FontWeight.w700,
                                                11,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.02,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: containertext1(
                                                    context, 'ADD TO CART',
                                                    onTap: () {}),
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              Container(
                                                height: 40,
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: color11,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Image.asset(
                                                  'assets/favoutline.png',
                                                  width: 20,
                                                  height: 18,
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
                                  width: w * 0.6,
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
                                          text(context,
                                              '15.0 tablets in 1 strip', 10,
                                              fontWeight: FontWeight.w500,
                                              color: color1),
                                          SizedBox(
                                            height: h * 0.005,
                                          ),
                                          RatingWidget(
                                            initialRating: 4.0,
                                          ),
                                          SizedBox(
                                            height: h * 0.005,
                                          ),
                                          Row(
                                            children: [
                                              text(context, 'Net Price:', 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 93.81', 14),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              text(context, 'MRP:', 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: color),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              text(context, '₹ 106.8', 12,
                                                  fontWeight: FontWeight.w400,
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
                                                width: w * 0.01,
                                              ),
                                              text(context, '12%', 14,
                                                  color: color1),
                                              SizedBox(
                                                width: w * 0.04,
                                              ),
                                              text(context, 'PTR', 12,
                                                  fontWeight: FontWeight.w500),
                                              Icon(
                                                Icons.info,
                                                color: color1,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: w * 0.001,
                                              ),
                                              text(
                                                context,
                                                '₹ 106.8',
                                                fontWeight: FontWeight.w700,
                                                11,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.02,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: containertext1(
                                                    context, 'ADD TO CART',
                                                    onTap: () {}),
                                              ),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),
                                              Container(
                                                height: 40,
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: color11,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Image.asset(
                                                  'assets/favoutline.png',
                                                  width: 20,
                                                  height: 18,
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
                          padding: EdgeInsets.only(left: 15),
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
                      return Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: color4,
                            borderRadius: BorderRadius.circular(8)),
                        child: Image.asset(grid4[index]['certificates']!),
                      );
                    }),
                SizedBox(height: h * 0.02),
                text(context, 'Social Links', 16),
                Row(
                  children: [
                    Image.asset(
                      'assets/Facebook.png',
                      fit: BoxFit.contain,
                      width: w * 0.1,
                      height: h * 0.1,
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Image.asset(
                      'assets/Twitter.png',
                      fit: BoxFit.contain,
                      width: w * 0.1,
                      height: h * 0.1,
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Image.asset(
                      'assets/Instagram.png',
                      fit: BoxFit.contain,
                      width: w * 0.1,
                      height: h * 0.1,
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Image.asset(
                      'assets/Linkedin.png',
                      fit: BoxFit.contain,
                      width: w * 0.1,
                      height: h * 0.1,
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                  ],
                ),
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
