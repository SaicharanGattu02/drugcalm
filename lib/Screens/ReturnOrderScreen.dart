import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/CustomAppBar1.dart';

class Returnorderscreen extends StatefulWidget {
  const Returnorderscreen({super.key});

  @override
  State<Returnorderscreen> createState() => _ReturnorderscreenState();
}

class _ReturnorderscreenState extends State<Returnorderscreen> {
  TextEditingController _descriptionController = TextEditingController();
  // List of questions
  final List<String> _questions = [
    'Missing Parts Or Accessories',
    'Bought By Mistake',
    'Both Products And Shipping Box Damaged',
    'Medicine labels list ingredients for safety',
    'Wrong Item Was Sent',
    'Wrong Item Was Sent',
    'It tells how strong the medicine is (dosage)',
  ];

  int _selectedIndex = -1; // Default: No option selected

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar1(
        title: 'RETURN',
        actions: [Container()],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: w,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Drug Clam Background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Item Section
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color4,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: color4,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: Color(0xffA5BECC)),
                      ),
                      child: Image.asset(
                        "assets/image1.png",
                        width: 45,
                        height: 50,
                      ),
                    ),
                    SizedBox(width: w * 0.03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: w * 0.55,
                          child: Text(
                            'Heryson H.livnzyme DS Syrup Use',
                            style: TextStyle(
                              color: color11,
                              fontFamily: "Poppins",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                          decoration: BoxDecoration(
                            color: color16,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                          ),
                          child: Text(
                            'Awaiting Approval',
                            style: TextStyle(
                              color: color4,
                              fontFamily: "Inter",
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              // Return Reason Section
              Container(
                width: w,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color4,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                      context,
                      'Why Are You Returning This?',
                      color: color11,
                      fontfamily: "Poppins",
                      16,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 10),
                    Divider(
                      height: 1,
                      color: Color(0xffDBDBDB),
                    ),
                    SizedBox(height: 5),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _questions.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio<int>(
                              value: index,
                              groupValue: _selectedIndex,
                              onChanged: (int? value) {
                                setState(() {
                                  _selectedIndex = value!;
                                });
                              },
                              activeColor:
                                  Colors.blue, // Custom color when selected
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: text(
                                  context,
                                  "${_questions[index]}",
                                  fontWeight: FontWeight.w400,
                                  fontfamily: "Poppins",
                                  textAlign: TextAlign.start,
                                  14,
                                  color: color11),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: h * 0.13,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Color(0xffA5BECC), width: 0.5)),
                      child: TextFormField(
                        cursorColor: Color(0xff8856F4),
                        scrollPadding: const EdgeInsets.only(top: 5),
                        controller: _descriptionController,
                        textInputAction: TextInputAction.done,
                        maxLines: 100,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 10, top: 10),
                          hintText: "Other Comment",
                          hintStyle: TextStyle(
                            fontSize: 15,
                            letterSpacing: 0,
                            height: 1.2,
                            color: Color(0xffAFAFAF),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          filled: true,
                          fillColor: Color(0xffffffff),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide:
                                BorderSide(width: 1, color: Color(0xffD0CBDB)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            borderSide:
                                BorderSide(width: 1, color: Color(0xffD0CBDB)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 38,
                      width: w,
                      decoration: BoxDecoration(
                          color: color4,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: color1, width: 0.5)),
                      child: Center(
                        child: text(
                            context,
                            "Continue",
                            fontWeight: FontWeight.w400,
                            fontfamily: "Poppins",
                            textAlign: TextAlign.start,
                            14,
                            color: color1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
