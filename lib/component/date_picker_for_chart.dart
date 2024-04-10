import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DatePickerForChart extends StatefulWidget {
  @override
  _DatePickerForChartState createState() => _DatePickerForChartState();
}

class _DatePickerForChartState extends State<DatePickerForChart> {
  String mFromDate = "lbl_from".translate;
  String mToDate = "lbl_to".translate;

  late DateTime fromDate;
  late DateTime toDate;

  int differences = 1;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    fromDate = chartStore.mFromDate == null ? DateTime.now().subtract(Duration(days: 1)) : chartStore.mFromDate!;
    toDate = chartStore.mToDate == null ? DateTime.now() : chartStore.mToDate!;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, bottom: 32, right: 16, top: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 2, width: 36, decoration: boxDecorationDefault(borderRadius: radius())).center(),
          16.height,
          Row(
            children: [
              Text('lbl_select_Date'.translate, style: boldTextStyle()).expand(),
              TextIcon(
                text: 'lbl_reset'.translate,
                onTap: () {
                  fromDate = DateTime.now().subtract(Duration(days: 1));
                  toDate = DateTime.now();
                  chartStore.setIsDateSelected(false);
                  chartStore.setRangeDifference(1);
                  setState(() {});
                  //finish(context);
                },
              )
            ],
          ),
          16.height,
          Container(
            width: context.width(),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(border: Border.all(color: context.dividerColor), borderRadius: radius()),
            child: Text(getFormatted(fromDate), style: primaryTextStyle()),
          ).onTap(
            () async {
              fromDate = await buildShowDatePicker(context, helpText: 'lbl_from'.translate, initialDate: fromDate) ?? DateTime.now();
              /* if (chartStore.mToDate == null) {
                  await 150.milliseconds.delay;
                  toDate = await buildShowDatePicker(context, helpText: 'lbl_to'.translate, initialDate: fromDate) ?? DateTime.now();
                }*/
              if (!toDate.difference(fromDate).inDays.isNegative) {
                differences = toDate.difference(fromDate).inDays;
              } else {
                toast("lbl_invalid_date_range".translate);
                fromDate = DateTime.now().subtract(Duration(days: 1));
                toDate = DateTime.now();
              }
              chartStore.setFromDate(fromDate);
              setState(() {});
            },
          ),
          16.height,
          Container(
            width: context.width(),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(border: Border.all(color: context.dividerColor), borderRadius: radius()),
            child: Text(getFormatted(toDate), style: primaryTextStyle()),
          ).onTap(() async {
            toDate = await buildShowDatePicker(context, helpText: 'lbl_to'.translate, initialDate: toDate) ?? DateTime.now();
            if (!toDate.difference(fromDate).inDays.isNegative) {
              differences = toDate.difference(fromDate).inDays;
            } else {
              toast("Invalid date range");
              fromDate = DateTime.now().subtract(Duration(days: 1));
              toDate = DateTime.now();
            }
            /*if (fromDate != null) {

            } else {
              toast("lbl_select_from_date_first".translate);
            }*/
            chartStore.setToDate(toDate);
            setState(() {});
          }),
          16.height,
          AppButton(
            width: context.width(),
            text: "lbl_confirm".translate,
            onTap: () {
              finish(context);
              chartStore.setFromDate(fromDate);
              chartStore.setToDate(toDate);
              chartStore.setRangeDifference(differences);
            },
          ),
        ],
      ),
    );
  }

  Future<DateTime?> buildShowDatePicker(BuildContext context, {String helpText = '', DateTime? initialDate}) {
    return showDatePicker(
      context: context,
      initialDate: initialDate == null ? DateTime.now() : initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: helpText.validate(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: themePrimaryColor,
              onPrimary: context.iconColor,
              surface: themePrimaryColor,
              onSurface: context.iconColor,
            ),
            dialogBackgroundColor: context.cardColor,
          ),
          child: child!,
        );
      },
    );
  }
}
