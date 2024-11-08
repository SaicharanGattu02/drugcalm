import 'package:drugcalm/Screens/AddAddress.dart';
import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SelectAddress extends StatefulWidget {
  const SelectAddress({super.key});

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  bool _isSelected = false;
  void _onRadioChanged(bool? value) {
    setState(() {
      _isSelected = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar1(title: 'SELECT ADDRESS', actions: []),
      body: Container(
        width: w,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/Drug Clam Background.png',
                ),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(
              context,
              'Your Shipping Address',
              15,
              fontWeight: FontWeight.w400,
              fontfamily: 'Inter',
              color: color18,
            ),
            for (int i = 1; i <= 2; i++)
              container(context,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  margin: EdgeInsets.only(top: 16),
                  colors: color4,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: color22, width: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Radio<bool>(
                        activeColor: color1,
                        value: true,
                        groupValue: _isSelected,
                        onChanged: _onRadioChanged,
                      ),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      SizedBox(
                        width: w * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              context,
                              'Prashanth chary',
                              15,
                              fontWeight: FontWeight.w400,
                              fontfamily: 'Inter',
                              color: color18,
                            ),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            text(
                              context,
                              '303, The Platina, A-Block, Jayabheri Enclave,Gachibowli, Hyderabad, Telangana 500032',
                              14,
                              fontWeight: FontWeight.w400,
                              color: color,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            Row(
                              children: [
                                text(
                                  context,
                                  'Mobile No:',
                                  14,
                                  fontWeight: FontWeight.w400,
                                  color: color,
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                text(
                                  context,
                                  '7674952516',
                                  14,
                                  fontWeight: FontWeight.w400,
                                  color: color,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      InkResponse(
                        onTap: () {},
                        child: Image.asset(
                          'assets/DOT.png',
                          height: h * 0.015,
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color1,
        shape:CircleBorder(),

        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAddress()));
        },
        child: Icon(
          Icons.add,
          color: color4,
        ),
        mini: true,
      ),
    );
  }
}
