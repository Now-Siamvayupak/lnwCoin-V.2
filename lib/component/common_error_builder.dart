import 'package:lnwcoin/utils/app_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CommonErrorBuilder extends StatelessWidget {
  final String text;

  CommonErrorBuilder({required this.text});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          64.height,
          Lottie.asset('images/app_images/limit.json', height: 280),
          32.height,
          Text('Kindly wait! It will reload automatically.', style: boldTextStyle(size: 18)),
          32.height,
          Linkify(
            onOpen: (c) {
              AppCommon.commonLaunchUrl('${c.url.validate()}', launchMode: LaunchMode.inAppWebView);
            },
            text: text,
            textAlign: TextAlign.center,
            style: secondaryTextStyle(size: 14),
          ).center(),
          36.height,
          Text('Note: This limit is due to the free version of coingecko API', style: secondaryTextStyle(color: Colors.red, size: 10)),
        ],
      ).paddingAll(16),
    );
  }
}
