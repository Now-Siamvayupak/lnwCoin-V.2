import 'package:lnwcoin/component/common_error_builder.dart';
import 'package:lnwcoin/component/companies_component.dart';
import 'package:lnwcoin/model/companies_model.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class CompaniesScreen extends StatefulWidget {
  static String tag = '/CompaniesScreen';
  final String? coinId;

  CompaniesScreen({this.coinId});

  @override
  CompaniesScreenState createState() => CompaniesScreenState();
}

class CompaniesScreenState extends State<CompaniesScreen> {
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
        appBar: AppBar(
          title: Text('lbl_companies'.translate, style: boldTextStyle(size: 22)),
        ),
        body: SnapHelperWidget<CompaniesModel>(
          loadingWidget: LoaderWidget(),
          errorBuilder: (p0) => CommonErrorBuilder(text: p0),
          future: getCompaniesList(coinId: widget.coinId.validate()),
          onSuccess: (snap) {
            return SizedBox(
              height: context.height(),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 16,
                    left: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text('lbl_total_holdings'.translate, style: secondaryTextStyle()),
                            4.height,
                            Text("${appStore.mSelectedCurrency?.symbol.validate()}${snap.total_holdings.validate().amountPrefix}", style: boldTextStyle()),
                          ],
                        ),
                        Column(
                          children: [
                            Text('lbl_total_entry_value'.translate, style: secondaryTextStyle()),
                            4.height,
                            Text("${appStore.mSelectedCurrency?.symbol.validate()}${snap.total_value_usd.validate().amountPrefix}", style: boldTextStyle()),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: CompaniesComponent(companiesData: snap),
                  ),
                ],
              ),
            );
          },
          errorWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/app_images/no_data_found.png', height: 160, width: 160, fit: BoxFit.cover),
              16.height,
              Text('lbl_no_companies_data_found'.translate, style: boldTextStyle())
            ],
          ).center(),
        ),
      ),
    );
  }
}
