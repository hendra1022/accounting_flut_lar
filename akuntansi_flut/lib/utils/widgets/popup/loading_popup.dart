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
          padding: const EdgeInsets.all(paddingExtraLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: imageSizeMedium,
                height: imageSizeMedium,
                child: const CircularProgressIndicator(
                  strokeWidth: paddingSuperSmall,
                  valueColor: AlwaysStoppedAnimation<Color>(VColor.secondary),
                ),
              ),
              const SizedBox(
                height: marginLarge,
              ),
              const VText(
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
