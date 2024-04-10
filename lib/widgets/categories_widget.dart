import 'package:lnwcoin/model/categories_model.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'increment_decrement_widget.dart';

// ignore: must_be_immutable
class CategoriesWidget extends StatefulWidget {
  static String tag = '/CategoriesWidget';
  int? index;
  CategoriesModel categoriesModel;

  CategoriesWidget({this.index, required this.categoriesModel});

  @override
  CategoriesWidgetState createState() => CategoriesWidgetState();
}

class CategoriesWidgetState extends State<CategoriesWidget> {
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
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: boxDecorationDefault(color: context.cardColor, borderRadius: radius(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.categoriesModel.name.toString(), style: boldTextStyle()),
          16.height,
          Text("${appStore.mSelectedCurrency?.symbol.validate()}${widget.categoriesModel.volume_24h.validate().amountPrefix}", style: boldTextStyle(size: 14)),
          4.height,
          Row(
            children: [
              Text('lbl_24_h_volume'.translate, style: secondaryTextStyle()).expand(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IncrementDecrementWidget(isDecrease: widget.categoriesModel.market_cap_change_24h.validate().isNegative, size: 12),
                  6.width,
                  Text(
                    '${widget.categoriesModel.market_cap_change_24h.validate().toStringAsFixed(2)}%',
                    style: secondaryTextStyle(color: widget.categoriesModel.market_cap_change_24h.validate().getAmountForColor),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
