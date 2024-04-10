import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/services/keys.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/loader_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController fullNameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  TextEditingController confirmPassCont = TextEditingController();

  FocusNode firstNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  FocusNode conformPassFocus = FocusNode();

  void submit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      hideKeyboard(context);
      Map<String, dynamic> data = {
        userKeys.firstName: fullNameCont.text.trim(),
        userKeys.email: emailCont.text.trim(),
        userKeys.photoUrl: "",
        userKeys.isEmailLogin: true,
        userKeys.password: passCont.text,
        userKeys.isTester: true,
        userKeys.userRole: "user",
        userKeys.createdAt: Timestamp.now(),
        userKeys.updatedAt: Timestamp.now(),
      };
      appStore.setIsLoading(true);
      if (await userService.isUserExist(emailCont.text)) {
        toast("lbl_user_already_exits".translate);
        appStore.setIsLoading(false);
        finish(context);
      } else {
        authService.signUpWithEmailPassword(userData: data).then((value) {
          finish(context);
        }).catchError((e) {
          toast(e.toString());
        }).whenComplete(() => appStore.setIsLoading(false));
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("lbl_already_have_an_account".translate, style: secondaryTextStyle(size: 14)),
          2.width,
          TextButton(
            child: Text('lbl_sign_in'.translate, style: boldTextStyle()),
            onPressed: () {
              finish(context);
            },
          )
        ],
      ),
      appBar: AppBar(
        title: Text('', style: boldTextStyle()),
      ),
      backgroundColor: context.scaffoldBackgroundColor,
      body: Stack(
        children: [
          Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('images/app_images/app_logo.png', height: 60, width: 60, fit: BoxFit.cover),
                            16.height,
                            Text("lbl_sign_up".translate, style: boldTextStyle(size: 22)),
                            4.height,
                            Text('lbl_please_fill_the_input_below'.translate, style: secondaryTextStyle()),
                          ],
                        ),
                      ),
                      32.height,
                      AppTextField(
                        controller: fullNameCont,
                        textFieldType: TextFieldType.NAME,
                        keyboardType: TextInputType.name,
                        autoFocus: false,
                        nextFocus: emailFocus,
                        decoration: AppCommon.inputDecoration('lbl_full_name'.translate),
                      ),
                      16.height,
                      AppTextField(
                        controller: emailCont,
                        textFieldType: TextFieldType.EMAIL,
                        focus: emailFocus,
                        nextFocus: passFocus,
                        decoration: AppCommon.inputDecoration('lbl_email'.translate),
                      ),
                      16.height,
                      AppTextField(
                        controller: passCont,
                        textFieldType: TextFieldType.PASSWORD,
                        nextFocus: conformPassFocus,
                        decoration: AppCommon.inputDecoration('lbl_password'.translate),
                        autoFillHints: [AutofillHints.newPassword],
                      ),
                      16.height,
                      AppTextField(
                        controller: confirmPassCont,
                        textFieldType: TextFieldType.PASSWORD,
                        focus: conformPassFocus,
                        validator: (String? value) {
                          if (value!.isEmpty) return errorThisFieldRequired;
                          if (value.length < passwordLengthGlobal) return 'lbl_password_length_should_more_than_six'.translate;

                          if (value.trim() != passCont.text.trim()) return 'lbl_both_password_should_be_matched'.translate;

                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (s) {
                          submit();
                        },
                        decoration: AppCommon.inputDecoration('lbl_confirm_password'.translate),
                      ),
                      32.height,
                      AppButton(
                        width: context.width(),
                        height: 45,
                        color: themePrimaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        text: 'lbl_sign_up'.translate,
                        shapeBorder: RoundedRectangleBorder(borderRadius: radius(defaultRadius)),
                        onTap: () {
                          submit();
                        },
                      ),
                    ],
                  ).center(),
                ],
              ).paddingAll(16),
            ),
          ),
          Observer(builder: (context) => LoaderWidget().visible(appStore.isLoading).center()),
        ],
      ),
    );
  }
}
