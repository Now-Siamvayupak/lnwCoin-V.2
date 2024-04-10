import 'package:lnwcoin/model/coin_list_model.dart';
import 'package:lnwcoin/screens/coin_all_list_screen.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/widgets/crypto_dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class MarketComponent extends StatefulWidget {
  List<CoinListModel> mainList;

  MarketComponent({required this.mainList});

  @override
  _MarketComponentState createState() => _MarketComponentState();
}

class _MarketComponentState extends State<MarketComponent> {
  int indexValue = 0;
  List<Widget> optionsList = [];

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('lbl_market'.translate, style: boldTextStyle(size: 18)),
              TextButton(
                  onPressed: () {
                    CoinAllListScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                  },
                  child: Text('lbl_view_all'.translate, style: secondaryTextStyle()))
            ],
          ).paddingSymmetric(horizontal: 16),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.mainList.length,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(left: 16, right: 16),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CryptoDashboardWidget(index: index, coinListModel: widget.mainList[index], isFromDashboard: true);
            },
          )
        ],
      ),
    );
  }
}
