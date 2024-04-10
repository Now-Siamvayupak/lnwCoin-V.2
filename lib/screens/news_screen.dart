import 'package:lnwcoin/component/common_error_builder.dart';
import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/news_response.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:lnwcoin/widgets/news_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/app_scaffold.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  ScrollController scrollController = ScrollController();
  int page = 1;
  List<NewsData> mainList = [];

  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    fetchAllNews();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if (!isLastPage) {
          page++;
          loadMoreData();
        }
      }
    });
  }

  Future fetchAllNews() async {
    appStore.setLoading(true);
    getCryptoNews(page: page).then((value) {
      mainList.addAll(value.news!);
      setState(() {});
    }).catchError((e) async {
      appStore.setLoading(false);
      if (!await isNetworkAvailable()) {
        throw 'lbl_please_check_network_connection'.translate;
      }
    }).whenComplete(() {
      appStore.setLoading(false);
    });
  }

  Future loadMoreData() async {
    appStore.setLoading(true);
    await getCryptoNews(page: page).then((value) {
      if (!mounted) return;
      appStore.setLoading(false);
      mainList.addAll(value.news!);

      isLastPage = false;
      setState(() {});
    }).catchError((e) {
      isLastPage = true;
    }).whenComplete(() {
      appStore.setLoading(false);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('lbl_market_news'.translate, style: boldTextStyle(size: 22)),
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            color: themePrimaryColor,
            backgroundColor: context.cardColor,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () async {
              setState(() {});
              await Future.delayed(Duration(seconds: 2));
            },
            child: FutureBuilder<NewsResponse>(
              future: getCryptoNews(page: page),
              builder: (context, snap) {
                if (snap.hasData) {
                  if (snap.data!.toString().isNotEmpty) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 40),
                        shrinkWrap: true,
                        itemCount: snap.data!.news!.length,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NewsWidget(
                            news: snap.data!.news![index],
                          );
                        },
                      ),
                    );
                  } else {
                    return Text("no_data_found".translate);
                  }
                }
                return snapWidgetHelper(
                  snap,
                  loadingWidget: LoaderWidget().center(),
                  errorBuilder: (p0) => CommonErrorBuilder(text: p0),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
