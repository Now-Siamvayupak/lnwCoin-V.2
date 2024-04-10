import 'package:lnwcoin/component/common_error_builder.dart';
import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/iqonic_model.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(appStore.isDarkMode ? AppImages.gifWithName : AppImages.gifWithNameWhite, scale: 3),
                  SnapHelperWidget<PackageInfoData>(
                    future: getPackageInfo(),
                    errorBuilder: (p0) => CommonErrorBuilder(text: p0),
                    onSuccess: (data) {
                      return Text('${'lbl_Version'.translate} ${data.versionName}', style: secondaryTextStyle());
                    },
                  ),
                  16.height,
                  TextIcon(
                    text: 'lbl_data_provided_by_coinGecko'.translate,
                    onTap: () {
                      AppCommon.commonLaunchUrl(Urls.coinGeckoUrl);
                    },
                    prefix: Image.asset(AppImages.coinGecko, width: 25, height: 25),
                  ),
                  16.height,
                ],
              ),
              Positioned(
                  bottom: 60,
                  child: Container(
                    width: context.width(),
                    child: Column(
                      children: [
                        Text('lbl_follow_us_on'.translate, style: boldTextStyle()),
                        16.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(IqonicModel.getData().length, (index) {
                            IqonicModel data = IqonicModel.getData()[index];
                            return Container(
                              child: data.icon!.assetImage(width: 30, height: 30).center(),
                            ).onTap(() {
                              AppCommon.commonLaunchUrl(data.url.validate());
                            });
                          }),
                        ).paddingSymmetric(horizontal: 16),
                      ],
                    ),
                  )),
              Positioned(
                bottom: 16,
                left: 16,
                right: 0,
                child: Text(Urls.copyRight, style: secondaryTextStyle()).center(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
