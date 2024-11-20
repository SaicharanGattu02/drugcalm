import 'package:drugcalm/Screens/Home.dart';
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
    _requestPermissions();
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
    // Request all necessary permissions
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.camera,
      Permission.storage,
      Permission.notification,
    ].request();

    // Check each permission status and print it
    statuses.forEach((permission, status) {
      print('$permission: $status');
    });

    // Check if all permissions are granted
    if (_areAllPermissionsGranted(statuses)) {
      // If all permissions are granted, navigate to the appropriate screen
      _navigateToAppropriateScreen();
    } else {
      // If any permission is denied, show a dialog asking the user to grant permissions
      _showPermissionDeniedDialog(statuses);
    }
  }

// Helper function to check if all permissions are granted
  bool _areAllPermissionsGranted(Map<Permission, PermissionStatus> statuses) {
    return statuses.values.every((status) => status.isGranted);
  }

// Function to show a dialog if permissions are denied
  Future<void> _showPermissionDeniedDialog(
      Map<Permission, PermissionStatus> statuses) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Permissions Required'),
          content: Text(
            'All permissions (Location, Camera, Storage, Notifications) are required for the app to function properly. Please grant all permissions to proceed.',
          ),
          actions: [
            TextButton(
              child: Text('Retry'),
              onPressed: () async {
                Navigator.of(context).pop();

                // Request all permissions again
                Map<Permission, PermissionStatus> newStatuses = await [
                  Permission.location,
                  Permission.camera,
                  Permission.storage,
                  Permission.notification,
                ].request();

                // If all permissions are granted, navigate to the appropriate screen
                if (_areAllPermissionsGranted(newStatuses)) {
                  _navigateToAppropriateScreen();
                } else {
                  // If not all permissions are granted, show the permission denied dialog again
                  _showPermissionDeniedDialog(newStatuses);
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
  }

// Function to handle navigation based on token
  void _navigateToAppropriateScreen() {
    if (token != "") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignIn()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'APP PERMISSIONS',
      ),
      body: Container(
        width: w,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/Drug Clam Background.png',
                ),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPermissionItem(
                      icon: "assets/location.png",
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20, left: 16, right: 16),
        child: containertext(context, 'GET STARTED',
            onTap: () {
              _requestPermissions();
        }),
      ),
    );
  }

  Widget _buildPermissionItem({
    required String icon,
    required String title,
    required String description,
  }) {
    return container(
      context,
      colors: color4,
      margin: EdgeInsets.only(top: 10),
      child: Column(
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
                      color: color11,
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
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 7,
            ),
            child: Text(
              description,
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                  color: color),
            ),
          ),
        ],
      ),
    );
  }
}
