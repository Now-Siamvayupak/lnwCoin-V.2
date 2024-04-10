import 'package:lnwcoin/utils/app_constant.dart';

class IqonicModel {
  String? name;
  String? url;
  String? icon;

  IqonicModel({this.name, this.url, this.icon});

  static List<IqonicModel> getData() {
    List<IqonicModel> list = [];
    list.add(IqonicModel(name: "Website", url: "${IqonicUrls.Website}", icon: "${AppImages.websiteImg}"));
    list.add(IqonicModel(name: "Instagram", url: "${IqonicUrls.Instagram}", icon: "${AppImages.instagramImg}"));
    list.add(IqonicModel(name: "Facebook", url: "${IqonicUrls.Facebook}", icon: "${AppImages.facebookImg}"));
    list.add(IqonicModel(name: "Twitter", url: "${IqonicUrls.Twitter}", icon: "${AppImages.twitterImg}"));
    list.add(IqonicModel(name: "Codecanyon", url: "${IqonicUrls.Codecanyon}", icon: "${AppImages.codeCanayonImg}"));
    list.add(IqonicModel(name: "Themeforest", url: "${IqonicUrls.Themeforest}", icon: "${AppImages.themeForestImg}"));
    list.add(IqonicModel(name: "Dribbble", url: "${IqonicUrls.Dribbble}", icon: "${AppImages.dribbbleImg}"));

    return list;
  }
}
