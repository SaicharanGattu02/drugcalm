import 'package:drugcalm/Screens/CategoriesScreen.dart';
import 'package:drugcalm/Screens/Community.dart';
import 'package:drugcalm/Screens/Home.dart';
import 'package:drugcalm/Screens/SubScription.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Services/otherservices.dart';
import '../providers/ConnectivityProviders.dart';
import 'WishListScreen.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  // Ensure each index corresponds to a unique screen
  final List<Widget> _screens = [
    Home(),
    Wishlistscreen(),
    Subscription(),
    Community(),
    CategoriesScreen()
  ];

  final PageController _pageController = PageController();

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    Provider.of<ConnectivityProviders>(context, listen: false).initConnectivity();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    Provider.of<ConnectivityProviders>(context,listen: false).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var connectiVityStatus =Provider.of<ConnectivityProviders>(context);
    return
      (connectiVityStatus.isDeviceConnected == "ConnectivityResult.wifi" ||
          connectiVityStatus.isDeviceConnected == "ConnectivityResult.mobile")
          ?

      Scaffold(
      key: _scaffoldKey,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -1),
              blurRadius: 10,
              color: (_selectedIndex != 0)
                  ? Colors.grey.withOpacity(0.5)
                  : Colors.grey.withOpacity(0),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: color1,
          unselectedItemColor: color2,
          selectedFontSize: 11.0,
          unselectedFontSize: 9.0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/Home.png',
                  width: w * .08,
                  height: h * 0.03,
                  color: _selectedIndex == 0 ? color1 : color2),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/fav.png',
                  width: w * .08,
                  height: h * 0.03,
                  color: _selectedIndex == 1 ? color1 : color2),
              label: 'WHISHLIST',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/pro.png',
                  width: w * .08,
                  height: h * 0.03,
                  color: _selectedIndex == 2 ? color1 : color2),
              label: 'PRO',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/community.png',
                  width: w * .08,
                  height: h * 0.03,
                  color: _selectedIndex == 3 ? color1 : color2),
              label: 'COMMUNITY',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/categories.png',
                  width: 25,
                  height: 25,
                  color: _selectedIndex == 4 ? color1 : color2),
              label: 'CATEGORIES',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: onTabTapped,
        ),
      ),
    )
          :NoInternetWidget();
  }
}

