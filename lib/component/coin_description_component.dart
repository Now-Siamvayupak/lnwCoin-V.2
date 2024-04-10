import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/coin_detail_model.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CoinDescriptionWidget extends StatelessWidget {
  final CoinDetailModel snap;

  CoinDescriptionWidget({required this.snap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('lbl_about'.translate, style: primaryTextStyle(color: appStore.mSelectedGraphColor, size: 20)).paddingSymmetric(horizontal: 16),
        16.height,
        Text('${AppCommon.parseHtmlString(snap.description!.en.validate())}', style: secondaryTextStyle()).paddingSymmetric(horizontal: 16),
        16.height,
        ExpansionTile(
          collapsedIconColor: Colors.white,
          initiallyExpanded: false,
          title: Text("lbl_home_page".translate, style: boldTextStyle()),
          children: List.generate(
            snap.links!.homepage.validate().length.validate(),
            (index) {
              if (snap.links!.homepage![index].validate().isEmpty) {
                return Offstage();
              }
              return Container(
                width: context.width(),
                padding: EdgeInsets.all(16),
                child: Text(snap.links!.homepage![index].validate(), style: secondaryTextStyle(), textAlign: TextAlign.right, overflow: TextOverflow.ellipsis),
              ).onTap(() {
                AppCommon.commonLaunchUrl(snap.links!.homepage![index].validate());
              });
            },
          ),
        ),
        ExpansionTile(
          initiallyExpanded: false,
          collapsedIconColor: Colors.white,
          title: Text("lbl_blockchain_supply".translate, style: boldTextStyle()),
          children: List.generate(
            snap.links!.blockchain_site.validate().length.validate(),
            (index) {
              if (snap.links!.blockchain_site![index].validate().isEmpty) {
                return Offstage();
              }
              return Container(
                width: context.width(),
                padding: EdgeInsets.all(16),
                child: Text(snap.links!.blockchain_site![index].validate(), style: secondaryTextStyle(), textAlign: TextAlign.right),
              ).onTap(() {
                AppCommon.commonLaunchUrl(snap.links!.blockchain_site![index].validate());
              });
            },
          ),
        ),
        ExpansionTile(
          initiallyExpanded: false,
          collapsedIconColor: Colors.white,
          title: Text("lbl_discussion_forum".translate, style: boldTextStyle()),
          children: List.generate(
            snap.links!.official_forum_url.validate().length.validate(),
            (index) {
              if (snap.links!.official_forum_url![index].validate().isEmpty) {
                return Offstage();
              }
              return Container(
                width: context.width(),
                padding: EdgeInsets.all(16),
                child: Text(
                  snap.links!.official_forum_url![index].validate(),
                  style: secondaryTextStyle(),
                  textAlign: TextAlign.right,
                ),
              ).onTap(() {
                AppCommon.commonLaunchUrl(snap.links!.official_forum_url![index].validate());
              });
            },
          ),
        ),
        ExpansionTile(
          initiallyExpanded: false,
          collapsedIconColor: Colors.white,
          title: Text("lbl_repos".translate, style: boldTextStyle()),
          children: List.generate(
            snap.links!.repos_url!.github.validate().length.validate(),
            (index) {
              if (snap.links!.repos_url!.github![index].validate().isEmpty) {
                return Offstage();
              }
              return Container(
                width: context.width(),
                padding: EdgeInsets.all(16),
                child: Text(
                  snap.links!.repos_url!.github![index].validate(),
                  style: secondaryTextStyle(),
                  textAlign: TextAlign.right,
                ),
              ).onTap(() {
                AppCommon.commonLaunchUrl(snap.links!.repos_url!.github![index].validate());
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
            snap.genesis_date == null ? "" : snap.genesis_date.validate().getFormattedDate,
            style: secondaryTextStyle(),
            maxLines: 1,
            textAlign: TextAlign.right,
          ).expand(),
        ),
        SettingItemWidget(
          splashColor: themePrimaryColor,
          leading: AppImages.facebookImg.assetImage(),
          title: 'lbl_facebook'.translate,
          trailing: Icon(Icons.arrow_forward_ios_sharp, size: 16),
          onTap: () {
            AppCommon.commonLaunchUrl("${SocialMediaBaseUrl.facebookBaseUrl}${snap.links!.facebook_username.validate()}/");
          },
        ),
        SettingItemWidget(
          splashColor: themePrimaryColor,
          leading: AppImages.twitterImg.assetImage(),
          title: 'lbl_twitter'.translate,
          trailing: Icon(Icons.arrow_forward_ios_sharp, size: 16),
          onTap: () {
            AppCommon.commonLaunchUrl("${SocialMediaBaseUrl.twitterBaseUrl}${snap.links!.twitter_screen_name}/");
          },
        ),
        SettingItemWidget(
          splashColor: themePrimaryColor,
          leading: AppImages.redditImg.assetImage(),
          title: 'lbl_reddit'.translate,
          trailing: Icon(Icons.arrow_forward_ios_sharp, size: 16),
          onTap: () {
            AppCommon.commonLaunchUrl(snap.links!.subreddit_url);
          },
        ),
        16.height,
      ],
    );
  }
}
