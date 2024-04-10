import 'package:lnwcoin/model/coin_sorting_model.dart';
import 'package:lnwcoin/model/derivatives_detail_model.dart';
import 'package:lnwcoin/model/derivatives_response.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/get_detail_view_currency.dart';
import 'package:lnwcoin/widgets/app_scaffold.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:lnwcoin/widgets/stats_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:lnwcoin/component/common_error_builder.dart';

class DerivativesDetailScreen extends StatefulWidget {
  final DerivativesResponse? data;

  DerivativesDetailScreen({this.data});

  @override
  _DerivativesDetailScreenState createState() => _DerivativesDetailScreenState();
}

class _DerivativesDetailScreenState extends State<DerivativesDetailScreen> {
  int selectedValue = 0;
  SortingTypeModel selectedTypeValue = SortingTypeModel(id: 0, name: "BTC", value: "btc");

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
      child: AppScaffold(
        appBar: AppBar(
          title: Text('${widget.data!.name.validate()}', style: boldTextStyle(size: 22)),
        ),
        body: SnapHelperWidget<DerivativesDetailResponse>(
          future: DerivativesApi.getDerivativesDetail(id: widget.data?.id),
          loadingWidget: LoaderWidget(),
          errorBuilder: (p0) => CommonErrorBuilder(text: p0),
          onSuccess: (snap) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StatsDetailWidget(title: 'lbl_24H_volume'.translate, value: '${snap.trade_volume_24h_btc.toString().validate(value: "-")}'),
                        StatsDetailWidget(title: 'lbl_open_interest'.translate, value: '${snap.open_interest_btc.toString().validate(value: "-")}'),
                        StatsDetailWidget(title: 'lbl_year'.translate, value: '${snap.year_established.toString().validate(value: "-")}'),
                        StatsDetailWidget(title: 'lbl_country'.translate, value: '${snap.country.toString().validate(value: '-')}'),
                        StatsDetailWidget(title: 'lbl_Number_of_futures_pairs'.translate, value: '${snap.number_of_futures_pairs.toString().validate(value: '-')}'),
                        StatsDetailWidget(title: 'lbl_Number_of_perpetual_pairs'.translate, value: '${snap.number_of_perpetual_pairs.toString().validate(value: '-')}'),
                        16.height,
                        Text('lbl_market'.translate, style: boldTextStyle(size: 20)),
                      ],
                    ).paddingAll(16),
                    Table(
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      columnWidths: {0: FlexColumnWidth(4), 1: FlexColumnWidth(2), 2: FlexColumnWidth(2), 3: FlexColumnWidth(2)},
                      children: [
                        TableRow(
                          decoration: BoxDecoration(color: themePrimaryColor.withOpacity(0.2)),
                          children: [
                            Container(padding: EdgeInsets.all(12), child: Text("lbl_symbol".translate.capitalizeFirstLetter(), style: boldTextStyle())),
                            Container(padding: EdgeInsets.all(12), child: Text("lbl_price".translate.capitalizeFirstLetter(), textAlign: TextAlign.start, style: boldTextStyle())),
                            Container(padding: EdgeInsets.all(12), child: Text("lbl_open_interest".translate.capitalizeFirstLetter(), textAlign: TextAlign.start, style: primaryTextStyle())),
                            Container(padding: EdgeInsets.all(12), child: Text('lbl_expire_in'.translate, style: primaryTextStyle(), textAlign: TextAlign.start)),
                          ],
                        ),
                      ],
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snap.tickers?.length,
                      itemBuilder: (context, index) {
                        Ticker data = snap.tickers![index];
                        return Container(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Table(
                              columnWidths: {0: FlexColumnWidth(4), 1: FlexColumnWidth(2), 2: FlexColumnWidth(2), 3: FlexColumnWidth(2)},
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(
                                  children: [
                                    Text(data.symbol.validate(), style: boldTextStyle(size: 14)),
                                    Text('${getCurrencyPrefix(selectedValue)}${getExchangeFromDerivatives(selectedTypeValue, data.converted_last!)!.amountPrefix}',
                                        style: primaryTextStyle(size: 14), textAlign: TextAlign.start),
                                    Text(
                                      '${data.open_interest_usd!.amountPrefix}',
                                      style: primaryTextStyle(size: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'lbl_1_month'.translate,
                                      style: primaryTextStyle(size: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ).onTap(() {
                          showMoreDetail(context, data);
                        });
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void showMoreDetail(BuildContext context, Ticker data) {
    showGeneralDialog(
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return Container();
        },
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.4),
        barrierLabel: '',
        transitionBuilder: (context, anim1, anim2, child) {
          return Transform.scale(
            scale: anim1.value,
            child: AlertDialog(
              backgroundColor: context.cardColor,
              contentPadding: EdgeInsets.symmetric(vertical: 16),
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0), borderSide: BorderSide(color: context.cardColor)),
              title: Text('${widget.data!.name.validate()}', style: boldTextStyle(size: 20)),
              content: Container(
                width: context.width(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButton(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      color: themePrimaryColor,
                      child: TextIcon(
                        prefix: Icon(Icons.credit_card, size: 16, color: Colors.white),
                        expandedText: true,
                        text: '${data.base.validate()}/${data.target.validate()}',
                        textStyle: primaryTextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        if (data.trade_url.isEmptyOrNull) {
                          toast("lbl_you_cannot_trade".translate);
                          return;
                        }
                        AppCommon.commonLaunchUrl(data.trade_url.validate());
                      },
                    ).paddingSymmetric(horizontal: 24),
                    16.height,
                    SettingItemWidget(
                      title: 'lbl_base_price'.translate,
                      titleTextStyle: primaryTextStyle(),
                      trailing: Text('${data.converted_last!.usd.validate().toInt().amountPrefix}', style: secondaryTextStyle()),
                    ),
                    Divider(height: 0),
                    SettingItemWidget(
                      title: 'lbl_target_price'.translate,
                      titleTextStyle: primaryTextStyle(),
                      trailing: Text('${data.last!.validate().amountPrefix}', style: secondaryTextStyle()),
                    ),
                    Divider(height: 0),
                    SettingItemWidget(
                      title: 'lbl_base_volume'.translate,
                      titleTextStyle: primaryTextStyle(),
                      trailing: Text('${data.converted_volume!.usd.validate().toInt().amountPrefix}', style: secondaryTextStyle()),
                    ),
                    Divider(height: 0),
                    SettingItemWidget(
                      title: 'lbl_target_volume'.translate,
                      titleTextStyle: primaryTextStyle(),
                      trailing: Text('${data.h24_volume.validate().amountPrefix}', style: secondaryTextStyle()),
                    ),
                    Divider(height: 0),
                    SettingItemWidget(
                      title: 'lbl_24H_volume'.translate,
                      titleTextStyle: primaryTextStyle(),
                      trailing: Text('${data.bid_ask_spread.validate()}', style: secondaryTextStyle()),
                    ),
                    Divider(height: 16),
                  ],
                ),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 300));
  }
}
