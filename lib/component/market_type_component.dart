import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MarketTypeComponent extends StatefulWidget {
  final DashboardType dashboardType;

  MarketTypeComponent({this.dashboardType = DashboardType.DASHBOARD_1});

  @override
  _MarketTypeComponentState createState() => _MarketTypeComponentState();
}

class _MarketTypeComponentState extends State<MarketTypeComponent> {
  int selectedValue = -1;
  ChartMarketType chartMarketType = ChartMarketType.PRICES;
  String rangeTitle = "";

  @override
  void initState() {
    selectedValue = getIntAsync(SharedPreferenceKeys.MARKET_TYPE_SELECTED_INDEX, defaultValue: 1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.dashboardType) {
      case DashboardType.DASHBOARD_1:
        return Container(
          width: context.width(),
          child: HorizontalList(
            itemCount: ChartMarketType.values.length,
            itemBuilder: (BuildContext context, int index) {
              ChartMarketType data = ChartMarketType.values[index];
              bool isSelected = index == selectedValue;
              return Container(
                decoration: boxDecorationWithShadow(
                  backgroundColor: isSelected ? themePrimaryColor : context.cardColor,
                  borderRadius: radius(),
                ),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  getName(data),
                  style: primaryTextStyle(size: 12),
                ),
              ).onTap(() {
                selectedValue = index;
                setValue(SharedPreferenceKeys.MARKET_TYPE_SELECTED_INDEX, index);
                chartStore.setSelectedChartMarketType(ChartMarketType.values[index]);

                setState(() {});
              });
            },
          ),
        );
      case DashboardType.DASHBOARD_2:
        return Container(
          child: /*Row(
            children: List.generate(ChartMarketType.values.length, (index) {
              ChartMarketType data = ChartMarketType.values[index];
              return Row(
                children: [
                  Radio<int>(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: index,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        selectedValue = value.validate();
                        chartMarketType = data;
                        setState(() {});
                        setValue(SharedPreferenceKeys.MARKET_TYPE_SELECTED_INDEX, index);
                        chartStore.setSelectedChartMarketType(ChartMarketType.values[index]);
                      }),
                  Text(getName(data), style: primaryTextStyle()),
                ],
              );
            }),
          ),*/
              Row(
            children: List.generate(
              ChartMarketType.values.length,
              (index) {
                ChartMarketType data = ChartMarketType.values[index];
                return RadioListTile(
                  contentPadding: EdgeInsets.all(0),
                  groupValue: selectedValue,
                  controlAffinity: ListTileControlAffinity.leading,
                  value: index,
                  onChanged: (value) {
                    selectedValue = value!.toString().toInt();
                    chartMarketType = data;
                    setValue(SharedPreferenceKeys.MARKET_TYPE_SELECTED_INDEX, index);
                    chartStore.setSelectedChartMarketType(ChartMarketType.values[index]);
                    setState(() {});
                  },
                  title: Text('${getName(data)}', style: primaryTextStyle()),
                ).expand();
              },
            ),
          ),
        );
    }
  }

  String getName(ChartMarketType chartMarketType) {
    switch (chartMarketType) {
      case ChartMarketType.PRICES:
        return "price".translate;

      case ChartMarketType.MARKET_CAPS:
        return "market_cap".translate;
      case ChartMarketType.TOTAL_VOLUMES:
        return "lbl_total_vol".translate;
    }
  }
}
