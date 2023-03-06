import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../v_color.dart';
import '../v_widgets.dart';

class LoadingPopup extends StatelessWidget {
  const LoadingPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(radiusMedium),
        child: Container(
          padding: EdgeInsets.all(paddingExtraLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: imageSizeMedium,
                height: imageSizeMedium,
                child: CircularProgressIndicator(
                  strokeWidth: paddingSuperSmall,
                  valueColor: const AlwaysStoppedAnimation<Color>(VColor.secondary),
                ),
              ),
              SizedBox(
                height: marginLarge,
              ),
              VText(
                "Loading",
                color: VColor.black,
                isBold: true,
                fontSize: textSizeMedium,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
