import 'package:carousel_slider/carousel_slider.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';

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
  List<Map<String, String>> grid1 = [
    {'image': 'assets/img2.png',},
    {'image': 'assets/img2.png', },
    {'image': 'assets/img2.png',},
    {'image': 'assets/img2.png'},
    {'image': 'assets/img2.png'},
    {'image': 'assets/img2.png'},
  ];
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Container( decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
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
                    text4(context, 'SEE ALL', 16,
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

                    childAspectRatio: 0.68,
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
                                        height: h*0.13,
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
                        text(context,'${grid[index]['title']!}', 12,fontWeight: FontWeight.w400)
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
                    text4(context, 'SEE ALL', 16,
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

                    childAspectRatio: 0.68,
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
                                            height: h*0.05,
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
                        text(context,'${grid[index]['title']!}', 12,fontWeight: FontWeight.w400)
                      ],
                    );
                  },
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
