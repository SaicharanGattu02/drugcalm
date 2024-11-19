import 'package:drugcalm/utils/ColorConstrants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/Preferances.dart';
import '../utils/constants.dart';
import 'Permission.dart';

class OnboardingPageView extends StatefulWidget {
  @override
  _OnboardingPageViewState createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;



  @override
  void initState() {
    super.initState();
    PreferenceService().saveString("onboard_status","1");
  }



  final List<Map<String, String>> _onboardingData = [

    {
      "title": "Home Delivery of Medicines",
      "description":
          "DrugCalm is a part of 50 lakh families for ordering medicines & booking diagnostic tests. Get Guaranteed Rs.50 DrugCalm Credits with our On-Time Promise Benefit.",
      "image": "assets/animations/onboarding1.json",
    },
    {
      "title": "Order Medicine at Wholesale",
      "description":
          "DrugCalm is a B2B E-Commerce platform for Pharmaceutical Products for Distributors, Stockists and Retail Drug Stores serving the entire nation.",
      "image": "assets/animations/onboarding2.json",
    },
    {
      "title": "Consult for B2B Customers",
      "description":
          "Marketing goals, expectations, and talent needs have changed. We help B2B marketing leaders navigate this new terrain and build the necessary capabilities. ",
      "image": "assets/animations/onboarding3.json",
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _nextPage() {
    if (_currentIndex < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyPermission()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Padding(
          padding: const EdgeInsets.only(top: 24,left: 16,right: 16),
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return OnboardingContent(currentIndex: _currentIndex,
                title: _onboardingData[index]["title"]!,
                description: _onboardingData[index]["description"]!,
                image: _onboardingData[index]["image"]!,
              );
            },
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkResponse(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPermission()));
            },
              child:
              Container(
                  margin: EdgeInsets.all(16),
                  height: h * 0.053,
                  width: w,
                  decoration: BoxDecoration(
                      gradient: lineargradient,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Text(
                    'GET STARTED',
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        height: 21.78 / 18,
                        letterSpacing: 1),
                  ))),
            ),
            
            
            Container(
              padding: EdgeInsets.only(left: 16,bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // if (_currentIndex > 0)
                    TextButton(
                      onPressed: () {
                        _pageController.jumpToPage(0);
                      },
                      child: text(context,'SKIP', 16),
                    ),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _onboardingData.length,
                    effect: WormEffect(
                      activeDotColor: color1,
                      radius: 10,
                      dotWidth: 12,
                      dotHeight: 12
                    ),
                  ),
                  TextButton(
                    onPressed: _nextPage,
                    child: text(context, 'NEXT', 16),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class OnboardingContent extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final int currentIndex;

  const OnboardingContent({
    required this.title,
    required this.description,
    required this.image,
    required this.currentIndex
  });

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(  mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: h*0.06,),
            Image.asset(
              'assets/dc.png',
              height: h * 0.15,
              width: w * 0.4,
              fit: BoxFit.contain,
            ),

            text(context,'${title}', 25,fontWeight: FontWeight.w600,color: color11),
            SizedBox(height: h * 0.024),
            text(context,'${description}', 14,color: color,fontWeight: FontWeight.w400),
            SizedBox(height: 20),
          ],
        ),
        Padding(
          padding:  EdgeInsets.only(
              left: currentIndex!=2?w*0.15:0),
          child: Lottie.asset(
            image,
            height: h * 0.3,
            width: currentIndex!=2 ?w * 0.4:w,
            fit: currentIndex!=2 ? BoxFit.cover: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
