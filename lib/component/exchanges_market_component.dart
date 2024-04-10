import 'package:lnwcoin/model/coin_detail_model.dart';
import 'package:lnwcoin/model/coin_sorting_model.dart';
import 'package:lnwcoin/model/exchange_ticker_response.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/get_detail_view_currency.dart';
import 'package:lnwcoin/widgets/app_scaffold.dart';
import 'package:lnwcoin/widgets/linear_progress_widget.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ExchangesMarketComponent extends StatefulWidget {
  final String? name;
  final String? id;

  ExchangesMarketComponent({this.name, this.id});

  @override
  _ExchangesMarketComponentState createState() => _ExchangesMarketComponentState();
}

class _ExchangesMarketComponentState extends State<ExchangesMarketComponent> {
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
          title: Text('${widget.name.capitalizeFirstLetter()} ${'lbl_exchanges_market'.translate}', style: boldTextStyle(size: 22)),
        ),
        body: SnapHelperWidget<ExchangeTickerModel>(
          loadingWidget: LoaderWidget(),
          future: getExchangesTickerList(exchangeId: widget.id),
          onSuccess: (snap) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: List.generate(SortingTypeModel.getExchangesSortValue.length, (index) {
                      SortingTypeModel data = SortingTypeModel.getExchangesSortValue[index];
                      return RadioListTile(
                        groupValue: selectedValue,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: data.id.validate(),
                        onChanged: (value) {
                          selectedValue = value!.toString().toInt();
                          selectedTypeValue = data;
                          setState(() {});
                        },
                        title: Text('${data.name.validate()}', style: primaryTextStyle()),
                      ).expand();
                    }),
                  ),
                  16.height,
                  Table(
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: themePrimaryColor.withOpacity(0.2)),
                        children: [
                          Container(padding: EdgeInsets.all(12), child: Text("lbl_pair".translate.capitalizeFirstLetter(), style: boldTextStyle())),
                          Container(padding: EdgeInsets.all(12), child: Text("lbl_price".translate.capitalizeFirstLetter(), style: boldTextStyle())),
                          Container(padding: EdgeInsets.all(12), child: Text('lbl_24H_volume'.translate.capitalizeFirstLetter(), style: primaryTextStyle())),
                          Container(padding: EdgeInsets.all(12), child: Text('lbl_trust_score'.translate, style: primaryTextStyle())),
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
                        padding: EdgeInsets.all(16),
                        child: Table(
                          children: [
                            TableRow(children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(data.base.validate(), style: boldTextStyle(size: 14)),
                                  Text(data.target.validate(), style: boldTextStyle(size: 14)),
                                ],
                              ),
                              Text('${getCurrencyPrefix(selectedValue)}${getExchangeFrom(selectedTypeValue, data.converted_last!).validate().amountPrefix} ', style: primaryTextStyle(size: 14)),
                              Text(
                                '${getCurrencyPrefix(selectedValue)}${getExchangeFrom(selectedTypeValue, data.converted_volume!).validate().amountPrefix}',
                                style: primaryTextStyle(size: 14),
                                textAlign: TextAlign.center,
                              ),
                              LinearProgressWidget(value: 10, selectedColor: data.trust_score?.getExchangeColor)
                            ]),
                          ],
                        ),
                      ).onTap(() {
                        showMoreDetail(context, data);
                      });
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
