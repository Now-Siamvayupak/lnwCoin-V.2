import 'package:lnwcoin/model/coin_detail_model.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class DescriptionComponent extends StatelessWidget {
  Description description;
  String name;

  DescriptionComponent({required this.description, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${'lbl_about'.translate} ${name.validate()}', style: boldTextStyle()),
          8.height,
          Text(AppCommon.parseHtmlString(description.en.toString()), style: secondaryTextStyle()),
        ],
      ),
    );
  }
}
