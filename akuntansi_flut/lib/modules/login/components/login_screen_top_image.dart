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
            Expanded(
              flex: 5,
              child: VSvgPicture("${iconPath}chat.svg"),
            ),
          ],
        ),
        SizedBox(height: paddingMedium * 2),
      ],
    );
  }
}
