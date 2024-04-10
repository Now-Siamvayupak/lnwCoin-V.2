import 'package:lnwcoin/utils/app_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nb_utils/nb_utils.dart';

class VimeoEmbedWidget extends StatelessWidget {
  final String videoId;

  VimeoEmbedWidget(this.videoId);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 10,
      child: Html(
        data:
            '<iframe src="https://player.vimeo.com/video/$videoId" width="640" height="360" frameborder="0" allow="autoplay; fullscreen" allowfullscreen="allowfullscreen" mozallowfullscreen="mozallowfullscreen" msallowfullscreen="msallowfullscreen" oallowfullscreen="oallowfullscreen" webkitallowfullscreen="webkitallowfullscreen"></iframe>',
      ),
    ).onTap(() {
      AppCommon.commonLaunchUrl('https://player.vimeo.com/video/$videoId');
    });
  }
}
