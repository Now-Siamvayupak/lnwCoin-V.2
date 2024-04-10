import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/coin_list_model.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/get_detail_view_currency.dart';
import 'package:lnwcoin/widgets/cached_network_image.dart';
import 'package:lnwcoin/widgets/coin_dialog_widget.dart';
import 'package:lnwcoin/widgets/increment_decrement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class CryptoDashboardWidget extends StatefulWidget {
  int? index;
  CoinListModel coinListModel;
  bool isFromDashboard;

  CryptoDashboardWidget({this.index, required this.coinListModel, this.isFromDashboard = false});

  @override
  _CryptoDashboardWidgetState createState() => _CryptoDashboardWidgetState();
}

class _CryptoDashboardWidgetState extends State<CryptoDashboardWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onLongPress: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (context, animation, secondaryAnimation) {
            return Container();
          },
          barrierDismissible: true,
          barrierColor: Colors.black.withOpacity(0.4),
          barrierLabel: '',
          transitionBuilder: (context, animation, secondaryAnimation, child) {
            return Transform.scale(
              scale: animation.value,
              child: AlertDialog(
                backgroundColor: context.cardColor,
                shape: RoundedRectangleBorder(side: BorderSide(color: context.cardColor), borderRadius: BorderRadius.circular(20)),
                content: CoinDialogWidget(coinData: widget.coinListModel, isFromDashboard: widget.isFromDashboard),
              ),
            );
          },
        );
      },
      onTap: () {
        getSelectedDetailScreen(
          name: widget.coinListModel.name.validate(),
          id: widget.coinListModel.id.validate(),
          image: widget.coinListModel.image.validate(),
        ).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
      },
      child: Container(
        decoration: boxDecorationDefault(borderRadius: radius(20), color: context.cardColor),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            cachedImage(widget.coinListModel.image.validate(), height: 40, width: 40).cornerRadiusWithClipRRect(80),
            12.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Marquee(
                  direction: Axis.horizontal,
                  directionMarguee: DirectionMarguee.oneDirection,
                  child: Text(
                    widget.coinListModel.name.validate(),
                    style: boldTextStyle(),
                  ),
                ),
                Text(widget.coinListModel.symbol.validate().toUpperCase(), style: secondaryTextStyle()),
              ],
            ).withWidth(90),
            6.width,
            Sparkline(
              data: widget.coinListModel.sparkline_in_7d!.price.validate(),
              useCubicSmoothing: true,
              cubicSmoothingFactor: 0.2,
              lineGradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: widget.isFromDashboard
                    ? [
                        widget.coinListModel.price_change_percentage_1h_in_currency.validate().getAmountForColor,
                        widget.coinListModel.price_change_percentage_1h_in_currency.validate().getAmountForColor
                      ]
                    : [getInterval(widget.coinListModel, coinStore.selectedIntervalType!).getAmountForColor, getInterval(widget.coinListModel, coinStore.selectedIntervalType!).getAmountForColor],
              ),
              fallbackHeight: 45,
            ).expand(flex: 2),
            16.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("${appStore.mSelectedCurrency?.symbol.validate()}${widget.coinListModel.current_price.validate().amountPrefix}", style: boldTextStyle()),
                widget.isFromDashboard
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IncrementDecrementWidget(isDecrease: widget.coinListModel.price_change_percentage_1h_in_currency.validate().isNegative, size: 12),
                          6.width,
                          Text(
                            '${widget.coinListModel.price_change_percentage_1h_in_currency.validate().toStringAsFixed(2)}%',
                            style: secondaryTextStyle(color: widget.coinListModel.price_change_percentage_1h_in_currency.validate().getAmountForColor),
                          )
                        ],
                      )
                    : Observer(
                        builder: (_) => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IncrementDecrementWidget(isDecrease: getInterval(widget.coinListModel, coinStore.selectedIntervalType!).isNegative, size: 12),
                            6.width,
                            Text(
                              '${getInterval(widget.coinListModel, coinStore.selectedIntervalType!).toStringAsFixed(2)}%',
                              style: secondaryTextStyle(color: getInterval(widget.coinListModel, coinStore.selectedIntervalType!).getAmountForColor),
                            )
                          ],
                        ),
                      ),
              ],
            )
          ],
        ),
      ),
    ).paddingBottom(16);
  }
}
