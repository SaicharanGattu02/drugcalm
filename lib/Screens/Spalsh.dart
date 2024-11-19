import 'package:drugcalm/Authentication/SignIn.dart';
import 'package:drugcalm/Screens/Home.dart';
import 'package:drugcalm/Screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/Preferances.dart';
import 'OnBoardingScreen1.dart';
import '../utils/ThemeProvider.dart';
import '../utils/ColorConstrants.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  String token="";
  String onboard_status="";

  @override
  void initState() {
    Fetchdetails();
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context){
          if(onboard_status == ""){
            return OnboardingPageView();
          }else if(token != ""){
            return Dashbord();
          }else{
            return SignIn();
          }
        }

            ),
      );
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
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;


    return Scaffold(
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
    );
  }
}


