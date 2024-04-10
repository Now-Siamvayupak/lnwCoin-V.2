import 'package:lnwcoin/model/search_model.dart';
import 'package:lnwcoin/network/local_db/sqflite_methods.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/widgets/app_scaffold.dart';
import 'package:lnwcoin/widgets/crypto_add_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class AddCoinToPortfolio extends StatefulWidget {
  @override
  _AddCoinToPortfolioState createState() => _AddCoinToPortfolioState();
}

class _AddCoinToPortfolioState extends State<AddCoinToPortfolio> {
  ScrollController scrollController = ScrollController();
  int page = 1;
  List<Coin> mainList = [];
  bool isLastPage = false;

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    fetchCategoryData();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if (!isLastPage) {
          page++;
          loadMoreData();
        }
      }
    });
  }

  Future fetchCategoryData() async {
    appStore.setLoading(true);

    SqliteMethods.getCoins(page: page, perPage: 50, searchString: controller.text.trim()).then((value) {
      if (controller.text.trim().isNotEmpty) {
        mainList.clear();
        page = 1;
        isLastPage = false;
      }

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
    await SqliteMethods.getCoins(page: page, perPage: 50).then((res) {
      if (!mounted) return;
      appStore.setLoading(false);
      mainList.addAll(res);

      isLastPage = false;
      setState(() {});
    }).catchError((error) {
      if (!mounted) return;
      setState(() {
        isLastPage = true;
        appStore.setLoading(false);
      });
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "lbl_add_favourite_coin".translate,
            style: boldTextStyle(size: 22),
          ),
        ),
        body: Column(
          children: [
            AppTextField(
              controller: controller,
              textFieldType: TextFieldType.OTHER,
              decoration: AppCommon.inputDecoration('lbl_search'.translate).copyWith(
                suffixIcon: Icon(Icons.search, color: Colors.white),
              ),
              onChanged: (s) {
                fetchCategoryData();
              },
            ).paddingSymmetric(horizontal: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              controller: scrollController,
              itemCount: mainList.length,
              itemBuilder: (context, index) {
                return CryptoAddWidget(
                  coin: mainList[index],
                  index: index + 1,
                  onSuccess: () {
                    setState(() {});
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 0,
                  thickness: 0.8,
                  indent: 60,
                  color: appStore.isDarkMode ? cardColor : Colors.grey.withOpacity(0.2),
                );
              },
            ).expand(),
          ],
        ),
      ),
    );
  }
}
