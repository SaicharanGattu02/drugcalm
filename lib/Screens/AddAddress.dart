import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CustomAppBar1(title: 'ADD ADDRESS', actions: []),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: w,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/Drug Clam Background.png',
                      ),
                      fit: BoxFit.cover)),
              child: container(context,
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  borderRadius: BorderRadius.circular(8),
                  colors: color4,
                  w: w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(context, 'Pincode', 15,
                          fontWeight: FontWeight.w400, color: color)
                    ],
                  )),
            ),
          ],
        ));
  }
}
