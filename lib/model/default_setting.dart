import 'package:lnwcoin/utils/app_constant.dart';

class DefaultSetting {
  String? name;
  String? imageLink;

  DefaultSetting({
    this.name,
    this.imageLink,
  });

  static List<DefaultSetting> get getChartMarketDefaultType {
    List<DefaultSetting> list = [];

    list.add(DefaultSetting(name: "Prices"));

    list.add(DefaultSetting(name: "Market Caps"));

    list.add(DefaultSetting(name: "Total Volumes"));
    return list;
  }

  static List<DefaultSetting> get getDefaultCharts {
    List<DefaultSetting> list = [];

    list.add(DefaultSetting(name: "Line Chart", imageLink: '${AppImages.area_chart}'));

    list.add(DefaultSetting(name: "Candle Stick Chart", imageLink: '${AppImages.candle_stick_chart}'));
    return list;
  }

  static List<DefaultSetting> get getDashboardCharts {
    List<DefaultSetting> list = [];

    list.add(DefaultSetting(name: "Detail Screen 1", imageLink: '${AppImages.dashboard1}'));

    list.add(DefaultSetting(name: "Detail Screen  2", imageLink: '${AppImages.dashboard2}'));
    return list;
  }

  static List<DefaultSetting> get getTrendingCard {
    List<DefaultSetting> list = [];

    list.add(DefaultSetting(name: "Trending Card 1", imageLink: '${AppImages.trendingCard1}'));

    list.add(DefaultSetting(name: "Trending Card 2", imageLink: '${AppImages.trendingCard2}'));
    return list;
  }
}
