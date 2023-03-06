import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import '../v_color.dart';
import 'v_widgets.dart';

class CustomBarChart extends StatelessWidget {
  final String? leftTitle;
  final String? rightTitle;
  final String? leftAmount;
  final String? rightAmount;
  final double? value;
  final Color? barValueColor;
  final Color? barBackgroundColor;
  final String? valueString;

  const CustomBarChart(
      {super.key,
      this.leftTitle,
      this.rightTitle,
      this.barValueColor = VColor.primary,
      this.barBackgroundColor = VColor.primaryOpacity,
      this.leftAmount = "",
      this.rightAmount = "0",
      this.value = 0,
      this.valueString = "0%"});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VText(
                leftAmount.toString(),
                color: VColor.black,
                fontSize: textSizeMedium.sp,
                isBold: false,
              ),
              VText(
                rightAmount.toString(),
                color: VColor.black,
                fontSize: textSizeMedium.sp,
                isBold: false,
              ),
            ],
          ),
          SizedBox(
            height: marginSmall.h,
          ),
          Stack(
            children: [
              SizedBox(
                height: marginExtraLarge.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(radiusLarge)),
                  child: LinearProgressIndicator(
                    backgroundColor: barBackgroundColor,
                    valueColor: AlwaysStoppedAnimation<Color>(value! >= 1 ? VColor.green : barValueColor!),
                    value: value,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingMedium.h, vertical: paddingSuperSmall.w),
                child: VText(
                  valueString,
                  color: VColor.white,
                  fontSize: textSizeMedium.sp,
                  isBold: false,
                ),
              )
            ],
          ),
          SizedBox(
            height: marginSmall.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VText(
                leftTitle,
                color: VColor.black,
                fontSize: textSizeMedium.sp,
                isBold: false,
              ),
              VText(
                rightTitle,
                color: VColor.black,
                fontSize: textSizeMedium.sp,
                isBold: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
