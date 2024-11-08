import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/CustomAppBar1.dart';
import '../utils/constants.dart';

class ordersscreen2 extends StatefulWidget {
  const ordersscreen2({super.key});

  @override
  State<ordersscreen2> createState() => _Orderscreen2State();
}

class _Orderscreen2State extends State<ordersscreen2> {
  String selectedOption = "All"; // Default selected value for the dropdown
  final List<String> dropdownOptions = ["All", "Product", "Category"];
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar1(
        title: 'My Orders2',
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
                    Spacer(),
                      Row(
                        children: [
                          container(

                            context,
                            colors: color20,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            borderRadius: BorderRadius.circular(4),
                            child: Row(
                              children: [
                                text(context, 'Reorder', 10,
                                    color: color4,
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                                      'Supradyn Daily Multivitamin Tablets',
                                      14,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.left),


                                  Row(
                                    children: [

                                      text(context, 'Daily Immunity & Energy, 150 Tablets', 11, color: Color(0xff617C9D), textAlign: TextAlign.right, fontWeight: FontWeight.w500),


                                    ],

                                  ),
                                  Row(
                                    children: [
                                      text(
                                          context,
                                          'Expiry Date : ',
                                          12,
                                          color: Color(0xff617C9D),
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.right),
                                      text(context, ' Dec-2025',14,  color: color11, textAlign: TextAlign.right, fontWeight: FontWeight.w500),




                                    ],

                                  ),
                                  SizedBox(
                                    height: w * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      text(
                                          context,
                                          'Total Qty',
                                          12,
                                          color: Color(0xff617C9D),
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.right),
                                      SizedBox(
                                        width: w * 0.02,
                                      ),

                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                        decoration: BoxDecoration(color: Color(0xffDFE8F3),
                                          border: Border.all(color: Colors.grey), // Border color
                                          borderRadius: BorderRadius.circular(4), // Rounded corners
                                        ),
                                        child: Text(
                                          '5', // Example text for counting items
                                          style: TextStyle(
                                            fontSize: 16.0, // Adjust font size
                                            fontWeight: FontWeight.bold, // Make text bold if needed
                                            color: Colors.black, // Text color
                                          ),
                                        ),
                                      )

                                    ],

                                  ),

                                  SizedBox(
                                    height: w * 0.05,
                                  ),
                                  Row(
                                    children: [
                                      text(context, 'MRP :', 12,color: Colors.grey, textAlign: TextAlign.right, fontWeight: FontWeight.w500),
                                      SizedBox(
                                        width: w * 0.01,
                                      ),
                                      text(context, '₹175', 12, color: color11, textAlign: TextAlign.right, fontWeight: FontWeight.w500),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Cancel Button
                          Container(
                            width: 85, // Fixed width
                            height: 33, // Fixed height
                            child: InkResponse(
                              onTap: () {
                                // Cancel button logic
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: color1, width: 1),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 4), // Adjust padding to fit
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Icon(Icons.cancel, color: color1, size: 14), // Adjust icon size
                                    SizedBox(width: 4),
                                    Text(
                                      'CANCEL',
                                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: color1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Refill Button
                          Container(
                            width: 85,
                            height: 33,
                            child: InkResponse(
                              onTap: () {
                                // Refill button logic
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: color2, width: 1),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Icon(Icons.refresh, color: color1, size: 14),
                                    SizedBox(width: 4),
                                    Text(
                                      'REFILL',
                                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: color1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Return Button
                          Container(
                            width: 85,
                            height: 33,
                            child: InkResponse(
                              onTap: () {
                                // Return button logic
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: color2, width: 1),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Icon(Icons.undo, color: color1, size: 14),
                                    SizedBox(width: 4),
                                    Text(
                                      'RETURN',
                                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: color1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Help Button
                          Container(
                            width: 63,
                            height: 33,
                            child: InkResponse(
                              onTap: () {
                                // Help button logic
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: color13, width: 1),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Icon(Icons.help_outline, color: color1, size: 14),
                                    SizedBox(width: 4),
                                    Text(
                                      'HELP',
                                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: color1),
                                    ),
                                  ],
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
