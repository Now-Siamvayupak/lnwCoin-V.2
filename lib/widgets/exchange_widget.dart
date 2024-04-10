import 'package:lnwcoin/model/exchnages_response.dart';
import 'package:lnwcoin/screens/exchanges_detail_screen.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class ExchangesWidget extends StatelessWidget {
  ExchangesResponse data;

  ExchangesWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Text(data.trust_score_rank.validate().toString(), style: boldTextStyle()),
          16.width,
          cachedImage(data.image.validate(), height: 35, width: 35).cornerRadiusWithClipRRect(80),
          16.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${data.name.validate()}', style: boldTextStyle()),
              8.height,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
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
                        width: data.trust_score.validate() * 10,
                        decoration: BoxDecoration(
                          borderRadius: radius(20),
                          color: getExchangeColor(data.trust_score.validate()),
                        ),
                        duration: 200.milliseconds,
                      )
                    ],
                  ),
                  6.width,
                  Text('${data.trust_score.validate()}', style: primaryTextStyle(size: 14)),
                ],
              ),
            ],
          ).expand(),
          Text('${data.trade_volume_24h_btc.validate().toStringAsFixed(2)}', style: boldTextStyle()),
          16.width,
        ],
      ),
    ).onTap(splashColor: themePrimaryColor, () {
      ExchangesDetailScreen(data: data).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
    });
  }
}
