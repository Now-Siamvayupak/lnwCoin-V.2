import 'package:lnwcoin/utils/app_common.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class LinearProgressWidget extends StatelessWidget {
  int? value;
  Color? selectedColor;

  LinearProgressWidget({this.value, this.selectedColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          height: 6,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: radius(20),
            color: Colors.grey,
          ),
          duration: 200.milliseconds,
        ),
        AnimatedContainer(
          height: 6,
          width: value.validate() * 10,
          decoration: BoxDecoration(
            borderRadius: radius(20),
            color: selectedColor ?? getExchangeColor(value.validate()),
          ),
          duration: 200.milliseconds,
        )
      ],
    );
  }
}
