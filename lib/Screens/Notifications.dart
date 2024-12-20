import 'package:drugcalm/utils/CustomAppBar1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/otherservices.dart';
import '../providers/ConnectivityProviders.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final List<Map<String, String>> notifications = [
    // {
    //   'title': 'New Project Updated',
    //   'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    //   'time': 'Today 10:30 AM',
    //   'icon': 'assets/new.png',
    // },
    // {
    //   'title': 'Task Assigned',
    //   'description': 'You have been assigned a new task.',
    //   'time': '11:15 AM',
    //   'icon': 'assets/new.png',
    // },
    // {
    //   'title': 'Project Deadline',
    //   'description': 'The project deadline is approaching.',
    //   'time': '12:45 PM',
    //   'icon': 'assets/new.png',
    // },
    // Add more items as needed
  ];

  @override
  void initState() {
    Provider.of<ConnectivityProviders>(context, listen: false).initConnectivity();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<ConnectivityProviders>(context,listen: false).dispose();
    super.dispose();
  }

  bool _loading= false;
  @override
  Widget build(BuildContext context) {
    var connectiVityStatus =Provider.of<ConnectivityProviders>(context);
    return
      (connectiVityStatus.isDeviceConnected == "ConnectivityResult.wifi" ||
          connectiVityStatus.isDeviceConnected == "ConnectivityResult.mobile")
          ?

      Scaffold(
      backgroundColor: const Color(0xffF3ECFB),
      appBar:CustomAppBar1(title: "Notifications",actions: [Container()],),
      body:
      _loading?Center(child: CircularProgressIndicator(color: Color(0xff8856F4),)):

      Padding(
        padding: EdgeInsets.all(16),
        child: notifications.isEmpty
            ? Center(
          child: Text(
            'Coming Soon',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              color: Color(0xff6C848F),
              fontWeight: FontWeight.w500,
            ),
          ),
        )
            : ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    notification['icon'] ?? "assets/new.png",
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification['title'] ?? '',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            height: 18.15 / 15,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          notification['description'] ?? '',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: Color(0xff6C848F),
                            fontWeight: FontWeight.w400,
                            height: 16.09 / 14,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          notification['time'] ?? '',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: Color(0xff6C848F),
                            fontWeight: FontWeight.w400,
                            height: 14 / 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {},
                    child:
                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Color(0xffE5E5E5),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/cross.png",
                        color: Color(0xff6A2FA5),
                        width: 10,
                        height: 10,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ):NoInternetWidget();
  }
}
