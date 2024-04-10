import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/current_currency_model.dart';
import 'package:lnwcoin/model/search_model.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/services/keys.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/get_detail_view_currency.dart';
import 'package:lnwcoin/widgets/app_scaffold.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class AddPortfolioScreen extends StatefulWidget {
  Coin? coinData;

  AddPortfolioScreen({this.coinData});

  @override
  _AddPortfolioScreenState createState() => _AddPortfolioScreenState();
}

class _AddPortfolioScreenState extends State<AddPortfolioScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameCont = TextEditingController();
  TextEditingController dateCont = TextEditingController();
  TextEditingController noOfUnitsCont = TextEditingController();
  TextEditingController priceCont = TextEditingController();
  TextEditingController perCoinCont = TextEditingController();
  TextEditingController notesCont = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode dateFocus = FocusNode();
  FocusNode noOfUnitsFocus = FocusNode();
  FocusNode priceFocus = FocusNode();
  FocusNode perCoinFocus = FocusNode();
  FocusNode notesFocus = FocusNode();

  Timestamp? pickedDate = Timestamp.now();

  List<CurrentCurrencyModel> currentDataList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    if (widget.coinData != null) {
      appStore.setLoading(true);
      await getCoinDetail(name: widget.coinData!.id.validate()).then((value) {
        nameCont.text = value.name.validate();
        perCoinCont.text = getPercentageValueInCurrency(value.market_data!.current_price!).toString();
        dateCont.text = DateFormat('dd MMM yyyy').format(pickedDate!.toDate());

        value.market_data!.current_price!.toJson().forEach((key, value) {
          currentDataList.add(CurrentCurrencyModel(currency: key, currentValue: value));
        });
      }).catchError((e) {
        toast(e.toString(), print: true);
      }).whenComplete(() => appStore.setLoading(false));
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void saveData() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      hideKeyboard(context);
      showConfirmDialogCustom(
        context,
        primaryColor: themePrimaryColor,
        title: "lbl_are_you_sure_want_to_this_coin".translate,
        onAccept: (c) async {
          Map<String, dynamic> userRequest = {
            userKeys.uid: appStore.uid,
            endUserKey.isAdmin: false,
            endUserKey.createdDate: Timestamp.now(),
            endUserKey.updatedDate: Timestamp.now(),
          };

          Map<String, dynamic> portfolioRequest = {
            portfolioKey.date: pickedDate,
            portfolioKey.name: nameCont.text,
            portfolioKey.noOfUnits: noOfUnitsCont.text.toDouble(),
            portfolioKey.notes: notesCont.text,
            portfolioKey.coinIcon: widget.coinData!.large.validate(),
            portfolioKey.coinSymbol: widget.coinData!.symbol.validate(),
            portfolioKey.perCoin: perCoinCont.text.toDouble(),
            portfolioKey.coinId: widget.coinData!.id.validate(),
            portfolioKey.buyInCurrency: appStore.mSelectedCurrency?.symbol.validate(),
            portfolioKey.price: priceCont.text.toDouble(),
            portfolioKey.createdDate: Timestamp.now(),
            portfolioKey.updatedDate: Timestamp.now(),
            portfolioKey.currentCurrencyList: FieldValue.arrayUnion(currentDataList.map((e) => e.toJson()).toList()),
          };

          await portfolioService.addNewPortfolio(userRequest: userRequest, portfolioRequest: portfolioRequest).then((value) {
            toast("lbl_portfolio_added".translate);
            finish(context);
            finish(context);
            LiveStream().emit("UpdatePortfolioData", true);
          }).catchError((e) {
            log(e.toString());
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text('lbl_add_portfolio'.translate, style: boldTextStyle(size: 22)),
      ),
      body: Observer(
        builder: (_) => Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.all(8),
            width: context.width(),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    controller: nameCont,
                    focus: nameFocus,
                    readOnly: true,
                    enabled: false,
                    nextFocus: dateFocus,
                    decoration: AppCommon.webInputDecoration("${"lbl_name".translate}*", context),
                  ),
                  16.height,
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    controller: dateCont,
                    focus: dateFocus,
                    nextFocus: noOfUnitsFocus,
                    readOnly: true,
                    onTap: () async {
                      pickedDate = Timestamp.fromDate((await showDatePicker(
                        context: context,
                        initialDate: pickedDate!.toDate(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                        builder: (context, child) => Theme(
                            data: ThemeData(
                              textTheme: TextTheme(
                                caption: secondaryTextStyle(color: Colors.white, size: 12),
                              ),
                              primarySwatch: createMaterialColor(cardColor),
                              dialogTheme: DialogTheme(
                                contentTextStyle: boldTextStyle(color: Colors.white),
                                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                              ),
                            ),
                            child: child!),
                      ))!);
                      if (pickedDate != null) {
                        dateCont.text = DateFormat('dd MMM yyyy').format(pickedDate!.toDate());
                      }
                    },
                    decoration: AppCommon.webInputDecoration("${"lbl_date".translate}*", context).copyWith(
                      suffixIcon: Icon(Icons.calendar_today, color: Colors.white),
                    ),
                  ),
                  16.height,
                  AppTextField(
                    textFieldType: TextFieldType.PHONE,
                    controller: noOfUnitsCont,
                    focus: noOfUnitsFocus,
                    nextFocus: priceFocus,
                    onChanged: (unitPrice) {
                      priceCont.text = (perCoinCont.text.toDouble() * unitPrice.toDouble()).toStringAsFixed(2);
                    },
                    decoration: AppCommon.webInputDecoration("${"lbl_no_of_units".translate}*", context),
                  ),
                  16.height,
                  Observer(
                    builder: (_) => AppTextField(
                      textFieldType: TextFieldType.PHONE,
                      controller: perCoinCont,
                      onChanged: (perCoinPrice) {
                        priceCont.text = (perCoinPrice.toDouble() * noOfUnitsCont.text.toDouble()).toStringAsFixed(2);
                      },
                      focus: perCoinFocus,
                      nextFocus: notesFocus,
                      decoration: AppCommon.webInputDecoration("${"lbl_per_coin_price".translate}*", context).copyWith(
                        prefixIcon: IconButton(onPressed: () {}, icon: Text('${appStore.mSelectedCurrency?.symbol.validate()}', style: boldTextStyle())),
                      ),
                    ),
                  ),
                  16.height,
                  Observer(
                    builder: (_) => AppTextField(
                      textFieldType: TextFieldType.PHONE,
                      controller: priceCont,
                      focus: priceFocus,
                      nextFocus: perCoinFocus,
                      enabled: false,
                      readOnly: true,
                      decoration: AppCommon.webInputDecoration("lbl_total_price".translate, context).copyWith(
                        prefixIcon: IconButton(onPressed: () {}, icon: Text('${appStore.mSelectedCurrency?.symbol.validate()}', style: boldTextStyle())),
                      ),
                    ),
                  ),
                  16.height,
                  Observer(builder: (context) {
                    return AppTextField(
                      textFieldType: TextFieldType.NAME,
                      controller: notesCont,
                      focus: notesFocus,
                      onFieldSubmitted: (s) {
                        saveData();
                      },
                      isValidationRequired: false,
                      maxLines: 6,
                      minLines: 3,
                      decoration: AppCommon.webInputDecoration("Notes", context).copyWith(alignLabelWithHint: true),
                    );
                  }),
                ],
              ),
            ),
          ),
        ).visible(!appStore.mIsLoading.validate(), defaultWidget: LoaderWidget()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          saveData();
        },
        child: Observer(builder: (_) => Icon(Icons.done, color: appStore.isDarkMode ? Colors.white : Colors.black)),
      ),
    );
  }
}
