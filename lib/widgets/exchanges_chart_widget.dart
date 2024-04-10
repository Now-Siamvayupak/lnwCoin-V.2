import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/widgets/area_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExchangeChartWidget extends StatefulWidget {
  final List list;
  final Color graphColor;

  ExchangeChartWidget({required this.list, required this.graphColor});

  @override
  _ExchangeChartWidgetState createState() => _ExchangeChartWidgetState();
}

class _ExchangeChartWidgetState extends State<ExchangeChartWidget> {
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
    return Container(
      child: SfCartesianChart(
        legend: Legend(isVisible: false),
        series: getDefaultData2(),
        selectionType: SelectionType.series,
        trackballBehavior: TrackballBehavior(
          shouldAlwaysShow: true,
          activationMode: ActivationMode.singleTap,
          enable: true,
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
          axisLine: AxisLine(color: widget.graphColor, width: 0.0),
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
        borderColor: primaryColor,
        onCrosshairPositionChanging: (c) {
          // TODO:- show value changing in text field
        },
        borderWidth: 0,
        plotAreaBorderWidth: 0,
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }

  List<ChartSeries> getDefaultData2() {
    List<ChartData> getChartData() {
      List<ChartData> chartData = [];

      widget.list.asMap().forEach((key, value) {
        chartData.add(ChartData(value[0].toString(), double.parse(value[1])));
      });

      return chartData;
    }

    return <CartesianSeries>[
      SplineAreaSeries<ChartData, String>(
          dataSource: getChartData(),
          enableTooltip: false,
          isVisibleInLegend: false,
          borderWidth: 1.5,
          dataLabelSettings: DataLabelSettings(),
          splineType: SplineType.clamped,
          gradient: LinearGradient(
            colors: <Color>[widget.graphColor.withOpacity(0.3), widget.graphColor.withOpacity(0.7)],
            stops: <double>[0.03, 0.9],
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter,
          ),
          borderColor: widget.graphColor,
          animationDuration: 1000,
          opacity: 0.3,
          xValueMapper: (ChartData sales, _) => '${sales.key.toDouble()}',
          yValueMapper: (ChartData sales, _) => sales.value,
          legendIconType: LegendIconType.triangle,
          legendItemText: '',
          isVisible: true,
          emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.average))
    ];
  }
}
