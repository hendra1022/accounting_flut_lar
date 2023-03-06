import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../v_color.dart';
import 'popup/alert_choice_popup.dart';
import 'popup/alert_text_popup.dart';
import 'popup/loading_popup.dart';

class VPopup {
  VPopup._privateConstructor();

  static final VPopup _instance = VPopup._privateConstructor();

  factory VPopup() {
    return _instance;
  }

  void loading() {
    Get.dialog(const LoadingPopup(), barrierDismissible: false);
  }

  AlertDialog _alertDialog({@required Widget? content}) {
    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      backgroundColor: VColor.white,
      content: content,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.all(paddingExtraLarge.w),
    );
  }

  AlertDialog dialogFull({@required Widget? content}) {
    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusMedium),
      ),
      backgroundColor: VColor.white,
      content: content,
    );
  }

  void alertText(String title, String message) {
    showGeneralDialog(
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
      context: Get.context!,
      pageBuilder: (context, anim1, anim2) {
        return Container(
          height: 400,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: _alertDialog(
              content: AlertTextPopup(
            title: title,
            message: message,
          )),
        );
      },
    );
  }

  void alertChoice(String title, String message, String positiveText, String negativeText, VoidCallback onPressOk, VoidCallback onPressCancel) {
    showGeneralDialog(
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
      context: Get.context!,
      pageBuilder: (context, anim1, anim2) {
        return Container(
          height: 400,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: _alertDialog(
              content: AlertChoicePopup(
            title: title,
            message: message,
            positiveText: positiveText,
            negativeText: negativeText,
            onPressedOk: onPressOk,
            onPressedCancel: onPressCancel,
          )),
        );
      },
    );
  }

  void alertChoiceWithCallback(
      String title, String message, String positiveText, String negativeText, VoidCallback onPressOk, VoidCallback onPressCancel, Function(dynamic) callback) {
    showGeneralDialog(
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
      context: Get.context!,
      pageBuilder: (context, anim1, anim2) {
        return Container(
          height: 400,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: _alertDialog(
              content: AlertChoicePopup(
            title: title,
            message: message,
            positiveText: positiveText,
            negativeText: negativeText,
            onPressedOk: onPressOk,
            onPressedCancel: onPressCancel,
          )),
        );
      },
    ).then((value) {
      callback(value);
    });
  }
}
