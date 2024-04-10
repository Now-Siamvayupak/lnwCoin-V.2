import 'package:lnwcoin/model/search_model.dart';
import 'package:lnwcoin/network/local_db/sqflite_methods.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class CryptoFollowWidget extends StatefulWidget {
  Coin coin;
  int? index;
  final Function() onSuccess;

  CryptoFollowWidget({required this.coin, this.index, required this.onSuccess});

  @override
  _CryptoFollowWidgetState createState() => _CryptoFollowWidgetState();
}

class _CryptoFollowWidgetState extends State<CryptoFollowWidget> {
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
              4.height,
              Text(widget.coin.symbol.validate(), style: secondaryTextStyle()),
            ],
          ).expand(),
          AppButton(
            padding: EdgeInsets.all(8),
            onTap: () {
              if (isFollowing = !isFollowing) {
                SqliteMethods.updateFavoriteStatus(1, widget.coin.id.toString()).then((value) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  snackBar(
                    context,
                    title: '${'lbl_added'.translate} ${widget.coin.name} ${'lbl_to_favorite'.translate}',
                  );
                }).catchError((e) {
                  toast(e.toString());
                });
              } else {
                SqliteMethods.updateFavoriteStatus(0, widget.coin.id.toString()).then((value) {
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
            color: isFollowing ? dangerColor : themePrimaryColor,
            text: isFollowing ? "lbl_remove".translate : "lbl_add".translate,
            textStyle: primaryTextStyle(color: white),
          )
        ],
      ),
    ).onTap(() {
      getSelectedDetailScreen(
        name: widget.coin.name.validate(),
        id: widget.coin.id.validate(),
        image: widget.coin.large.validate(),
      ).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
    });
  }
}
