import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class StatsDetailWidget extends StatelessWidget {
  String title;
  String value;

  StatsDetailWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: primaryTextStyle()),
          Text(
            value,
            style: primaryTextStyle(),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
