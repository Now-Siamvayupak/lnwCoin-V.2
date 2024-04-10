import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:flutter/material.dart';

class IncrementDecrementWidget extends StatelessWidget {
  final bool isDecrease;
  final int? size;

  IncrementDecrementWidget({this.isDecrease = false, this.size});

  @override
  Widget build(BuildContext context) {
    return isDecrease
        ? Image.asset(
            AppImages.decrementImage,
            scale: 5,
            color: dangerColor,
          )
        : Image.asset(
            AppImages.incrementImage,
            scale: 5,
            color: successColor,
          );
  }
}
