import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/CustomAppBar1.dart';
import '../utils/constants.dart';

class ordersscreen3 extends StatefulWidget {
  const ordersscreen3({super.key});

  @override
  State<ordersscreen3> createState() => _Orderscreen3State();
}

class _Orderscreen3State extends State<ordersscreen3> {
  String selectedOption = "All"; // Default selected value for the dropdown
  final List<String> dropdownOptions = ["All", "Product", "Category"];
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar1(
        title: 'My Orders3',
        actions: [],
      ),
      body: Column(
        children: [
          // Search Bar
          Row(
            children: [
              Container(
                width: w * 0.40,
                height: h * 0.04,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xff9E7BCA), width: 1),
                ),
                child: DropdownButton<String>(
                  value: selectedOption,
                  items: dropdownOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(
                        option,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Nunito",
                          color: Color(0xff9E7BCA),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedOption = newValue!;
                    });
                  },
                  underline: Container(), // Removes the default underline
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xff9E7BCA),
                  ), // Dropdown arrow icon
                ),
              ),

              // Second Container with Calendar Icon
              Container(
                width: w * 0.12,
                height: h * 0.04,
                margin: const EdgeInsets.all(16),
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
              SizedBox(
                height: h * 0.05,
              ),
              // Third Container with Filter Icon
              Container(
                width: w * 0.12,
                height: h * 0.04,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
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
          container(context,
              colors: color4,
              borderRadius: BorderRadius.circular(8),
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [


                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),

                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 48, // Set width to 48
                            height: 48, // Set height to 48
                            child: Image.asset(
                              'assets/dolo250 Oral.png.png',
                              fit: BoxFit.contain, // Ensures the image fits within the box
                            ),
                          ),
                          SizedBox(
                            width: w * 0.05,
                          ),
                          Container(
                              width: w * 0.65,
                              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(
                                      context,
                                      'Himalayan Shilajit Ashwagandha',
                                      14,
                                      color: Color(0xff0C2638),
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.left),


                                  Row(
                                    children: [

                                      text(context, 'Bottle of 50ML Oral Suspension', 12, color: Color(0xff617C9D), textAlign: TextAlign.right, fontWeight: FontWeight.w500),


                                    ],

                                  ),

                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  RatingWidget(
                                    initialRating: 4.0,
                                  ),
                                  Row(
                                    children: [
                                      text(
                                          context,
                                          'Net Price',
                                          12,
                                          color: Color(0xff617C9D),
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.right),
                                      text(context, '₹ 299',16,  color: color11, textAlign: TextAlign.right, fontWeight: FontWeight.w500),

                                      text(context, ' M.R.P:',12,  color: Color(0xff617C9D), textAlign: TextAlign.right, fontWeight: FontWeight.w500),
                                      text(context, ' ₹599',14,  color: color20, textAlign: TextAlign.right, fontWeight: FontWeight.w500),



                                    ],

                                  ),
                                  SizedBox(
                                    height: w * 0.02,
                                  ),






                                  Row(
                                    children: [
                                      container(
                                          padding:
                                          EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                                          colors: Color(0xffEDF2F5),
                                          borderRadius: BorderRadius.circular(4),
                                          context,
                                          child: Row(
                                            children: [
                                              text(context, 'Scheme', 12,
                                                  fontWeight: FontWeight.w400, color: color2),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 2, horizontal: 10),
                                                  borderRadius: BorderRadius.circular(4),
                                                  border: Border.all(color: color7, width: 1),
                                                  context,
                                                  child: text(
                                                    context,
                                                    '5+1',
                                                    10,
                                                    color: color10,
                                                    fontWeight: FontWeight.w400,
                                                  ))
                                            ],
                                          )),
                                      SizedBox(
                                        width: w * 0.01,
                                      ),
                                      Container(padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(color:color14),
                                          child: Row(
                                            children: [
                                              text(context, 'MARGIN', 12, color: color11,  fontWeight: FontWeight.w500),
                                              SizedBox(
                                                width: w * 0.02,
                                              ),

                                              text(context, '18%', 12, color: color1,  fontWeight: FontWeight.w500),
                                            ],
                                          )),

                                      SizedBox(
                                        width: w * 0.02,
                                      ),
                                      text(context, 'PTR', 12, color: Colors.grey, fontWeight: FontWeight.w500),

                                      Image.asset(
                                        width: 11, // Set width to 48
                                        height:11, // Set height to 48
                                        'assets/infoVector.png',
                                        color: Color(0xf22C6BF),
                                        fit: BoxFit.fill,
                                      ),
                                      text(context, '₹121.78', 11, color: color11
                                          , fontWeight: FontWeight.w500),


                                    ],

                                  ),


                                ],
                              )),
                        ],
                      ),
                      SizedBox(
                        height: w * 0.05,),
                      Divider(
                        height: 1,
                        color: color9,
                      ),
                      SizedBox(
                        height: w * 0.05,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Delete Image Button
                          InkResponse(
                            onTap: () {
                              // Delete button logic
                            },
                            child: Image.asset(
                              'assets/deletecircle.png', // Path to your delete icon
                              width: 24, // Adjust width
                              height: 24, // Adjust height
                            ),
                          ),


                          // Favorite Image Button
                          InkResponse(
                            onTap: () {
                              // Favorite button logic
                            },
                            child: Image.asset(
                              'assets/favorateimg.png', // Path to your favorite icon
                              width: 24, // Adjust width
                              height: 24, // Adjust height
                            ),
                          ),

                          // Add to Cart Button
                          Container(
                            width: 105, // Fixed width
                            height: 40, // Fixed height
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: color1, width: 1), // Border color
                            ),
                            child: InkWell(
                              onTap: () {
                                // Add to Cart button logic
                              },
                              child: Center(
                                child: Text(
                                  'ADD TO CART',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: color1, // Text color
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )


                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
