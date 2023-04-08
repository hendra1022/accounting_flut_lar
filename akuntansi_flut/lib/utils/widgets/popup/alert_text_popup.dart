import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import '../../v_color.dart';
import '../v_widgets.dart';

class AlertTextPopup extends StatelessWidget {
  final String? title;
  final String? message;
  const AlertTextPopup({super.key, this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(paddingExtraLarge),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: VText(
              title,
              color: VColor.black,
              fontSize: textSizeLarge.sp,
              isBold: true,
            ),
          ),
          const SizedBox(
            height: marginLarge,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: VText(
              message,
              color: VColor.grey3,
              fontSize: textSizeMedium.sp,
              isBold: false,
            ),
          ),
          const SizedBox(
            height: marginExtraLarge,
          ),
          VButton(
            "Ok",
            textPadding: paddingMedium,
            textColor: VColor.white,
            buttonColor: VColor.secondary,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
