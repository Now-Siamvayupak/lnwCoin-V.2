import 'package:lnwcoin/screens/add_coin_to_portfolio.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class NoPortfolioWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/app_images/no_data_found.png', height: 160, width: 160, fit: BoxFit.cover),
        16.height,
        Text('lbl_no_coins'.translate, style: boldTextStyle(size: 20)),
        16.height,
        AppButton(
          text: "lbl_start_adding".translate,
          onTap: () {
            AddCoinToPortfolio().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
          },
        ),
      ],
    );
  }
}
