import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/coin_sorting_model.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/widgets/selected_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CoinIntervalComponent extends StatefulWidget {
  @override
  _CoinIntervalComponentState createState() => _CoinIntervalComponentState();
}

class _CoinIntervalComponentState extends State<CoinIntervalComponent> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    selectedIndex = getIntAsync(SharedPreferenceKeys.DEFAULT_INTERVAL_SELECTED_INDEX, defaultValue: 0);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        8.height,
        Container(
          height: 4,
          width: 40,
          decoration: boxDecorationDefault(borderRadius: radius()),
        ),
        16.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text('lbl_set_interval'.translate, style: boldTextStyle()).center(),
            IconButton(
              icon: Icon(Icons.done),
              onPressed: () {
                finish(context, true);
                setValue(SharedPreferenceKeys.DEFAULT_INTERVAL_SELECTED_INDEX, selectedIndex);
                coinStore.setSelectedIntervalType(selectedIndex);
              },
            ),
          ],
        ),
        8.height,
        Divider(height: 0),
        Wrap(
          children: List.generate(SortingTypeModel.getSortingIntervalList.length, (index) {
            SortingTypeModel data = SortingTypeModel.getSortingIntervalList[index];
            bool isSelected = selectedIndex == index;
            return Container(
              width: context.width(),
              child: SettingItemWidget(
                decoration: BoxDecoration(color: isSelected ? themePrimaryColor.withOpacity(0.2) : null),
                title: data.name.validate(),
                titleTextStyle: primaryTextStyle(),
                trailing: isSelected
                    ? SelectedItemWidget(
                        itemSize: 16,
                      )
                    : Offstage(),
                onTap: () {
                  selectedIndex = index;
                  setState(() {});
                },
              ),
              // child: Text(data.validate(), style: primaryTextStyle()),
            );
          }),
        ),
        16.height,
      ],
    );
  }
}
