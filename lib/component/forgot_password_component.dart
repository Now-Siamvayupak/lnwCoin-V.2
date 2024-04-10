import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

class ForgotPasswordComponent extends StatefulWidget {
  @override
  _ForgotPasswordComponentState createState() => _ForgotPasswordComponentState();
}

class _ForgotPasswordComponentState extends State<ForgotPasswordComponent> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailCont = TextEditingController();

  void submit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      appStore.setIsLoading(true);
      authService.forgotPassword(email: emailCont.text).then((value) {
        toast("lbl_email_has_been_sent_to_your_email".translate);
        finish(context);
      }).catchError((e) {
        toast(e.toString());
        log("Forgot Password Error : ${e.toString()}");
      }).whenComplete(() => appStore.setIsLoading(false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    finish(context);
                  },
                  padding: EdgeInsets.all(0),
                ),
              ),
              Text('lbl_forgot_password'.translate, style: boldTextStyle()),
              16.height,
              Text('lbl_reset_password_link_will_be_sent_to'.translate, style: secondaryTextStyle()),
              16.height,
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: AppTextField(
                  textFieldType: TextFieldType.EMAIL,
                  autoFocus: true,
                  controller: emailCont,
                  decoration: AppCommon.inputDecoration('Email'),
                  onFieldSubmitted: (s) {
                    submit();
                  },
                ),
              ),
              24.height,
              AppButton(
                color: themePrimaryColor,
                width: context.width(),
                text: 'lbl_send'.translate,
                onTap: () {
                  submit();
                },
                shapeBorder: RoundedRectangleBorder(borderRadius: radius(16)),
              ),
            ],
          ),
        ),
        Observer(builder: (context) => LoaderWidget().withSize(width: 50, height: 50).visible(appStore.isLoading))
      ],
    );
  }
}
