import 'package:lnwcoin/model/coin_chart_model.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class AreaChartWidget extends StatelessWidget {
  CoinChartModel coinChart;
  ChartMarketType selectedChartType;
  Color? graphColor;

  AreaChartWidget({required this.coinChart, this.graphColor, this.selectedChartType = ChartMarketType.PRICES});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(isVisible: false),
      series: getDefaultData2(),
      selectionType: SelectionType.series,
      trackballBehavior: TrackballBehavior(
        shouldAlwaysShow: true,
        activationMode: ActivationMode.singleTap,
        enable: true,
        tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
      ),
      primaryXAxis: CategoryAxis(
        interval: 1,
        majorGridLines: MajorGridLines(width: 0),
        axisLine: AxisLine(color: primaryColor, width: 0.0),
        isVisible: false,
      ),
      primaryYAxis: NumericAxis(
        labelStyle: primaryTextStyle(size: 12),
        majorGridLines: MajorGridLines(width: 0),
        axisLine: AxisLine(color: graphColor ?? themePrimaryColor, width: 1.0),
      ),
      enableAxisAnimation: true,
      zoomPanBehavior: ZoomPanBehavior(
        enableMouseWheelZooming: true,
        enablePinching: true,
        zoomMode: ZoomMode.xy,
        enablePanning: true,
      ),
      enableSideBySideSeriesPlacement: true,
      crosshairBehavior: CrosshairBehavior(enable: true, activationMode: ActivationMode.singleTap),
      /* axisLabelFormatter: (axisLabelRenderArgs) {
        return ChartAxisLabel(
            '${appStore.mSelectedCurrency!.symbol.validate()}${axisLabelRenderArgs.text.validate(value: 's').toInt().amountPrefix}',
            primaryTextStyle(size: 8));
      },*/
      borderColor: primaryColor,
      onCrosshairPositionChanging: (c) {
        // TODO:- show value changing in text field
        log("c.value${c.value}");
      },
      borderWidth: 0,
      plotAreaBorderWidth: 0,
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<ChartSeries> getDefaultData2() {
    List<ChartData> getChartData(ChartMarketType chartMarketType) {
      List<ChartData> chartData = [];

      switch (chartMarketType) {
        case ChartMarketType.PRICES:
          coinChart.prices!.asMap().forEach((key, value) {
            chartData.add(ChartData(value[0].toString().validate(), value[1]));
          });
          break;
        case ChartMarketType.MARKET_CAPS:
          coinChart.marketCaps!.asMap().forEach((key, value) {
            chartData.add(ChartData(value[0].toString().validate(), value[1]));
          });
          break;
        case ChartMarketType.TOTAL_VOLUMES:
          coinChart.totalVolumes!.asMap().forEach((key, value) {
            chartData.add(ChartData(value[0].toString().validate(), value[1]));
          });
          break;
      }

      return chartData;
    }

    return <CartesianSeries>[
      SplineAreaSeries<ChartData, String>(
          dataSource: getChartData(selectedChartType),
          // Type of spline
          enableTooltip: false,
          isVisibleInLegend: false,
          borderWidth: 1.5,
          dataLabelSettings: DataLabelSettings(),
          splineType: SplineType.clamped,
          gradient: LinearGradient(
            colors: <Color>[(graphColor ?? themePrimaryColor).withOpacity(0.6), (graphColor ?? themePrimaryColor).withOpacity(0.1)],
            stops: <double>[0.03, 0.9],
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter,
          ),
          borderColor: graphColor ?? themePrimaryColor,
          animationDuration: 1000,
          opacity: 0.3,
          xValueMapper: (ChartData sales, _) => '${DateTime.fromMicrosecondsSinceEpoch(sales.key.toInt())}',
          yValueMapper: (ChartData sales, _) => sales.value,
          legendIconType: LegendIconType.triangle,
          legendItemText: '',
          isVisible: true,
          emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.average)),
    ];
  }
}

class ChartData {
  String? key;
  double? value;

  ChartData(this.key, this.value);
}
