import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/network/local_db/sqflite_methods.dart';
import 'package:lnwcoin/screens/home_screen.dart';
import 'package:lnwcoin/screens/walkthrough_screen.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/utils/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(appStore.isDarkMode ? primaryColor : Colors.white);

    await 2.seconds.delay.then((value) => appLocalizations = AppLocalizations.of(context));
    if (isMobile) {
      localDbInstance = await SqliteMethods.initInstance();
    }

    if (getBoolAsync(SharedPreferenceKeys.IS_FIRST, defaultValue: true)) {
      1.seconds.delay.then((value) => WalkThroughScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Fade, isNewTask: true));
    } else {
      1.seconds.delay.then((value) => HomeScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Fade, isNewTask: true));
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: context.width(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(appStore.isDarkMode ? AppImages.gifWithName : AppImages.gifWithNameWhite),
            ],
          ),
        ),
      ),
    );
  }
}
