import 'package:lnwcoin/model/derivatives_response.dart';
import 'package:lnwcoin/screens/derivatives_detail_screen.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DerivativesWidget extends StatefulWidget {
  final DerivativesResponse? data;

  DerivativesWidget({this.data});

  @override
  _DerivativesWidgetState createState() => _DerivativesWidgetState();
}

class _DerivativesWidgetState extends State<DerivativesWidget> {
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
    return InkWell(
      borderRadius: radius(20),
      onTap: () {
        DerivativesDetailScreen(data: widget.data).launch(context);
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: boxDecorationDefault(borderRadius: radius(20), color: context.cardColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                cachedImage(widget.data?.image, height: 35, width: 35).cornerRadiusWithClipRRect(80),
                16.width,
                Text(
                  widget.data!.name.toString(),
                  style: boldTextStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).expand(),
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text('lbl_24h_vol'.translate, style: secondaryTextStyle(size: 12)),
                    4.height,
                    Text('${AppConstant.btcSymbol}${widget.data!.trade_volume_24h_btc.toString().validate()}', style: primaryTextStyle()),
                  ],
                ).expand(),
                Spacer(),
                Column(
                  children: [
                    Text('lbl_open_int'.translate, style: secondaryTextStyle(size: 12)),
                    4.height,
                    Text('${AppConstant.btcSymbol}${widget.data!.open_interest_btc.toString().validate()}', style: primaryTextStyle()),
                  ],
                ).expand(),
              ],
            )
          ],
        ),
      ),
    ).paddingOnly(left: 16, right: 16, bottom: 16);
  }
}
