import 'package:lnwcoin/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MetricsWidget extends StatelessWidget {
  final String value;
  final String name;
  final Color? color;
  final bool isCurrencyAllowed;
  final isBorder;

  MetricsWidget({required this.value, required this.name, this.color, this.isCurrencyAllowed = true, this.isBorder = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        border: isBorder
            ? Border(
                bottom: BorderSide(color: Colors.grey.shade200, width: 0.3),
              )
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name.validate(), style: primaryTextStyle(size: 14)).expand(),
          isCurrencyAllowed
              ? FittedBox(child: Text('${appStore.mSelectedCurrency!.symbol.validate()}${value.validate()}', style: primaryTextStyle(color: color ?? textPrimaryColorGlobal)))
              : FittedBox(child: Text('${value.validate()}', style: primaryTextStyle(color: color ?? textPrimaryColorGlobal))),
        ],
      ),
    );
  }
}
