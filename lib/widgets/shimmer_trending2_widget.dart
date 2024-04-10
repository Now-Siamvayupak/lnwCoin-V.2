import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class Shimmer2Widget extends StatelessWidget {
  double width;
  double height;

  Shimmer2Widget({this.width = 190, this.height = 220});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[500]!,
        child: Container(
          width: width,
          height: height,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 10,
                    width: 120,
                    alignment: Alignment.center,
                    decoration: boxDecorationDefault(color: Colors.green, borderRadius: radius()),
                  ),
                  Container(
                    height: 10,
                    width: 120,
                    alignment: Alignment.center,
                    decoration: boxDecorationDefault(color: Colors.green, borderRadius: radius()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
