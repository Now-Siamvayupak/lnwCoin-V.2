import 'package:lnwcoin/model/categories_model.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/widgets/cached_network_image.dart';
import 'package:lnwcoin/widgets/stats_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'increment_decrement_widget.dart';

class CategoryDialogWidget extends StatefulWidget {
  final CategoriesModel categoriesData;

  CategoryDialogWidget({required this.categoriesData});

  @override
  CategoryDialogWidgetState createState() => CategoryDialogWidgetState();
}

class CategoryDialogWidgetState extends State<CategoryDialogWidget> {
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
    return SingleChildScrollView(
      child: Container(
        width: context.width(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(alignment: Alignment.topLeft, child: Text(widget.categoriesData.name.validate(), style: boldTextStyle())),
            16.height,
            Divider(),
            16.height,
            StatsDetailWidget(title: 'lbl_market_cap'.translate.capitalizeFirstLetter(), value: '${widget.categoriesData.market_cap.validate().amountPrefix}'),
            8.height,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('lbl_market_cap_h'.translate, style: primaryTextStyle()).expand(),
                IncrementDecrementWidget(isDecrease: widget.categoriesData.market_cap_change_24h.validate().isNegative, size: 12),
                6.width,
                Text(
                  '${widget.categoriesData.market_cap_change_24h.validate().toStringAsFixed(2)}%',
                  style: primaryTextStyle(color: widget.categoriesData.market_cap_change_24h.validate().getAmountForColor),
                ),
              ],
            ),
            8.height,
            StatsDetailWidget(title: "lbl_volume_h".translate, value: '${appStore.mSelectedCurrency?.symbol.validate()}${widget.categoriesData.volume_24h.validate().amountPrefix}'),
            16.height,
            ReadMoreText(
              "${widget.categoriesData.content.validate()}",
              style: secondaryTextStyle(),
              trimLines: 6,
              colorClickableText: Colors.white,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'lbl_show_more'.translate,
              trimExpandedText: 'lbl_show_less'.translate,
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('lbl_top_coin_hold_by'.translate, style: secondaryTextStyle(size: 12)),
                4.width,
                Text('${widget.categoriesData.name.validate()}', style: primaryTextStyle(size: 12)).expand()
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.categoriesData.top_3_coins.validate().length.validate(),
                (index) {
                  if (widget.categoriesData.top_3_coins![index].validate().isEmpty) {
                    return Offstage();
                  }
                  return cachedImage(widget.categoriesData.top_3_coins![index].validate(), height: 40, width: 40, fit: BoxFit.cover).paddingOnly(left: 8).cornerRadiusWithClipRRect(90);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
