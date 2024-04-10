import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

Future<Color> getMaterialYouData() async {
  if (appStore.useMaterialYouTheme && await isAndroid12Above()) {
    themePrimaryColor = await getMaterialYouPrimaryColor();
  } else {
    themePrimaryColor = secondaryColor;
  }

  return themePrimaryColor;
}
