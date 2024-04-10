import 'package:lnwcoin/component/common_error_builder.dart';
import 'package:lnwcoin/component/exchange_charts_component.dart';
import 'package:lnwcoin/component/exchanges_market_component.dart';
import 'package:lnwcoin/model/exchange_detail_model.dart';
import 'package:lnwcoin/model/exchnages_response.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/widgets/app_scaffold.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:lnwcoin/widgets/metrics_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ignore: must_be_immutable
class ExchangesDetailScreen extends StatefulWidget {
  ExchangesResponse data;

  ExchangesDetailScreen({required this.data});

  @override
  _ExchangesDetailScreenState createState() => _ExchangesDetailScreenState();
}

class _ExchangesDetailScreenState extends State<ExchangesDetailScreen> {
  init() async {
    //
  }

  @override
  void initState() {
    super.initState();
    init();
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
          title: Text('${widget.data.name}', style: boldTextStyle(size: 24)),
        ),
        body: SnapHelperWidget<ExchangeDetailResponse>(
          loadingWidget: LoaderWidget(),
          errorBuilder: (p0) => CommonErrorBuilder(text: p0),
          future: getExchangesDetail(widget.data.id.validate()),
          onSuccess: (snap) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.height,
                  ExchangeChartComponent(data: widget.data),
                  16.height,
                  SettingSection(
                    title: Text('${"lbl_about".translate} ${widget.data.name.validate()}', style: boldTextStyle()),
                    headingDecoration: boxDecorationDefault(color: context.cardColor),
                    divider: Offstage(),
                    items: [
                      MetricsWidget(
                        value: '${snap.year_established.validate()}',
                        name: "lbl_year_established".translate,
                        isCurrencyAllowed: false,
                        isBorder: false,
                      ),
                      MetricsWidget(
                        value: '${snap.trust_score_rank.validate()}',
                        name: "lbl_trust_score_rank".translate,
                        isCurrencyAllowed: false,
                        isBorder: false,
                      ),
                      MetricsWidget(
                        value: '${snap.trust_score.validate()}',
                        name: "lbl_trust_score".translate,
                        isCurrencyAllowed: false,
                        isBorder: false,
                      ),
                      MetricsWidget(
                        value: '${snap.country.validate()}',
                        name: "lbl_country".translate,
                        isCurrencyAllowed: false,
                        isBorder: false,
                      ),
                      MetricsWidget(
                        value: '${snap.trade_volume_24h_btc.validate().amountPrefix}',
                        name: "lbl_24h__btc_volume".translate,
                        isCurrencyAllowed: false,
                        isBorder: false,
                      ),
                    ],
                  ),
                  SettingSection(
                    title: Text('lbl_follow_them_on'.translate, style: boldTextStyle()),
                    headingDecoration: boxDecorationDefault(color: context.cardColor),
                    // headingDecoration: BoxDecoration(color: context.cardColor),
                    divider: Offstage(),
                    items: [
                      16.height,
                      TextIcon(
                        edgeInsets: EdgeInsets.all(16),
                        spacing: 16,
                        prefix: Icon(Icons.link, size: 24),
                        text: "lbl_home_page".translate,
                        expandedText: true,
                        suffix: Icon(Icons.arrow_forward_ios_sharp, size: 16),
                        onTap: () {
                          AppCommon.commonLaunchUrl(snap.url.validate(), launchMode: LaunchMode.inAppWebView);
                        },
                      ),
                      TextIcon(
                        edgeInsets: EdgeInsets.all(16),
                        spacing: 16,
                        prefix: AppImages.facebookImg.assetImage(),
                        text: "lbl_faceBook".translate,
                        expandedText: true,
                        suffix: Icon(Icons.arrow_forward_ios_sharp, size: 16),
                        onTap: () {
                          AppCommon.commonLaunchUrl(snap.facebook_url.validate(), launchMode: LaunchMode.inAppWebView);
                        },
                      ),
                      TextIcon(
                        edgeInsets: EdgeInsets.all(16),
                        spacing: 16,
                        prefix: AppImages.telegramImg.assetImage(),
                        text: "lbl_telegram".translate,
                        expandedText: true,
                        suffix: Icon(Icons.arrow_forward_ios_sharp, size: 16),
                        onTap: () {
                          AppCommon.commonLaunchUrl(snap.telegram_url.validate(), launchMode: LaunchMode.inAppWebView);
                        },
                      ),
                      TextIcon(
                        edgeInsets: EdgeInsets.all(16),
                        spacing: 16,
                        prefix: AppImages.slackImg.assetImage(),
                        text: "lbl_slack".translate,
                        expandedText: true,
                        suffix: Icon(Icons.arrow_forward_ios_sharp, size: 16),
                        onTap: () {
                          AppCommon.commonLaunchUrl(snap.slack_url.validate(), launchMode: LaunchMode.inAppWebView);
                        },
                      ),
                      TextIcon(
                        edgeInsets: EdgeInsets.all(16),
                        spacing: 16,
                        prefix: AppImages.twitterImg.assetImage(),
                        text: "lbl_twitter".translate,
                        expandedText: true,
                        suffix: Icon(Icons.arrow_forward_ios_sharp, size: 16),
                        onTap: () {
                          AppCommon.commonLaunchUrl("${SocialMediaBaseUrl.twitterBaseUrl}${snap.twitter_handle.validate()}", launchMode: LaunchMode.inAppWebView);
                        },
                      ),
                      TextIcon(
                        edgeInsets: EdgeInsets.all(16),
                        spacing: 16,
                        prefix: AppImages.redditImg.assetImage(),
                        text: "lbl_reddit".translate,
                        expandedText: true,
                        suffix: Icon(Icons.arrow_forward_ios_sharp, size: 16),
                        onTap: () {
                          AppCommon.commonLaunchUrl(snap.reddit_url.validate(), launchMode: LaunchMode.inAppWebView);
                        },
                      ),
                      TextIcon(
                        edgeInsets: EdgeInsets.all(16),
                        spacing: 16,
                        prefix: Icon(Icons.link, size: 24),
                        text: "lbl_other_url_1".translate,
                        expandedText: true,
                        suffix: Icon(Icons.arrow_forward_ios_sharp, size: 16),
                        onTap: () {
                          AppCommon.commonLaunchUrl(snap.other_url_1.validate(), launchMode: LaunchMode.inAppWebView);
                        },
                      ),
                      TextIcon(
                        edgeInsets: EdgeInsets.all(16),
                        spacing: 16,
                        prefix: Icon(Icons.link, size: 24),
                        text: "lbl_other_url_2".translate,
                        expandedText: true,
                        suffix: Icon(Icons.arrow_forward_ios_sharp, size: 16),
                        onTap: () {
                          AppCommon.commonLaunchUrl(snap.other_url_2.validate(), launchMode: LaunchMode.inAppWebView);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: themePrimaryColor,
          onPressed: () {
            ExchangesMarketComponent(name: 'binance', id: widget.data.id.validate()).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
          },
          label: Text('lbl_market'.translate, style: boldTextStyle()),
        ),
      ),
    );
  }
}
