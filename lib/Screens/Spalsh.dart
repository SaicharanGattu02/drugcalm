import 'package:drugcalm/Authentication/SignIn.dart';
import 'package:drugcalm/Screens/Home.dart';
import 'package:drugcalm/Screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../Services/otherservices.dart';
import '../providers/ConnectivityProviders.dart';
import '../utils/Preferances.dart';
import 'OnBoardingScreen1.dart';
import '../utils/ThemeProvider.dart';
import '../utils/ColorConstrants.dart';
import 'Permission.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  String token="";
  String onboard_status="";
  bool permissions_granted=false;

  @override
  void initState() {
    Fetchdetails();
    _checkPermissions();
    Provider.of<ConnectivityProviders>(context,listen: false).initConnectivity();
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return (onboard_status == "")
              ? OnboardingPageView()
              : (token != "")
              ? (permissions_granted ? Dashbord() : MyPermission())
              : (permissions_granted ? SignIn() : MyPermission());
        }),
      );
    });

  }

  Future<void> _checkPermissions() async {
    Map<Permission, PermissionStatus> statuses = {
      Permission.location: await Permission.location.status,
      Permission.camera: await Permission.camera.status,
      Permission.notification: await Permission.notification.status,
      Permission.storage: await Permission.storage.status,
    };

    bool allPermissionsGranted = statuses.values.every((status) => status.isGranted);

    setState(() {
      permissions_granted = allPermissionsGranted;
    });
  }

  Fetchdetails() async {
    var Token = (await PreferenceService().getString('token'))??"";
    var status = (await PreferenceService().getString('onboard_status'))??"";
    setState(() {
      token=Token;
      onboard_status=status;
    });
    print("Token:${token}");
    print("onboard_status:${onboard_status}");
  }
  @override
  void dispose() {
    Provider.of<ConnectivityProviders>(context,listen: false).dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final connectiVityStatus =Provider.of<ConnectivityProviders>(context);

    return
      (connectiVityStatus.isDeviceConnected == "ConnectivityResult.wifi" ||
          connectiVityStatus.isDeviceConnected == "ConnectivityResult.mobile")
          ?


      Scaffold(
      body: GradientBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/drugcalm.png",
                fit: BoxFit.contain,
                height: h * 0.15,
                width: w * 0.3,
              ),
              SizedBox(height: h * 0.024),
              Text(
                'DrugCalm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: h * 0.008),
              Text(
                'Pharmacy App',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    ):NoInternetWidget();
  }
}


