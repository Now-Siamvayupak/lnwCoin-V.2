import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/coin_detail_model.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/utils/get_detail_view_currency.dart';
import 'package:lnwcoin/widgets/increment_decrement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class CoinDetailComponent extends StatefulWidget {
  CoinDetailModel data;
  DashboardType dashboardType;
  final Function()? onUpdate;

  CoinDetailComponent({required this.data, this.dashboardType = DashboardType.DASHBOARD_1, this.onUpdate});

  @override
  _CoinDetailComponentState createState() => _CoinDetailComponentState();
}

class _CoinDetailComponentState extends State<CoinDetailComponent> {
  CoinDetailModel? data;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    data = widget.data;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.dashboardType) {
      case DashboardType.DASHBOARD_1:
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('lbl_price'.translate, style: secondaryTextStyle()),
                      6.height,
                      Text(
                        '${appStore.mSelectedCurrency!.symbol.validate()}${getPercentageValueInCurrency(widget.data.market_data!.current_price!).validate()}',
                        style: boldTextStyle(size: 16),
                      ),
                    ],
                  ).expand(),
                  6.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('lbl_market_cap'.translate, style: secondaryTextStyle()),
                      6.height,
                      FittedBox(
                        child: Text(
                          '${appStore.mSelectedCurrency!.symbol.validate()}${getPercentageValueInCurrency(widget.data.market_data!.market_cap!).validate().amountPrefix}',
                          style: boldTextStyle(size: 16),
                        ),
                      ),
                    ],
                  ).expand(),
                  6.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('lbl_volume_24H'.translate, style: secondaryTextStyle()),
                      6.height,
                      Text(
                        '${appStore.mSelectedCurrency!.symbol.validate()}${getPercentageValueInCurrency(widget.data.market_data!.total_volume!).validate().amountPrefix}',
                        style: boldTextStyle(size: 16),
                      ),
                    ],
                  ).expand(),
                ],
              ),
              getPercentageValueInCurrency(widget.data.market_data!.price_change_percentage_1h_in_currency!).validate().isNegative
                  ? TextIcon(
                      edgeInsets: EdgeInsets.all(0),
                      prefix: IncrementDecrementWidget(
                        isDecrease: true,
                        size: 8,
                      ),
                      text: '${getPercentageValueInCurrency(widget.data.market_data!.price_change_percentage_1h_in_currency!).validate().toStringAsFixed(2)}%',
                      textStyle: primaryTextStyle(color: dangerColor),
                    )
                  : TextIcon(
                      edgeInsets: EdgeInsets.all(0),
                      prefix: IncrementDecrementWidget(
                        isDecrease: false,
                        size: 8,
                      ),
                      text: '${getPercentageValueInCurrency(widget.data.market_data!.price_change_percentage_1h_in_currency!).validate().toStringAsFixed(2)}%',
                      textStyle: primaryTextStyle(color: successColor),
                    ),
            ],
          ),
        );
      case DashboardType.DASHBOARD_2:
        return Container(
          width: context.width(),
          child: Column(
            children: [
              16.height,
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichTextWidget(
                        list: [
                          TextSpan(text: widget.data.name.validate(), style: secondaryTextStyle(size: 16)),
                          TextSpan(text: " (${widget.data.symbol.validate().toUpperCase()})", style: secondaryTextStyle(size: 16)),
                        ],
                      ),
                      6.height,
                      Text(
                        '${appStore.mSelectedCurrency!.symbol.validate()} ${getPercentageValueInCurrency(widget.data.market_data!.current_price!).validate()}',
                        style: boldTextStyle(size: 18),
                      ),
                      6.height,
                      TextIcon(
                        edgeInsets: EdgeInsets.all(0),
                        text: '${appStore.mSelectedCurrency!.symbol.validate()}${getPercentageValueInCurrency(widget.data.market_data!.market_cap!).validate().amountPrefix}',
                        prefix: Icon(
                          Icons.import_export_outlined,
                          size: 16,
                        ),
                      ),
                    ],
                  ).expand(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      getPercentageValueInCurrency(widget.data.market_data!.price_change_percentage_1h_in_currency!).validate().isNegative
                          ? Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(color: dangerColor.withOpacity(0.15), borderRadius: radius(20)),
                              child: TextIcon(
                                edgeInsets: EdgeInsets.all(0),
                                prefix: IncrementDecrementWidget(
                                  isDecrease: true,
                                  size: 8,
                                ),
                                text: '${getPercentageValueInCurrency(widget.data.market_data!.price_change_percentage_1h_in_currency!).validate().toStringAsFixed(2)}%',
                                textStyle: primaryTextStyle(color: dangerColor, weight: FontWeight.w200, size: 18),
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(color: successColor.withOpacity(0.15), borderRadius: radius(20)),
                              child: TextIcon(
                                edgeInsets: EdgeInsets.all(0),
                                prefix: IncrementDecrementWidget(
                                  isDecrease: false,
                                  size: 8,
                                ),
                                text: '${getPercentageValueInCurrency(widget.data.market_data!.price_change_percentage_1h_in_currency!).validate().toStringAsFixed(2)}%',
                                textStyle: primaryTextStyle(color: successColor, weight: FontWeight.w200),
                              ),
                            ),
                      Observer(builder: (context) {
                        return IconButton(
                          icon: Icon(appStore.isItemInFav(id: widget.data.id.validate()) ? Icons.favorite_outlined : Icons.favorite_outline, size: 28, color: themePrimaryColor),
                          onPressed: widget.onUpdate!,
                        );
                      })
                    ],
                  ),
                ],
              )
            ],
          ),
        );
    }
  }
}
