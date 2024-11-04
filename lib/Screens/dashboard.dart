import 'package:drugcalm/Screens/Home.dart';
import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  final List<Widget> _screens = [Home()];
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
  void dispose() {
    _pageController
        .dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        actions: <Widget>[Container()],
        toolbarHeight: h * 0.17,
        backgroundColor: color1,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkResponse(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/dclogo1.png",
                          width: w * 0.1,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 12),
                        Image.asset(
                          "assets/dc1.png",
                          width: w * 0.25,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/notifications.png",
                          width: 28,
                          height: 28,
                          color: Color(0xffffffff),
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: w * 0.02,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/cart.png",
                          width: 28,
                          height: 28,
                          color: Color(0xffffffff),
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: w * 0.02,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: ClipOval(
                          child: CircleAvatar(
                            radius: w * 0.038,
                            child: Image.asset(
                              "assets/profile.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/location.png",
                    width: w * 0.08,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Container(
                width: w,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(8)),
                child:
                Row(
                  children: [
                    Text(
                      "Search",
                      style: TextStyle(
                          color: Color(0xff9E7BCA),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: "Nunito"),
                    ),
                    Spacer(),
                    Image.asset(
                      "assets/search.png",
                      width: 22,
                      height: 22,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: w * 0.02),
                    Image.asset(
                      "assets/filter.png",
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: w * 0.02),
                    Image.asset(
                      "assets/mic.png",
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
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
              label: 'CART',
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
          onTap: onTabTapped, // Change the selected tab
        ),
      ),
    );
  }
}
