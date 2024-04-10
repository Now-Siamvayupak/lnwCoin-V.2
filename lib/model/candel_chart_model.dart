class CandleChartResponse {
  int? time;
  double? open;
  double? high;
  double? low;
  double? close;

  CandleChartResponse({this.time, this.open, this.high, this.low, this.close});

  factory CandleChartResponse.fromJson(Map<String, dynamic> json) {
    return CandleChartResponse(
      time: json['time'],
      open: json['open'],
      high: json['high'],
      low: json['low'],
      close: json['close'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['open'] = this.open;
    data['high'] = this.high;
    data['low'] = this.low;
    data['close'] = this.close;
    return data;
  }
}
