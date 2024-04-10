import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/app_scaffold.dart';

class ChangePasswordScreen extends StatefulWidget {
  static String tag = '/ChangePasswordScreen';

  @override
  ChangePasswordScreenState createState() => ChangePasswordScreenState();
}

class ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController oldPasswordCont = TextEditingController();
  TextEditingController newPasswordCont = TextEditingController();
  TextEditingController confirmPasswordCont = TextEditingController();

  FocusNode oldPassNode = FocusNode();
  FocusNode newPasswordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  void submit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      appStore.setIsLoading(true);
      authService.changePassword(newPasswordCont.text).then((value) {
        finish(context);
        toast('lbl_new_password_change'.translate);
      })
        ..catchError((e) {
          log('error string');
          log(e.toString());
        }).whenComplete(() => appStore.setIsLoading(false));
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('lbl_change_password'.translate, style: boldTextStyle()),
                  32.height,
                  AppTextField(
                      controller: oldPasswordCont,
                      focus: oldPassNode,
                      textFieldType: TextFieldType.PASSWORD,
                      validator: (s) {
                        if (s!.trim().isEmpty) return errorThisFieldRequired;
                        if (s.trim() != getStringAsync(SharedPreferenceKeys.password)) return "lbl_old_password_is_wrong".translate;
                        return null;
                      },
                      nextFocus: newPasswordNode,
                      decoration: AppCommon.inputDecoration('lbl_old_password'.translate)),
                  16.height,
                  AppTextField(
                      controller: newPasswordCont,
                      focus: newPasswordNode,
                      textFieldType: TextFieldType.PASSWORD,
                      nextFocus: confirmPasswordNode,
                      decoration: AppCommon.inputDecoration('lbl_new_password'.translate)),
                  16.height,
                  AppTextField(
                      controller: confirmPasswordCont,
                      textFieldType: TextFieldType.PASSWORD,
                      focus: confirmPasswordNode,
                      validator: (s) {
                        if (s!.trim().isEmpty) return errorThisFieldRequired;
                        if (s.trim() != newPasswordCont.text) return "lbl_confirm_password_must_be_new_password".translate;
                        return null;
                      },
                      onFieldSubmitted: (s) {
                        submit();
                      },
                      decoration: AppCommon.inputDecoration('lbl_confirm_password'.translate)),
                  16.height,
                  AppButton(
                    color: themePrimaryColor,
                    width: context.width(),
                    text: 'lbl_submit'.translate,
                    shapeBorder: RoundedRectangleBorder(borderRadius: radius(16)),
                    onTap: () {
                      submit();
                    },
                  ),
                ],
              ).center().paddingAll(16),
            ),
          ),
          Observer(builder: (context) => LoaderWidget().visible(appStore.isLoading).center()),
        ],
      ),
    );
  }
}
