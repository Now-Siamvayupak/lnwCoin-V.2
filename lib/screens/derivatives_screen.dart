import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/derivatives_response.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/widgets/app_scaffold.dart';
import 'package:lnwcoin/widgets/derivatives_widget.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DerivativesScreen extends StatefulWidget {
  @override
  _DerivativesScreenState createState() => _DerivativesScreenState();
}

class _DerivativesScreenState extends State<DerivativesScreen> {
  ScrollController scrollController = ScrollController();
  int page = 1;
  List<DerivativesResponse> mainList = [];
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
    await DerivativesApi.getDerivativesList(page: page).then((value) {
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
    await DerivativesApi.getDerivativesList(page: page).then((value) {
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
          title: Text('lbl_derivatives'.translate, style: boldTextStyle(size: 22)),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 60),
          controller: scrollController,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: mainList.length,
                padding: EdgeInsets.only(top: 8),
                itemBuilder: (context, index) {
                  DerivativesResponse data = mainList[index];
                  return DerivativesWidget(data: data);
                },
              )
            ],
          ),
        ).visible(!appStore.mIsLoading.validate(), defaultWidget: LoaderWidget()),
      ),
    );
  }
}
