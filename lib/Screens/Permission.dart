import 'package:drugcalm/utils/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../Authentication/SignIn.dart';
import '../utils/Preferances.dart';
import '../utils/ThemeProvider.dart';
import '../utils/constants.dart';

class MyPermission extends StatefulWidget {
  const MyPermission({super.key});
  @override
  State<MyPermission> createState() => _MyPermissionState();
}

class _MyPermissionState extends State<MyPermission> {
  @override
  void initState() {
    super.initState();
    Fetchdetails();
  }

  String token = "";

  Fetchdetails() async {
    var Token = (await PreferenceService().getString('token')) ?? "";
    setState(() {
      token = Token;
    });
    print("Token:${token}");
  }

  Future<void> _requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.camera,
      Permission.sms,
      Permission.storage,
      // Permission.notification,
      // Permission.microphone,
    ].request();
    // Check each permission status and print it to the console
    statuses.forEach((permission, status) {
      print('$permission: $status');
    });
    // Handle permissions that are denied
    if (statuses[Permission.sms]!.isDenied ||
        statuses[Permission.notification]!.isDenied) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Permissions Required'),
            content: Text(
                'SMS and Notifications permissions are required for the app to function properly. Please grant these permissions to proceed.'),
            actions: [
              TextButton(
                child: Text('Retry'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await [
                    Permission.sms,
                    Permission.notification,
                  ].request();

                  if (await Permission.sms.isGranted &&
                      await Permission.notification.isGranted) {
                    if (token != "") {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MyMainHome()),
                      // );
                    } else {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MySignup()),
                      // );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Please grant all permissions to proceed.'),
                      ),
                    );
                  }
                },
              ),
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (statuses.values.every((status) => status.isGranted)) {
      if (token != "") {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => MyMainHome()),
        // );
      } else {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => MySignup()),
        // );
      }
    } else {
      // Handle the case where some permissions are not granted
      _showPermissionDeniedDialog();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please grant all permissions to proceed.'),
        ),
      );
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Permission Required'),
          content: Text(
              'Fincalis app needs all permissions mentioned above. Please grant the permission to proceed.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Retry'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _openAppSettings(); // Optionally, direct user to app settings
              },
              child: Text('Settings'),
            ),
          ],
        );
      },
    );
  }

  void _openAppSettings() async {
    await openAppSettings();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'APP PERMISSIONS',
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPermissionItem(
                    icon: "assets/Location.png",
                    title: "Location",
                    description:
                        "Scientiam pollicetur quam on eat mirum sapien tiae cupido patria esse cariorem Qua igitur ab deo vincitur si aeternitate non",
                  ),
                  _buildPermissionItem(
                    icon: "assets/camera.png",
                    title: "Camera",
                    description:
                        "Scientiam pollicetur quam on eat mirum sapien tiae cupido patria esse cariorem igitur",
                  ),
                  _buildPermissionItem(
                    icon: "assets/gallery.png",
                    title: "Photo / Media / Files",
                    description:
                        "Scientiam pollicetur quam on eat mirum sapien tiae cupido patria esse cariorem Qua igitur ab deo vincitur si aeternitate non ",
                  ),
                  _buildPermissionItem(
                    icon: "assets/message.png",
                    title: "SMS",
                    description:
                        "Scientiam pollicetur quam on eat mirum sapien tiae cupido patria esse cariorem Qua igitur ab deo vincitur si aeternitate non ",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20, left: 16, right: 16),
        child: containertext(context, 'GET STARTED', onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignIn()));
        }),
      ),
    );
  }

  Widget _buildPermissionItem({
    required String icon,
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0xFFCDE2FB),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Center(
                  child: Image.asset(
                    icon,
                    width: 18,
                    height: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7, left: 40),
          child: Text(
            description,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
