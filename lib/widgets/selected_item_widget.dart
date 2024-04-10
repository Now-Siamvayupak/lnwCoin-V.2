import 'package:lnwcoin/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectedItemWidget extends StatelessWidget {
  Decoration? decoration;
  double itemSize;

  SelectedItemWidget({this.decoration, this.itemSize = 22.0});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      decoration: decoration,
      child: Icon(Icons.check, color: themePrimaryColor, size: itemSize),
    );
  }
}
