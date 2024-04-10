import 'package:lnwcoin/model/categories_model.dart';
import 'package:lnwcoin/screens/coin_all_list_screen.dart';
import 'package:lnwcoin/widgets/categories_widget.dart';
import 'package:lnwcoin/widgets/category_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class CategoriesComponent extends StatefulWidget {
  static String tag = '/CategoriesComponent';

  List<CategoriesModel> categoryList;

  CategoriesComponent({required this.categoryList});

  @override
  CategoriesComponentState createState() => CategoriesComponentState();
}

class CategoriesComponentState extends State<CategoriesComponent> {
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
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(0),
      itemCount: widget.categoryList.length,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        CategoriesModel mData = widget.categoryList[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 8),
          child: InkWell(
            borderRadius: radius(20),
            onLongPress: () {
              showGeneralDialog(
                context: context,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return Container();
                },
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.4),
                barrierLabel: '',
                transitionBuilder: (context, animation, secondaryAnimation, child) {
                  return Transform.scale(
                    scale: animation.value,
                    child: AlertDialog(
                      backgroundColor: context.cardColor,
                      shape: RoundedRectangleBorder(side: BorderSide(color: context.cardColor), borderRadius: BorderRadius.circular(20)),
                      content: CategoryDialogWidget(categoriesData: mData),
                    ),
                  );
                },
              );
            },
            onTap: () {
              CoinAllListScreen(categoryId: mData.id.validate(), categoryName: mData.name.validate()).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
            },
            child: CategoriesWidget(index: index, categoriesModel: widget.categoryList[index]),
          ),
        );
      },
    );
  }
}
