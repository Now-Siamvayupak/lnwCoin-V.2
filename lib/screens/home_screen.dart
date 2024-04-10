import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:lnwcoin/component/sign_in_portfolio_component.dart';
import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/search_model.dart';
import 'package:lnwcoin/network/local_db/sqflite_methods.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/screens/dashboard_screen.dart';
import 'package:lnwcoin/screens/news_screen.dart';
import 'package:lnwcoin/screens/portfolio_screen.dart';
import 'package:lnwcoin/screens/search_screen.dart';
import 'package:lnwcoin/screens/setting_screen.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  int currentIndex = 0;

  DateTime? currentBackPressTime;
  List<Widget> dashBoardPages = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _controller.forward();

    dashBoardPages.add(DashboardScreen());
    dashBoardPages.add(SearchScreen());
    dashBoardPages.add(NewsScreen());
    dashBoardPages.add(SettingScreen());

    if (getBoolAsync(SharedPreferenceKeys.ADD_IS_FIRST, defaultValue: true)) {
      getCoinListForSearch.then((value) {
        setValue(SharedPreferenceKeys.ADD_IS_FIRST, false);
        value.coins.validate().forEach((element) {});
        Future.forEach(value.coins.validate(), (Coin element) async {
          await SqliteMethods.addCoins(element);
        });
      });
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          toast('lblBackPressMsg'.translate);
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: false,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            elevation: 8,
            backgroundColor: themePrimaryColor,
            child: Image.asset('images/app_images/portfolio.png', height: 28, width: 28, fit: BoxFit.cover, color: Colors.white),
            onPressed: () {
              !appStore.isLoggedIn
                  ? SignInPortFolioComponent().launch(context, pageRouteAnimation: PageRouteAnimation.Fade)
                  : PortFolioScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Fade);
            },
          ),
          body: dashBoardPages[currentIndex],
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: [
              Icons.dashboard_outlined,
              Icons.search,
              Icons.featured_play_list_outlined,
              Icons.settings,
            ],
            onTap: (int) {
              currentIndex = int;
              setState(() {});
            },
            activeIndex: currentIndex,
            backgroundColor: context.scaffoldBackgroundColor,
            splashRadius: 0,
            leftCornerRadius: 20,
            rightCornerRadius: 20,
            elevation: 8,
            height: 70,
            activeColor: themePrimaryColor,
            splashSpeedInMilliseconds: 500,
            inactiveColor: appStore.isDarkMode ? Colors.white70 : Colors.black,
            notchSmoothness: NotchSmoothness.softEdge,
            gapLocation: GapLocation.center,
          ),
        ),
      ),
    );
  }
}
