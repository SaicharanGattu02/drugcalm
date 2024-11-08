import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';

import 'ProductList.dart';

class SaltComposition extends StatefulWidget {
  const SaltComposition({super.key});

  @override
  State<SaltComposition> createState() => _SaltCompositionState();
}

class _SaltCompositionState extends State<SaltComposition> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar1(title: 'PRODUCT DETAIL', actions: []),
      body: SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/Drug Clam Background.png',
                ),
                fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  margin: EdgeInsets.only(bottom: 16),
                  w: w,
                  context,
                  borderRadius: BorderRadius.circular(8),
                  colors: color4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(context, 'Information about Paracetamol', 18,
                          fontfamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: color11),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      text(context, 'Paracetamol Uses', 14,
                          fontfamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: color11),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      text(
                          context,
                          'Paracetamol is used for pain relief and fever. It is used to relieve pain in conditions like headache, muscle pain, or dental pain.',
                          12,
                          fontfamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.left,
                          color: color),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      text(context, 'Common side effects of Paracetamol:', 16,
                          fontfamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.left,
                          color: color11),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Row(
                        children: [
                          Container(
                            width: w * 0.01,
                            height: h * 0.0038,
                            decoration: BoxDecoration(
                                color: color11,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          SizedBox(
                            width: w * 0.01,
                          ),
                          text(context, 'Nausea', 12,
                              fontfamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.left,
                              color: color),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: w * 0.01,
                            height: h * 0.0038,
                            decoration: BoxDecoration(
                                color: color11,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          SizedBox(
                            width: w * 0.01,
                          ),
                          text(context, 'Vomiting', 12,
                              fontfamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.left,
                              color: color),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: w * 0.01,
                            height: h * 0.0038,
                            decoration: BoxDecoration(
                                color: color11,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          SizedBox(
                            width: w * 0.01,
                          ),
                          text(context, 'Insomnia (difficulty in sleeping)', 12,
                              fontfamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.left,
                              color: color),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: w * 0.01,
                            height: h * 0.0038,
                            decoration: BoxDecoration(
                                color: color11,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          SizedBox(
                            width: w * 0.01,
                          ),
                          text(context, 'Headache', 12,
                              fontfamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.left,
                              color: color),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      text(context, 'How Paracetamol works:', 16,
                          fontfamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.left,
                          color: color11),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Container(
                          //   width: w * 0.01,
                          //   height: h * 0.0038,
                          //   decoration: BoxDecoration(
                          //     color: color11,
                          //     borderRadius: BorderRadius.circular(100),
                          //   ),
                          // ),
                          SizedBox(
                            width: w *
                                0.01, // Space between the container and the text
                          ),
                          // Text wrapped in an Expanded widget to take the remaining space
                          Expanded(
                            child: text(
                              context,
                              'Paracetamol is an analgesic (pain reliever) and anti-pyretic (fever reducer). It works by blocking the release of certain chemical messengers that cause pain and fever.',
                              12,
                              fontfamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.start,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Container(
                          //   width: w * 0.01,
                          //   height: h * 0.0038,
                          //   decoration: BoxDecoration(
                          //     color: color11,
                          //     borderRadius: BorderRadius.circular(100),
                          //   ),
                          // ),
                          SizedBox(
                            width: w *
                                0.01, // Space between the container and the text
                          ),
                          // Text wrapped in an Expanded widget to take the remaining space
                          Expanded(
                            child: text(
                              context,
                              'Vitamins D3 Helps in the absorption of calcium See More',
                              12,
                              fontfamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.start,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      text(context, 'Manufacturer / Marketing Address', 16,
                          fontfamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.left,
                          color: color11),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      text(
                        context,
                        'Mediqex Healthcare Solutions Private Limited..,G-03, 2120 Webster Street Jersey City, New Jersey 0730',
                        12,
                        fontfamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                        color: color,
                      ),
                    ],
                  )),
              text(context, 'Available Medicine', 18,
                  fontfamily: 'SFPD',
                  fontWeight: FontWeight.w500,
                  color: color11),
              SizedBox(
                height: h * 0.01,
              ),
              for (int i = 0; i <= 4; i++)
                InkResponse(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductList()));
                  },
                  child: container(context,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      margin: EdgeInsets.only(bottom: 10),
                      w: w,
                      borderRadius: BorderRadius.circular(8),
                      colors: color4,
                      child: Row(children: [
                        Stack(
                          children: [
                            Container(
                              height: h * 0.08,
                              padding: EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: color9, width: 1),
                                color: color4,
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/dolo250 Oral.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: h * 0.018,
                                child: Image.asset(
                                  'assets/prouduct labl.png',
                                  fit: BoxFit.contain,
                                  color: color,
                                  width: w * 0.18,
                                  height: h * 0.04,
                                )),
                          ],
                        ),
                        SizedBox(
                          width: w * 0.02,
                        ),
                        Container(
                          width: w * 0.38,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text(context, 'Calpol', 14,
                                  fontfamily: 'SFPD',
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.left,
                                  color: color11),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              text(
                                context,
                                'Glaxo SmithKline Pharmaceuticals Ltd',
                                12,
                                fontfamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.start,
                                color: color,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: w * 0.02,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                text(context, '₹12 ', 14,
                                    fontfamily: 'SFPD',
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.left,
                                    color: color11),
                                text(context, 'to ', 14,
                                    fontfamily: 'SFPD',
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.left,
                                    color: color11),
                                text(context, '₹673', 14,
                                    fontfamily: 'SFPD',
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.left,
                                    color: color11),
                              ],
                            ),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            text(
                              context,
                              '12 variant(s)',
                              12,
                              fontfamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.start,
                              color: color,
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: color1,
                          size: 14,
                        )
                      ])),
                )
            ],
          ),
        ),
      )),
    );
  }
}
