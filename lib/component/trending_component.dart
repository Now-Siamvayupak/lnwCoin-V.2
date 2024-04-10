import 'package:lnwcoin/model/trending_model.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class TrendingComponent extends StatefulWidget {
  TrendingModel data;

  TrendingComponent({required this.data});

  @override
  _TrendingComponentState createState() => _TrendingComponentState();
}

class _TrendingComponentState extends State<TrendingComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('lbl_trending_crypto'.translate, style: boldTextStyle(size: 22)).paddingAll(16),
          HorizontalList(
            itemCount: widget.data.coins!.length,
            spacing: 16,
            runSpacing: 16,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            itemBuilder: (context, index) {
              return getSelectedTrendingWidget(trendingItemData: widget.data.coins![index].item!);
            },
          ),
        ],
      ),
    );
  }
}
