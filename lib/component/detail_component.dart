import 'package:lnwcoin/component/description_component.dart';
import 'package:lnwcoin/model/coin_detail_model.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/utils/app_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class DetailComponent extends StatefulWidget {
  CoinDetailModel data;

  DetailComponent({required this.data});

  @override
  _DetailComponentState createState() => _DetailComponentState();
}

class _DetailComponentState extends State<DetailComponent> {
  Links? links;
  BannerAd? myBanner;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    links = widget.data.links;
    myBanner = buildBannerAd()..load();
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('lbl_information'.translate, style: boldTextStyle(size: 22)),
        ),
        body: Container(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 75),
                child: Column(
                  children: [
                    ExpansionTile(
                      collapsedIconColor: context.iconColor,
                      iconColor: context.iconColor,
                      initiallyExpanded: true,
                      title: Text("lbl_home_page".translate, style: boldTextStyle()),
                      children: List.generate(
                        links!.homepage.validate().length.validate(),
                        (index) {
                          if (links!.homepage![index].validate().isEmpty) {
                            return Offstage();
                          }
                          return Container(
                            width: context.width(),
                            padding: EdgeInsets.all(16),
                            child: Text(links!.homepage![index].validate(), style: secondaryTextStyle(), overflow: TextOverflow.ellipsis),
                          ).onTap(splashColor: themePrimaryColor, () {
                            AppCommon.commonLaunchUrl(links!.homepage![index].validate());
                          });
                        },
                      ),
                    ),
                    ExpansionTile(
                      initiallyExpanded: true,
                      collapsedIconColor: context.iconColor,
                      iconColor: context.iconColor,
                      title: Text("lbl_blockchain_supply".translate, style: boldTextStyle()),
                      children: List.generate(
                        links!.blockchain_site.validate().length.validate(),
                        (index) {
                          if (links!.blockchain_site![index].validate().isEmpty) {
                            return Offstage();
                          }
                          return Container(
                            width: context.width(),
                            padding: EdgeInsets.all(16),
                            child: Text(links!.blockchain_site![index].validate(), style: secondaryTextStyle()),
                          ).onTap(splashColor: themePrimaryColor, () {
                            AppCommon.commonLaunchUrl(links!.blockchain_site![index].validate());
                          });
                        },
                      ),
                    ),
                    ExpansionTile(
                      initiallyExpanded: true,
                      collapsedIconColor: context.iconColor,
                      iconColor: context.iconColor,
                      title: Text("lbl_discussion_forum".translate, style: boldTextStyle()),
                      children: List.generate(
                        links!.official_forum_url.validate().length.validate(),
                        (index) {
                          if (links!.official_forum_url![index].validate().isEmpty) {
                            return Offstage();
                          }
                          return Container(
                            width: context.width(),
                            padding: EdgeInsets.all(16),
                            child: Text(links!.official_forum_url![index].validate(), style: secondaryTextStyle()),
                          ).onTap(splashColor: themePrimaryColor, () {
                            AppCommon.commonLaunchUrl(links!.official_forum_url![index].validate());
                          });
                        },
                      ),
                    ),
                    ExpansionTile(
                      initiallyExpanded: true,
                      collapsedIconColor: context.iconColor,
                      iconColor: context.iconColor,
                      title: Text("lbl_repos".translate, style: boldTextStyle()),
                      children: List.generate(
                        links!.repos_url!.github.validate().length.validate(),
                        (index) {
                          if (links!.repos_url!.github![index].validate().isEmpty) {
                            return Offstage();
                          }
                          return Container(
                            width: context.width(),
                            padding: EdgeInsets.all(16),
                            child: Text(links!.repos_url!.github![index].validate(), style: secondaryTextStyle()),
                          ).onTap(splashColor: themePrimaryColor, () {
                            AppCommon.commonLaunchUrl(links!.repos_url!.github![index].validate());
                          });
                        },
                      ),
                    ),
                    SettingItemWidget(
                      splashColor: themePrimaryColor,
                      onTap: () {
                        //
                      },
                      title: 'lbl_genesis_date'.translate,
                      trailing: Text(
                        widget.data.genesis_date == null ? "" : widget.data.genesis_date.validate().getFormattedDate,
                        style: secondaryTextStyle(),
                        maxLines: 1,
                        textAlign: TextAlign.right,
                      ).expand(),
                    ),
                    SettingItemWidget(
                      splashColor: themePrimaryColor,
                      leading: AppImages.facebookImg.assetImage(),
                      title: 'lbl_faceBook'.translate,
                      trailing: Icon(Icons.arrow_forward_ios_sharp, size: 16),
                      onTap: () {
                        AppCommon.commonLaunchUrl("${SocialMediaBaseUrl.facebookBaseUrl}${links!.facebook_username.validate()}/");
                      },
                    ),
                    SettingItemWidget(
                      splashColor: themePrimaryColor,
                      leading: AppImages.twitterImg.assetImage(),
                      title: 'lbl_twitter'.translate,
                      trailing: Icon(Icons.arrow_forward_ios_sharp, size: 16),
                      onTap: () {
                        AppCommon.commonLaunchUrl("${SocialMediaBaseUrl.twitterBaseUrl}${links!.twitter_screen_name}/");
                      },
                    ),
                    SettingItemWidget(
                      splashColor: themePrimaryColor,
                      leading: AppImages.redditImg.assetImage(),
                      title: 'lbl_reddit'.translate,
                      trailing: Icon(Icons.arrow_forward_ios_sharp, size: 16),
                      onTap: () {
                        AppCommon.commonLaunchUrl(links!.subreddit_url);
                      },
                    ),
                    16.height,
                    DescriptionComponent(description: widget.data.description!, name: widget.data.name.validate()).paddingSymmetric(horizontal: 16),
                  ],
                ),
              ),
              Positioned(
                child: AdWidget(ad: myBanner!),
                bottom: 0,
                left: 0,
                right: 0,
                height: AdSize.banner.height.toDouble(),
              ).visible(myBanner != null && AppConstant.isAdsLoading),
            ],
          ),
        ),
      ),
    );
  }
}
