import 'package:lnwcoin/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class NewMetricsWidget extends StatelessWidget {
  final String value;
  final String name;
  final Color? color;
  final bool isCurrencyAllowed;
  final isBorder;

  NewMetricsWidget({required this.value, required this.name, this.color, this.isCurrencyAllowed = true, this.isBorder = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width() / 2,
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(child: Text('$name', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w100, color: textPrimaryColorGlobal))),
              isCurrencyAllowed
                  ? FittedBox(child: Text('${appStore.mSelectedCurrency!.symbol.validate()}${value.validate()}', style: primaryTextStyle(color: color ?? textPrimaryColorGlobal, size: 14)))
                  : FittedBox(child: Text('${value.validate()}', style: primaryTextStyle(color: color ?? textPrimaryColorGlobal, size: 14))),
            ],
          )
        ],
      ),
    );
  }
}
