import 'package:akuntansi_flut/utils/constants.dart';
import 'package:akuntansi_flut/utils/v_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/widgets/v_widgets.dart';
import '../login.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          GetBuilder<LoginController>(
            builder: (controller) => VInputText(
              hint: "Username",
              textCapitalization: TextCapitalization.none,
              textInputAction: TextInputAction.next,
              filled: true,
              fillColor: VColor.white,
              hintTextColor: VColor.grey1,
              textEditingController: controller.usernameTextController,
              keyboardType: TextInputType.emailAddress,
              textPadding: paddingSuperSmall.w,
              prefixIcon: Container(
                padding: EdgeInsets.only(
                  right: paddingSuperSmall.w,
                  left: paddingSmall.w,
                ),
                child: const Icon(
                  Icons.person,
                  color: VColor.secondary,
                ),
              ),
            ),
          ),
          SizedBox(
            height: marginMedium.h,
          ),
          GetBuilder<LoginController>(
            builder: (controller) => VInputText(
              hint: "Password",
              textCapitalization: TextCapitalization.none,
              textInputAction: TextInputAction.next,
              filled: true,
              fillColor: VColor.white,
              hintTextColor: VColor.grey1,
              textEditingController: controller.passwordTextController,
              keyboardType: TextInputType.emailAddress,
              textPadding: paddingSuperSmall.w,
              prefixIcon: Container(
                padding: EdgeInsets.only(
                  right: paddingSuperSmall.w,
                  left: paddingSmall.w,
                ),
                child: const Icon(
                  Icons.lock,
                  color: VColor.secondary,
                ),
              ),
            ),
          ),
          SizedBox(height: paddingMedium.h),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 50),
            child: SizedBox(
              width: double.infinity,
              child: VButton(
                "Login",
                buttonColor: VColor.secondary,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
