import 'package:lnwcoin/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;

  // AppScaffold Widget

  AppScaffold({
    this.body,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: appBar,
        body: Stack(
          children: [
            if (body != null) body!,
            if (!appStore.isNetworkConnected)
              SafeArea(
                child: Container(
                  width: context.width(),
                  height: context.height(),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(errorInternetNotAvailable, style: boldTextStyle(), textAlign: TextAlign.center),
                  color: context.scaffoldBackgroundColor,
                ),
              ),
          ],
        ),
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
