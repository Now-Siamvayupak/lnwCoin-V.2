import 'package:lnwcoin/model/price_model.dart';
import 'package:lnwcoin/model/search_model.dart';
import 'package:lnwcoin/network/local_db/sqflite_methods.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'cached_network_image.dart';
import 'increment_decrement_widget.dart';

class FavouriteGridviewWidget extends StatefulWidget {
  static String tag = '/FavouriteGridviewWidget';
  final Bitcoin? data;
  final Coin? coinData;
  final Function? onUpdate;

  FavouriteGridviewWidget({this.data, this.coinData, this.onUpdate});

  @override
  FavouriteGridviewWidgetState createState() => FavouriteGridviewWidgetState();
}

class FavouriteGridviewWidgetState extends State<FavouriteGridviewWidget> {
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
    return Container(
      padding: EdgeInsets.all(16),
      decoration: boxDecorationDefault(color: context.cardColor, borderRadius: radius(8)),
      width: context.width() / 2 - 16,
      child: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: addFavoriteIcon(onPressed: () {
                SqliteMethods.updateFavoriteStatus(0, widget.coinData!.id.toString()).then((value) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  snackBar(
                    context,
                    title: '${'lbl_removed'.translate} ${widget.coinData!.name} ${'lbl_from_favorite'.translate}',
                  );
                  widget.onUpdate!.call();
                }).catchError((e) {
                  log(e.toString());
                });
              })),
          cachedImage(widget.coinData!.large.validate(), height: 50).cornerRadiusWithClipRRect(80),
          16.height,
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${widget.coinData!.name.validate()}", style: primaryTextStyle(), maxLines: 1),
              4.height,
              Text(widget.coinData!.market_cap_rank.toString().validate(), style: secondaryTextStyle(size: 14)),
              4.height,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IncrementDecrementWidget(isDecrease: widget.data!.inr_24h_change.validate().isNegative, size: 12),
                  6.width,
                  Text(
                    '${widget.data!.inr_24h_change.validate().toStringAsFixed(2)}%',
                    style: secondaryTextStyle(color: widget.data!.inr_24h_change.validate().getAmountForColor),
                  )
                ],
              ),
              8.height,
              Text("${appStore.mSelectedCurrency?.symbol.validate()}${widget.data!.inr.validate().amountPrefix}", style: boldTextStyle(size: 14)),
            ],
          )
        ],
      ),
    );
  }
}
