import 'package:lnwcoin/component/date_picker_for_chart.dart';
import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/coin_detail_model.dart';

class MarketTypeBasedOnDateComponent extends StatefulWidget {
  static String tag = '/MarketTypeBasedOnDateComponent';
  final Function()? onUpdate;
  final CoinDetailModel? data;

  MarketTypeBasedOnDateComponent({this.onUpdate, this.data});

  @override
  MarketTypeBasedOnDateComponentState createState() => MarketTypeBasedOnDateComponentState();
}

class MarketTypeBasedOnDateComponentState extends State<MarketTypeBasedOnDateComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        String getText() {
          String value;
          if (chartStore.mIsDateSelected == true) {
            value = '${'lbl_select_range'.translate} [${chartStore.mFromDate?.toString().getFormattedDate} to ${chartStore.mToDate?.toString().getFormattedDate} ] ';
          } else {
            value = 'lbl_select_range'.translate;
          }
          return value;
        }

        return Row(
          children: [
            Container(
              child: TextIcon(
                text: getText(),
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: context.cardColor,
                    context: context,
                    builder: (context) {
                      return DatePickerForChart();
                    },
                  );
                },
              ),
            ).expand(),
            Observer(builder: (context) {
              return IconButton(
                icon: Icon(appStore.isItemInFav(id: widget.data!.id.validate()) ? Icons.favorite_outlined : Icons.favorite_outline, size: 28, color: themePrimaryColor),
                onPressed: widget.onUpdate,
              );
            })
          ],
        );
      },
    );
  }
}
