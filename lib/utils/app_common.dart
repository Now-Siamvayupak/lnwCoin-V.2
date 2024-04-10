import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/coin_detail_model.dart';
import 'package:lnwcoin/model/trending_model.dart';
import 'package:lnwcoin/screens/coin_detail_screen.dart';
import 'package:lnwcoin/screens/coin_detail_screen2.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/widgets/trending_widget.dart';
import 'package:lnwcoin/widgets/trending_widget2.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

extension SExt on String {
  String get translate => appLocalizations!.translate(this);
}

class AppCommon {
  /// Common InputDecoration
  static InputDecoration inputDecoration(String? title) {
    return InputDecoration(
      hintText: title.validate(),
      hintStyle: secondaryTextStyle(),
      filled: true,
      fillColor: appStore.isDarkMode ? cardColor : Colors.white,
      focusedBorder: OutlineInputBorder(borderRadius: radius(defaultRadius), borderSide: BorderSide(color: themePrimaryColor)),
      border: OutlineInputBorder(borderRadius: radius(defaultRadius), borderSide: BorderSide(color: themePrimaryColor)),
      enabledBorder: OutlineInputBorder(borderRadius: radius(defaultRadius), borderSide: BorderSide(color: cardColor)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  static Future<void> commonLaunchUrl(String url, {LaunchMode launchMode = LaunchMode.externalApplication}) async {
    await launchUrl(Uri.parse(url), mode: launchMode).catchError((e) {
      toast('Invalid URL: $url');
    });
  }

  static InputDecoration webInputDecoration(String? title, BuildContext context) {
    return InputDecoration(
      labelText: title.validate(),
      //label: Text('${title.validate()}', style: secondaryTextStyle(size: 16)),
      labelStyle: secondaryTextStyle(size: 16),
      filled: true,
      fillColor: context.cardColor,
      focusedBorder: OutlineInputBorder(borderRadius: radius(defaultRadius), borderSide: BorderSide(color: themePrimaryColor)),
      border: OutlineInputBorder(borderRadius: radius(defaultRadius), borderSide: BorderSide(color: themePrimaryColor)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  static String parseHtmlString(String? htmlString) {
    return parse(parse(htmlString).body!.text).documentElement!.text;
  }
}

//region Extensions
extension numberFormat on num {
  String get amountPrefix {
    if (this > 999 && this < 99999) {
      return "${(this / 1000).toStringAsFixed(2)} K";
    } else if (this > 99999 && this < 999999) {
      return "${(this / 1000).toStringAsFixed(2)} K";
    } else if (this > 999999 && this < 999999999) {
      return "${(this / 1000000).toStringAsFixed(2)} M";
    } else if (this > 999999999) {
      return "${(this / 1000000000).toStringAsFixed(2)} B";
    } else {
      return this.toString();
    }
  }

  Color get getAmountForColor {
    if (this.isNegative) {
      return dangerColor;
    } else {
      return successColor;
    }
  }
}

String getFormatted(DateTime dateTime) {
  return DateFormat('dd-MMM-yyy').format(dateTime);
}

extension stringExt on String {
  Image assetImage({double width = 24, double height = 24, BoxFit fit = BoxFit.cover}) {
    return Image.asset(this, width: width, height: height, fit: fit);
  }

  String get getFormattedDate {
    return DateFormat('dd-MMM-yyy').format(DateTime.parse(this));
  }

  Color get getExchangeColor {
    if (this == "green") {
      return Colors.green;
    } else if (this == "red") {
      return Colors.red;
    } else if (this == "yellow") {
      return Colors.yellow;
    } else if (this == "gray") {
      return Colors.grey;
    } else {
      return Colors.transparent;
    }
  }

  String get getExchangeStatus {
    if (this == "green") {
      return 'Trust score is Good. we estimate that this exchange pair has a good liquidity.';
    } else if (this == "red") {
      return 'Trust score is Low. we estimate that this exchange pair has a low liquidity.';
    } else if (this == "yellow") {
      return 'Trust score is Fair. we estimate that this exchange pair has a fair liquidity.';
    } else if (this == "gray") {
      return 'Recently added, score may fluctuate as mor data is collected.';
    } else {
      return 'Trust score is unknown. we do not have sufficient order book data for this exchange pair.';
    }
  }
}
//endregion

Color getExchangeColor(int value) {
  Color selectedColor = Colors.grey;
  if (value > 5) {
    selectedColor = Colors.green;
  } else if (value <= 5 && value > 3) {
    selectedColor = Colors.amber;
  } else if (value <= 3 && value >= 1) {
    selectedColor = Colors.yellow;
  } else {
    selectedColor = Colors.grey;
  }

  return selectedColor;
}

void showMoreDetail(BuildContext context, Ticker data) {
  showGeneralDialog(
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Container();
      },
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierLabel: '',
      transitionBuilder: (context, anim1, anim2, child) {
        return Transform.scale(
          scale: anim1.value,
          child: AlertDialog(
            contentPadding: EdgeInsets.symmetric(vertical: 16),
            backgroundColor: context.cardColor,
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0), borderSide: BorderSide(color: context.cardColor)),
            title: Text('${data.market!.name.validate()}', style: boldTextStyle(size: 20)),
            content: Container(
              width: context.width(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButton(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    color: themePrimaryColor,
                    child: TextIcon(
                      prefix: Icon(
                        Icons.credit_card,
                        size: 16,
                        color: context.iconColor,
                      ),
                      expandedText: true,
                      text: '${data.base.validate()}/${data.target.validate()}',
                    ),
                    onTap: () {
                      if (data.trade_url.isEmptyOrNull) {
                        toast("You cannot trade");
                        return;
                      }
                      AppCommon.commonLaunchUrl(data.trade_url.validate());
                    },
                  ).paddingSymmetric(horizontal: 24),
                  16.height,
                  SettingItemWidget(
                    title: 'Base Price',
                    titleTextStyle: primaryTextStyle(),
                    trailing: Text('${data.converted_last!.usd.validate()}', style: secondaryTextStyle()),
                  ),
                  Divider(height: 0),
                  SettingItemWidget(
                    title: 'Target Price',
                    titleTextStyle: primaryTextStyle(),
                    trailing: Text('${data.last!.validate()}', style: secondaryTextStyle()),
                  ),
                  Divider(height: 0),
                  SettingItemWidget(
                    title: 'Base Volume',
                    titleTextStyle: primaryTextStyle(),
                    trailing: Text('${data.converted_volume!.usd.validate()}', style: secondaryTextStyle()),
                  ),
                  Divider(height: 0),
                  SettingItemWidget(
                    title: 'Target Volume',
                    titleTextStyle: primaryTextStyle(),
                    trailing: Text('${data.volume.validate()}', style: secondaryTextStyle()),
                  ),
                  Divider(height: 0),
                  SettingItemWidget(
                    title: '24H Volume',
                    titleTextStyle: primaryTextStyle(),
                    trailing: Text('${data.bid_ask_spread_percentage.validate()}', style: secondaryTextStyle()),
                  ),
                  Divider(height: 16),
                  Row(
                    children: [
                      Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: data.trust_score?.getExchangeColor),
                      ),
                      16.width,
                      Text(data.trust_score.validate().getExchangeStatus, style: primaryTextStyle()).expand(),
                    ],
                  ).paddingLeft(8),
                  16.height,
                ],
              ),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 300));
}

DashboardType get getSelectedDashboard {
  if (getIntAsync(SharedPreferenceKeys.DASHBOARD_SELECTED_INDEX) == 0) {
    return DashboardType.DASHBOARD_1;
  } else {
    return DashboardType.DASHBOARD_2;
  }
}

TrendingCardType get getSelectedTrendingCard {
  if (getIntAsync(SharedPreferenceKeys.TRENDING_CARD_SELECTED_INDEX) == 0) {
    return TrendingCardType.TRENDING_CARD1;
  } else {
    return TrendingCardType.TRENDING_CARD2;
  }
}

Widget getSelectedDetailScreen({String? name, String? id, String? image}) {
  if (getIntAsync(SharedPreferenceKeys.DASHBOARD_SELECTED_INDEX) == 0) {
    return CoinDetailScreen(
      name: name.validate(),
      id: id.validate(),
    );
  } else {
    return CoinDetailScreen2(
      name: name.validate(),
      id: id.validate(),
      image: image.validate(),
    );
  }
}

Widget getSelectedTrendingWidget({Item? trendingItemData}) {
  if (getIntAsync(SharedPreferenceKeys.TRENDING_CARD_SELECTED_INDEX) == 0) {
    return TrendingWidget(trendingItemData: trendingItemData!);
  } else {
    return TrendingWidget2(trendingItemData: trendingItemData!);
  }
}

Widget getLayoutTypeIcon() {
  String type = getStringAsync(SELECTED_LAYOUT_TYPE_FAVOURITE, defaultValue: LIST_VIEW);
  if (type == GRID_VIEW) {
    return Icon(Icons.grid_view);
  } else {
    return Icon(Icons.view_agenda_outlined);
  }
}

Widget addFavoriteIcon({Function()? onPressed}) {
  return IconButton(
    onPressed: onPressed,
    icon: Icon(Icons.favorite_outlined, color: themePrimaryColor),
    padding: EdgeInsets.all(0),
  );
}
