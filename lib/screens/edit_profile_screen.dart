import 'dart:io';

import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/services/keys.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/widgets/cached_network_image.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/app_scaffold.dart';

class EditProfileScreen extends StatefulWidget {
  static String tag = '/EditProfileScreen';

  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailCont = TextEditingController();
  TextEditingController fNameCont = TextEditingController();

  FocusNode emailNode = FocusNode();
  FocusNode fNameNode = FocusNode();

  XFile? image;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    fNameCont.text = appStore.firstName;
    emailCont.text = appStore.email;
  }

  Future submit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      appStore.setIsLoading(true);
      hideKeyboard(context);
      setState(() {});

      Map<String, dynamic> req = {
        userKeys.updatedAt: DateTime.now(),
        userKeys.uid: appStore.uid,
        userKeys.firstName: fNameCont.text,
        userKeys.email: emailCont.text,
        userKeys.isEmailLogin: appStore.isEmailLogin,
      };

      if (fNameCont.text != appStore.firstName) {
        req.putIfAbsent(userKeys.firstName, () => fNameCont.text.trim());
      }

      if (image != null) {
        await userService.getUploadedImageURL(image: File(image!.path), path: "profile", fileName: appStore.uid).then((path) async {
          req.putIfAbsent(userKeys.photoUrl, () => path);
          appStore.setPhotoUrl(path, isInitializing: true);
        }).catchError((e) {
          toast(e.toString());
        });
      }
      await userService.updateDocument(req, appStore.uid).then((value) async {
        appStore.setIsLoading(false);
        appStore.setFirstName(fNameCont.text);
        finish(context);
      });
    }
  }

  Future getImage() async {
    if (appStore.isEmailLogin) {
      image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 100);
      setState(() {});
    }
  }

  Widget profileImage() {
    if (image != null) {
      return Image.file(File(image!.path), height: 120, width: 120, fit: BoxFit.cover, alignment: Alignment.center);
    } else {
      return cachedImage(appStore.photoUrl.validate(), height: 130, width: 130, fit: BoxFit.cover, alignment: Alignment.center);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text('', style: boldTextStyle()),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('lbl_edit_profile'.translate, style: boldTextStyle(size: 24)),
                  32.height,
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(decoration: BoxDecoration(shape: BoxShape.circle), child: profileImage()).cornerRadiusWithClipRRect(80),
                      Container(
                        decoration: boxDecorationDefault(shape: BoxShape.circle),
                        child: IconButton(
                          icon: Icon(Icons.camera_alt, size: 16, color: Colors.black),
                          onPressed: () {
                            getImage();
                          },
                        ),
                      ).visible(appStore.isEmailLogin)
                    ],
                  ).center(),
                  48.height,
                  AppTextField(
                    textFieldType: TextFieldType.EMAIL,
                    controller: emailCont,
                    nextFocus: fNameNode,
                    enabled: false,
                    decoration: AppCommon.inputDecoration('lbl_email'.translate),
                  ),
                  16.height,
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    controller: fNameCont,
                    focus: fNameNode,
                    enabled: appStore.isSocialLogin ? false : true,
                    decoration: AppCommon.inputDecoration('lbl_name'.translate),
                  ),
                  32.height,
                  AppButton(
                    width: context.width(),
                    color: themePrimaryColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(defaultRadius)),
                    text: 'lbl_update_profile'.translate,
                    onTap: () {
                      showConfirmDialogCustom(
                        context,
                        title: "lbl_are_you_want_to_update_profile".translate,
                        dialogType: DialogType.UPDATE,
                        onAccept: (c) {
                          if (appStore.isTester) {
                            toast("Test user cannot perform this action");
                            return;
                          }
                          submit();
                        },
                      );
                    },
                  ),
                ],
              ).paddingAll(16),
            ).center(),
          ),
          Observer(builder: (context) {
            return LoaderWidget().visible(appStore.isLoading);
          })
        ],
      ),
    );
  }
}
