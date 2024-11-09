import 'package:flutter/material.dart';

import '../utils/CustomAppBar1.dart';

class Brands extends StatefulWidget {
  @override
  _BrandsState createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {

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

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height to make the grid responsive
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar1(
        title: 'BRANDS',
        actions: [Container()],
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
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
                    // You can navigate to other pages here
                    // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        // Add your navigation logic here if needed
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: ClipRect(
                                child: Image.asset(
                                  grid1[index]['image']!,
                                  fit: BoxFit.contain,
                                  width: w * 0.23,
                                  height: h * 0.05,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
