import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class ShimmerTrendingWidget1 extends StatelessWidget {
  double width;
  double height;

  ShimmerTrendingWidget1({this.width = 190, this.height = 260});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[500]!,
        child: Container(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(height: 30, width: 30, color: Colors.green).cornerRadiusWithClipRRect(30),
                  16.width,
                  Container(
                    height: 10,
                    decoration: boxDecorationDefault(color: Colors.green, borderRadius: radius()),
                  ).expand(),
                  16.width,
                  Container(height: 30, width: 30, color: Colors.green).cornerRadiusWithClipRRect(30),
                ],
              ),
              16.height,
              Sparkline(
                data: [
                  15.0,
                  18.0,
                  20.0,
                  17.0,
                  16.0,
                ],
                fillMode: FillMode.below,
                lineColor: Colors.red,
                lineWidth: 0.5,
                fillGradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.red.withOpacity(0.8), Colors.red.withOpacity(0.1)],
                ),
                fallbackHeight: 80,
                fallbackWidth: 120,
              ).center(),
              16.height,
              Container(
                height: 10,
                width: 120,
                alignment: Alignment.center,
                decoration: boxDecorationDefault(color: Colors.green, borderRadius: radius()),
              ).center(),
              Container(
                height: 10,
                width: 120,
                alignment: Alignment.center,
                decoration: boxDecorationDefault(color: Colors.green, borderRadius: radius()),
              ).center(),
            ],
          ),
        ),
      ),
    );
  }
}
