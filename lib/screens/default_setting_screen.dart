import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/default_setting.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/widgets/selected_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/app_scaffold.dart';

class DefaultSettingScreen extends StatefulWidget {
  @override
  _DefaultSettingScreenState createState() => _DefaultSettingScreenState();
}

class _DefaultSettingScreenState extends State<DefaultSettingScreen> {
  int chartMarketDefaultTypeIndex = -1;
  int chartTypeIndex = -1;
  int dashboardTypeIndex = -1;
  int trendingCardTypeIndex = -1;
  int colorIndex = -1;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    chartMarketDefaultTypeIndex = getIntAsync(SharedPreferenceKeys.MARKET_TYPE_SELECTED_INDEX);
    chartTypeIndex = getIntAsync(SharedPreferenceKeys.CHART_SELECTED_INDEX);
    dashboardTypeIndex = getIntAsync(SharedPreferenceKeys.DASHBOARD_SELECTED_INDEX);
    colorIndex = getIntAsync(SharedPreferenceKeys.SELECTED_COLOR_INDEX);
    trendingCardTypeIndex = getIntAsync(SharedPreferenceKeys.TRENDING_CARD_SELECTED_INDEX);
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        appBar: AppBar(
          title: Text('lbl_default_settings'.translate, style: boldTextStyle(size: 22)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SettingSection(
                headingDecoration: BoxDecoration(color: context.cardColor),
                divider: Offstage(),
                title: Text("lbl_choose_detail_screen".translate, style: boldTextStyle()),
                items: [
                  Wrap(
                    runSpacing: 8,
                    spacing: 16,
                    children: List.generate(getDashboard.length, (index) {
                      DefaultSetting data = getDashboard[index];
                      bool isSelected = dashboardTypeIndex == index;

                      return Container(
                        width: context.width() * 0.44,
                        height: context.height() * 0.4,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected ? themePrimaryColor.withOpacity(0.5) : Theme.of(context).dividerColor,
                          ),
                        ),
                        child: Stack(
                          children: [
                            data.imageLink!.assetImage(width: context.width() * 0.48, height: context.height() * 0.4),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 800),
                              color: isSelected ? Colors.black12 : Colors.black45,
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 800),
                              child: Text(data.name.validate(), style: boldTextStyle(color: textPrimaryColor)),
                              decoration: BoxDecoration(color: isSelected ? Colors.white : Colors.white54, borderRadius: radius(defaultRadius)),
                              padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                            ).center(),
                            Positioned(
                              bottom: 8,
                              right: 8,
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 800),
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.check, size: 18, color: themePrimaryColor),
                                decoration: BoxDecoration(color: cardColor, shape: BoxShape.circle, boxShadow: defaultBoxShadow()),
                              ).visible(isSelected),
                            ),
                          ],
                        ),
                      ).onTap(() {
                        dashboardTypeIndex = index;
                        setState(() {});
                        setValue(SharedPreferenceKeys.DASHBOARD_SELECTED_INDEX, index);
                      });
                    }),
                  ).paddingSymmetric(horizontal: 8, vertical: 8)
                ],
              ),
              16.height,
              SettingSection(
                headingDecoration: BoxDecoration(color: context.cardColor),
                divider: Offstage(),
                title: Text("lbl_default_chart_Type".translate, style: boldTextStyle()),
                items: [
                  Wrap(
                    runSpacing: 8,
                    spacing: 16,
                    children: List.generate(getCharts.length, (index) {
                      DefaultSetting data = getCharts[index];
                      bool isSelected = chartTypeIndex == index;

                      return Container(
                        width: context.width() * 0.46,
                        height: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected ? themePrimaryColor.withOpacity(0.5) : Theme.of(context).dividerColor,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Image.asset(data.imageLink!, fit: BoxFit.fitWidth),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 800),
                              color: isSelected ? Colors.black12 : Colors.black45,
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 800),
                              child: Text(data.name.validate(), style: boldTextStyle(color: textPrimaryColor)),
                              decoration: BoxDecoration(color: isSelected ? Colors.white : Colors.white54, borderRadius: radius(defaultRadius)),
                              padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                            ).center(),
                            Positioned(
                              bottom: 8,
                              right: 8,
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 800),
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.check, size: 18, color: themePrimaryColor),
                                decoration: BoxDecoration(color: context.cardColor, shape: BoxShape.circle, boxShadow: defaultBoxShadow()),
                              ).visible(isSelected),
                            ),
                          ],
                        ),
                      ).onTap(() {
                        chartTypeIndex = index;
                        setState(() {});
                        setValue(SharedPreferenceKeys.CHART_SELECTED_INDEX, index);
                      });
                    }),
                  ).paddingSymmetric(horizontal: 8, vertical: 8)
                ],
              ),
              16.height,
              SettingSection(
                headingDecoration: BoxDecoration(color: context.cardColor),
                divider: Offstage(),
                title: Text("lbl_choose_trending_card".translate, style: boldTextStyle()),
                items: [
                  Wrap(
                    runSpacing: 8,
                    spacing: 16,
                    children: List.generate(getTrendingCard.length, (index) {
                      DefaultSetting data = getTrendingCard[index];
                      bool isSelected = trendingCardTypeIndex == index;

                      return Container(
                        width: context.width() * 0.46,
                        height: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected ? themePrimaryColor.withOpacity(0.5) : Theme.of(context).dividerColor,
                          ),
                        ),
                        child: Stack(
                          children: [
                            data.imageLink!.assetImage(width: context.width() * 0.48, height: context.height() * 0.4, fit: BoxFit.contain),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 800),
                              color: isSelected ? Colors.black12 : Colors.black45,
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 800),
                              child: Text(data.name.validate(), style: boldTextStyle(color: textPrimaryColor)),
                              decoration: BoxDecoration(color: isSelected ? Colors.white : Colors.white54, borderRadius: radius(defaultRadius)),
                              padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                            ).center(),
                            Positioned(
                              bottom: 8,
                              right: 8,
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 800),
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.check, size: 18, color: themePrimaryColor),
                                decoration: BoxDecoration(color: context.cardColor, shape: BoxShape.circle, boxShadow: defaultBoxShadow()),
                              ).visible(isSelected),
                            ),
                          ],
                        ),
                      ).onTap(() {
                        trendingCardTypeIndex = index;
                        setState(() {});
                        setValue(SharedPreferenceKeys.TRENDING_CARD_SELECTED_INDEX, index);
                      });
                    }),
                  ).paddingSymmetric(horizontal: 8, vertical: 8)
                ],
              ),
              SettingSection(
                headingDecoration: BoxDecoration(color: context.cardColor),
                divider: Offstage(),
                title: Text('lbl_chart_market_default_type'.translate, style: boldTextStyle()),
                items: List.generate(getMarketType.length, (index) {
                  DefaultSetting data = getMarketType[index];
                  bool isSelected = chartMarketDefaultTypeIndex == index;
                  return SettingItemWidget(
                    onTap: () {
                      setValue(SharedPreferenceKeys.MARKET_TYPE_SELECTED_INDEX, index);
                      chartMarketDefaultTypeIndex = index;
                      setState(() {});
                    },
                    title: '${data.name.validate()}',
                    titleTextStyle: primaryTextStyle(),
                    trailing: isSelected.validate() ? SelectedItemWidget(itemSize: 20) : Offstage(),
                  );
                }),
              ),
              16.height,
              SettingSection(
                headingDecoration: BoxDecoration(color: context.cardColor),
                divider: Offstage(),
                title: Text('lbl_chart_default_color'.translate, style: boldTextStyle()),
                items: [
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: List.generate(AppLists.gradientColor.length, (index) {
                      Color data = AppLists.gradientColor[index];
                      bool isSelected = colorIndex == index;
                      return Stack(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 800),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(color: isSelected ? data.withOpacity(0.7) : data, borderRadius: radius(20)),
                            height: 80,
                            width: 80,
                            alignment: Alignment.centerRight,
                            child: isSelected
                                ? SelectedItemWidget(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: defaultBoxShadow(),
                                    ),
                                    itemSize: 24,
                                  ).center()
                                : Offstage(),
                          ).onTap(
                            () {
                              appStore.setSelectedGraphColor(data);
                              colorIndex = index;
                              setValue(SharedPreferenceKeys.SELECTED_COLOR_INDEX, index);
                              setState(() {});
                            },
                          ),
                        ],
                      );
                    }),
                  ).paddingSymmetric(vertical: 16, horizontal: 8)
                ],
              ),
              16.height,
            ],
          ),
        ),
      ),
    );
  }
}
