import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import '../../v_color.dart';
import '../v_widgets.dart';

class LoadingPopup extends StatelessWidget {
  const LoadingPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(radiusMedium.r),
        child: Container(
          padding: EdgeInsets.all(paddingExtraLarge.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: imageSizeMedium.w,
                height: imageSizeMedium.w,
                child: CircularProgressIndicator(
                  strokeWidth: paddingSuperSmall.w,
                  valueColor: const AlwaysStoppedAnimation<Color>(VColor.secondary),
                ),
              ),
              SizedBox(
                height: marginLarge.h,
              ),
              VText(
                "Loading",
                color: VColor.black,
                isBold: true,
                fontSize: textSizeMedium.sp,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
