import 'package:cached_network_image/cached_network_image.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

Widget cachedImage(String? url, {double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, bool usePlaceholderIfUrlEmpty = true, double? radius}) {
  if (url.validate().isEmpty) {
    return PlaceHolderWidget(
      height: height,
      width: width,
      alignment: alignment,
      borderRadius: BorderRadius.circular(radius.validate()),
    );
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url!,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return PlaceHolderWidget(
          height: height,
          width: width,
          alignment: alignment,
          borderRadius: BorderRadius.circular(radius.validate()),
        );
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return PlaceHolderWidget(
          height: height,
          width: width,
          alignment: alignment,
          borderRadius: BorderRadius.circular(radius.validate()),
        );
      },
    );
  } else {
    return Image.asset(url!, height: height, width: width, fit: fit, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return Image.asset(AppImages.placeHolderImage, height: height, width: width, fit: fit ?? BoxFit.cover, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
}
