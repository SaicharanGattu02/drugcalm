import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';

import '../utils/CustomAppBar1.dart';
import '../utils/constants.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}
final List<Map<String, String>> items1 = [
  {
    'image': 'assets/man.png',
    'title': 'Allopathy',
    'subtitle': 'All Pixl Company Employees.'
  },
  {
    'image': 'assets/ayurvedic.png',
    'title': 'Ayurvedic/Herbal',
    'subtitle': 'All Pixl Designers Employees.'
  },
  {
    'image': 'assets/ayurvedic.png',
    'title': 'Homeopathy ',
    'subtitle': 'All Pixl Developer Employees.'
  },
  {
    'image': 'assets/man.png',
    'title': 'Veterinary',
    'subtitle': 'All Pixl HR Team Employees.'
  },
  {
    'image': 'assets/man.png',
    'title': 'Diagnostic and radiology',
    'subtitle': 'All Pixl HR Team Employees.'
  },
  {
    'image': 'assets/man.png',
    'title': 'Cosmetic/Wellness Retailers',
    'subtitle': 'All Pixl HR Team Employees.'
  },
  {
    'image': 'assets/ayurvedic.png',
    'title': 'Surgical /Medical Equipment',
    'subtitle': 'All Pixl HR Team Employees.'
  },
];

final List<String> _images = [
  'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
  'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
  'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
  'https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80'
];


class _CommunityState extends State<Community> {

  List<Map<String, String>> filteredItems = items1;
  String searchQuery = "";

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      // Filter based only on title
      filteredItems = items1
          .where((item) => item['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  bool chat_selected=true;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar1(
        title: 'COMMUNITY',
        actions: [Container()],
      ),
      body: Container(
        width: w,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Drug Clam Background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: w,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: color4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap:(){
                      setState(() {
                        chat_selected=true;
                      });
                      },
                    child: Container(
                      height: 45,
                      width: w * 0.41,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                        color:chat_selected ? color1: Color(0xffEFF4F8)
                      ),
                      child: Center(
                        child: text(
                          context,
                          'Chat',
                          15,
                          color:chat_selected? color4 : color11,
                          fontfamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        chat_selected=false;
                      });
                    },
                    child: Container(
                      height: 45,
                      width: w * 0.41,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                        color: chat_selected ? Color(0xffEFF4F8) : color1,
                      ),
                      child: Center(
                        child: text(
                          context,
                          'Groups',
                          15,
                          color:chat_selected? color11 : color4,
                          fontfamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if(chat_selected)...[
              Expanded(  // Wrap the ListView with an Expanded widget
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: color4,
                  ),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/man.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(
                                      context,
                                      'Allocare Pharmacy',
                                      16,
                                      color: Colors.black,
                                      fontfamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Text(
                                      'Hyderabad',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff878C90),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Image.asset(
                                  'assets/chat.png',
                                  width: 19,
                                  height: 17,
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            DottedLine(dashColor:color,),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ]else...[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.only(top: 10,left: 5,right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: color4,
                  ),
                  child: ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      // The item widget
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    filteredItems[index]['image']!,
                                    width: 48,
                                    height: 48,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: w * 0.65,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        filteredItems[index]['title']!,
                                        style: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w600,
                                          height: 19.36 / 16,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          FlutterImageStack(
                                            imageList: _images,
                                            totalCount: _images.length,
                                            showTotalCount: true,
                                            itemBorderWidth: 1,
                                            itemRadius: 25,
                                            extraCountTextStyle: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          text(
                                            context,
                                            'Active People',
                                            12,
                                            color: Color(0xff878C90),
                                            fontfamily: "Poppins",
                                            fontWeight: FontWeight.w500,
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Divider added here
                            SizedBox(height: 20,),
                            if (index != filteredItems.length - 1)
                              DottedLine(dashColor:color,),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color1,
        shape:CircleBorder(),
        onPressed: () {

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
