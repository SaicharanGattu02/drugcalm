import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/CustomAppBar1.dart';
import '../utils/constants.dart';

class Orderscreen extends StatefulWidget {
  const Orderscreen({super.key});

  @override
  State<Orderscreen> createState() => _OrderscreenState();
}

class _OrderscreenState extends State<Orderscreen> {
  String selectedOption = "All"; // Default selected value for the dropdown
  final List<String> dropdownOptions = ["All", "Product", "Category"];
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar1(
        title: 'My Orders1',
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
                      Image.asset(
                        'assets/order.png',
                        fit: BoxFit.contain,
                        width: w * 0.05,
                      ),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      text(context, 'OrderId', 12, color: color1),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      text(context, ': FDH02386JN', 12, color: color11),
                      SizedBox(
                        width: w * 0.05,
                      ),
                      Image.asset(
                        'assets/calendar_month.png',
                        fit: BoxFit.contain,
                        width: w * 0.05,
                      ),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      text(context, 'Expected ', 12, color: color1),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      text(context, ': 20 Dec 2024', 12, color: color11),
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
                            width: w * 0.02,
                          ),
                          Container(
                              width: w * 0.65,
                              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(
                                      context,
                                      'Ayurvedic and Herbal Syrbal Pack of 200 ML',
                                      14,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.left),
                                  Row(
                                    children: [
                                      text(
                                          context,
                                          ' Return :',
                                          12,
                                          color: Color(0xff617C9D),
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.right),
                                      text(context, 'Eligible through 18 September 2024 ', 11, color: color1, textAlign: TextAlign.right, fontWeight: FontWeight.w500),


    ],

                                  ),
                                  SizedBox(
                                    height: w * 0.05,
                                  ),
                                  Row(
                                    children: [

                                      text(context, '₹ 2,546', 20, color: color11, textAlign: TextAlign.right, fontWeight: FontWeight.w500),
                                      SizedBox(
                                        width: w * 0.04,
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
                                      text(context, 'PTR', 12, color: color11, fontWeight: FontWeight.w500),

                                      Image.asset(
                                        width: 11, // Set width to 48
                                        height:11, // Set height to 48
                                        'assets/infoVector.png',
                                        color: Color(0xf22C6BF),
                                        fit: BoxFit.fill,
                                      ),
                                      text(context, '₹121.78', 10, color: color1
                                          , fontWeight: FontWeight.w500),


                                    ],

                                  ),


                                ],
                              )),
                        ],
                      ),
                      SizedBox(
                        height: w * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkResponse(onTap: (){

                          },
                            child: Expanded(
                              child: container(w: w*0.4,
                                  context,
                                  borderRadius: BorderRadius.circular(6),border: Border.all(color: color1,width: 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),

                                  child: Center(
                                    child: text(context, 'CANCEL', 13,
                                        fontWeight: FontWeight.w400,
                                        color: color1),
                                  )),
                            ),
                          ),
                          Spacer(),
                          InkResponse(onTap: (){

                          },
                            child: Expanded(
                              child: container(w: w*0.4,
                                  context,
                                  borderRadius: BorderRadius.circular(6),border: Border.all(color: color1,width: 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                              
                                  child: Center(
                                    child: text(context, 'TRACK', 13,
                                        fontWeight: FontWeight.w400,
                                        color: color1),
                                  )),
                            ),
                          )
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
