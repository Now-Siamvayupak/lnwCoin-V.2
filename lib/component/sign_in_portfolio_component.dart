import 'package:lnwcoin/screens/login_screen.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/app_scaffold.dart';

class SignInPortFolioComponent extends StatefulWidget {
  static String tag = '/SignInPortFolioComponent';

  SignInPortFolioComponent();

  @override
  SignInPortFolioComponentState createState() => SignInPortFolioComponentState();
}

class SignInPortFolioComponentState extends State<SignInPortFolioComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text('lbl_portfolio'.translate, style: boldTextStyle()),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/app_images/app_logo.png', height: 80, width: 80, fit: BoxFit.cover),
              16.height,
              Text(AppConstant.appName, style: boldTextStyle(size: 22)),
              60.height,
              AppButton(
                width: context.width() * 0.6,
                text: "lbl_sign_in".translate,
                color: themePrimaryColor,
                shapeBorder: RoundedRectangleBorder(borderRadius: radius(defaultRadius)),
                onTap: () {
                  LoginScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                },
              ),
              16.height,
              Text('lbl_sign_in_view_your_portfolio'.translate, style: secondaryTextStyle()),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
