import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/exchnages_response.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/widgets/app_scaffold.dart';
import 'package:lnwcoin/widgets/exchange_widget.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

class ExchangesScreen extends StatefulWidget {
  @override
  _ExchangesScreenState createState() => _ExchangesScreenState();
}

class _ExchangesScreenState extends State<ExchangesScreen> {
  ScrollController scrollController = ScrollController();
  int page = 1;
  List<ExchangesResponse> mainList = [];

  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    fetchAllData();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if (!isLastPage) {
          page++;
          loadMoreData();
        }
      }
    });
  }

  Future fetchAllData() async {
    appStore.setLoading(true);
    getExchanges(page: page).then((value) {
      mainList.addAll(value);
      setState(() {});
    }).catchError((e) {
      toast(e.toString());
    }).whenComplete(() {
      appStore.setLoading(false);
    });
  }

  Future loadMoreData() async {
    appStore.setLoading(true);
    await getExchanges(page: page).then((value) {
      if (!mounted) return;
      appStore.setLoading(false);
      mainList.addAll(value);

      isLastPage = false;
      setState(() {});
    }).catchError((e) {
      isLastPage = true;
      toast(e.toString());
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
    return SafeArea(
      child: AppScaffold(
        appBar: AppBar(
          title: Text('lbl_exchanges'.translate, style: boldTextStyle(size: 22)),
        ),
        body: Observer(
          builder: (_) {
            return Container(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: mainList.length,
                      itemBuilder: (context, index) {
                        ExchangesResponse data = mainList[index];
                        return ExchangesWidget(data: data);
                      },
                    )
                  ],
                ),
              ),
            ).visible(!appStore.mIsLoading.validate(), defaultWidget: LoaderWidget());
          },
        ),
      ),
    );
  }
}
