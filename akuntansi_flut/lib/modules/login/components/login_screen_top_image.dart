import 'package:akuntansi_flut/utils/constants.dart';
import 'package:akuntansi_flut/utils/widgets/v_widgets.dart';
import 'package:flutter/material.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: VSvgPicture("${iconPath}chat.svg"),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: paddingMedium * 2),
      ],
    );
  }
}
