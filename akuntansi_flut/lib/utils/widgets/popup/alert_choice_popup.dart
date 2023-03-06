import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import '../../v_color.dart';
import '../v_widgets.dart';

class AlertChoicePopup extends StatelessWidget {
  final String? title;
  final String? message;
  final String? positiveText;
  final String? negativeText;
  final VoidCallback? onPressedOk;
  final VoidCallback? onPressedCancel;
  const AlertChoicePopup({super.key, this.title, this.message, this.positiveText, this.negativeText, this.onPressedOk, this.onPressedCancel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingExtraLarge),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.center,
            child: VText(
              title,
              color: VColor.black,
              fontSize: textSizeLarge.sp,
              isBold: true,
            ),
          ),
          SizedBox(
            height: marginLarge,
          ),
          Align(
            alignment: Alignment.center,
            child: VText(
              message,
              color: VColor.grey4,
              fontSize: textSizeMedium.sp,
              align: TextAlign.center,
              isBold: false,
            ),
          ),
          SizedBox(
            height: marginExtraLarge,
          ),
          VButtonBorder(
            negativeText ?? "Cancel",
            textPadding: paddingMedium,
            textColor: VColor.black,
            textColorDisabled: VColor.blackOpacity,
            buttonColor: VColor.white,
            buttonColorDisabled: VColor.grey1,
            borderColor: VColor.grey1,
            onPressed: () => onPressedCancel!(),
          ),
          SizedBox(
            height: marginMedium,
          ),
          VButton(
            positiveText ?? "Oke",
            buttonColor: VColor.secondary,
            textColor: VColor.white,
            textPadding: paddingMedium,
            onPressed: () => onPressedOk!(),
          ),
          SizedBox(
            height: marginMedium,
          ),
        ],
      ),
    );
  }
}
