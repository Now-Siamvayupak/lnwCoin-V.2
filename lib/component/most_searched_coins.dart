import 'package:lnwcoin/component/common_error_builder.dart';
import 'package:lnwcoin/model/trending_model.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MostSearchedCoins extends StatefulWidget {
  @override
  _MostSearchedCoinsState createState() => _MostSearchedCoinsState();
}

class _MostSearchedCoinsState extends State<MostSearchedCoins> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SnapHelperWidget<TrendingModel>(
      future: getTrendingList,
      loadingWidget: Offstage(),
      errorBuilder: (p0) => CommonErrorBuilder(text: p0),
      onSuccess: (snap) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('lbl_most_search_coins_in_last_24_hours'.translate, style: boldTextStyle(size: 18)).paddingSymmetric(horizontal: 16),
              16.height,
              HorizontalList(
                itemBuilder: (BuildContext context, int index) {
                  Coin data = snap.coins![index];
                  return Container(
                    padding: EdgeInsets.all(16),
                    decoration: boxDecorationDefault(color: context.cardColor, borderRadius: radius(8)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            cachedImage(data.item!.large.validate(), height: 30).cornerRadiusWithClipRRect(80),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.item!.name.validate(), style: primaryTextStyle()),
                                Text(data.item!.symbol.validate(), style: secondaryTextStyle(size: 14)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ).onTap(() {
                    getSelectedDetailScreen(
                      name: data.item!.name.validate(),
                      id: data.item!.id.validate(),
                      image: data.item!.large.validate(),
                    ).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                  }, borderRadius: radius(8));
                },
                itemCount: snap.coins!.length.validate(),
              ),
            ],
          ),
        );
      },
    );
  }
}
