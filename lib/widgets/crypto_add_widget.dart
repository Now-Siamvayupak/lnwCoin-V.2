import 'package:lnwcoin/model/search_model.dart';
import 'package:lnwcoin/screens/add_portfolio_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'cached_network_image.dart';

// ignore: must_be_immutable
class CryptoAddWidget extends StatefulWidget {
  Coin coin;
  int? index;
  final Function() onSuccess;

  CryptoAddWidget({required this.coin, this.index, required this.onSuccess});

  @override
  _CryptoAddWidgetState createState() => _CryptoAddWidgetState();
}

class _CryptoAddWidgetState extends State<CryptoAddWidget> {
  bool isFollowing = false;

  @override
  void initState() {
    isFollowing = widget.coin.isFav.validate() == 1;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          cachedImage(widget.coin.large.validate(), height: 40, width: 40),
          12.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.coin.name.validate(), style: boldTextStyle()),
              Text(widget.coin.symbol.validate(), style: boldTextStyle()),
            ],
          ).expand(),
          /*AppButton(
            padding: EdgeInsets.all(8),
            onTap: () {
              if (isFollowing = !isFollowing) {
                SqliteMethods.updateFavoriteStatus(true, widget.coin).then((value) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  snackBar(
                    context,
                    title: '${'lbl_added'.translate} ${widget.coin.name} ${'lbl_to_favorites'.translate}',
                  );
                }).catchError((e) {
                  toast(e.toString());
                });
              } else {
                SqliteMethods.updateFavoriteStatus(false, widget.coin).then((value) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  snackBar(
                    context,
                    title: '${"lbl_removed".translate} ${widget.coin.name} ${'lbl_from_favorite'.translate}',
                  );
                }).catchError((e) {
                  toast(e.toString());
                });
              }
              widget.onSuccess.call();
            },
            color: isFollowing ? dangerColor : secondaryColor,
            text: isFollowing ? "lbl_remove".translate : "lbl_add".translate,
            textStyle: boldTextStyle(color: isFollowing ? Colors.white : Colors.black),
          )*/
        ],
      ),
    ).onTap(() async {
      AddPortfolioScreen(coinData: widget.coin).launch(
        context,
        pageRouteAnimation: PageRouteAnimation.Slide,
      );
    });
  }
}
