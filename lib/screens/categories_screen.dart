import 'package:lnwcoin/component/categories_component.dart';
import 'package:lnwcoin/component/categories_sorting_type_component.dart';
import 'package:lnwcoin/model/categories_model.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../widgets/app_scaffold.dart';

class CategoriesScreen extends StatefulWidget {
  static String tag = '/CategoriesScreen';

  @override
  CategoriesScreenState createState() => CategoriesScreenState();
}

class CategoriesScreenState extends State<CategoriesScreen> {
  List<CategoriesModel> mainList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    fetchAllCategoriesData(sortingOrder: selectedCategorySortingType?.value.validate());
  }

  Future fetchAllCategoriesData({String? sortingOrder}) async {
    appStore.setLoading(true);
    getCategoriesList(sortingOrder: sortingOrder!).then((value) {
      mainList.addAll(value);
      setState(() {});
    }).catchError((e) {
      toast(e.toString());
    }).whenComplete(() {
      appStore.setLoading(false);
    });
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
          title: Text("lbl_categories".translate, style: boldTextStyle(size: 22)),
        ),
        body: Stack(
          children: [
            sortingWidget(),
            ListView.builder(
              padding: EdgeInsets.only(bottom: 60),
              itemCount: mainList.length,
              physics: ClampingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CategoriesComponent(categoryList: mainList);
              },
            ).paddingTop(46),
            LoaderWidget().visible(appStore.mIsLoading.validate()),
          ],
        ),
      ),
    );
  }

  Widget sortingWidget() {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 8),
      child: Row(
        children: [
          Observer(
            builder: (_) => Container(
              child: TextIcon(
                text: categoriesStore.selectedSortType?.name.validate(),
                textStyle: primaryTextStyle(size: 14, color: white),
                suffix: Icon(Icons.arrow_downward_rounded, size: 16, color: white),
              ),
              decoration: boxDecorationDefault(color: themePrimaryColor),
            ).onTap(() async {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                backgroundColor: context.cardColor,
                builder: (context) {
                  return CategorySortingTypeComponent();
                },
              ).then((value) {
                if (value == true) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();

                  mainList.clear();

                  fetchAllCategoriesData(sortingOrder: selectedCategorySortingType?.value.validate());

                  setState(() {});
                } else {
                  //
                }
              }).catchError((e) {
                toast("error ${e.toString()}");
              });
            }),
          ),
        ],
      ),
    );
  }
}
