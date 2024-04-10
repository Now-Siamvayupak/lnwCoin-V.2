import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/coin_sorting_model.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/widgets/selected_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CoinSortingTypeComponent extends StatefulWidget {
  @override
  _CoinSortingTypeComponentState createState() => _CoinSortingTypeComponentState();
}

class _CoinSortingTypeComponentState extends State<CoinSortingTypeComponent> {
  int selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    selectedIndex = getIntAsync(SharedPreferenceKeys.SORTING_ORDER_SELECTED_INDEX, defaultValue: 3);
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
            Text('lbl_set_sort_order'.translate, style: boldTextStyle()).center(),
            IconButton(
              icon: Icon(Icons.done),
              onPressed: () {
                finish(context, true);
                setValue(SharedPreferenceKeys.SORTING_ORDER_SELECTED_INDEX, selectedIndex);
                coinStore.setSelectedSortType(selectedIndex);
              },
            ),
          ],
        ),
        8.height,
        Divider(height: 0),
        Wrap(
          children: List.generate(SortingTypeModel.getSortingTypeList.length, (index) {
            SortingTypeModel data = SortingTypeModel.getSortingTypeList[index];
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
            );
          }),
        ),
        16.height,
      ],
    );
  }
}
