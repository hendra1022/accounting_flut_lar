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
    return GetBuilder<LoginController>(
      builder: (controller) => Form(
        key: controller.formKey,
        child: Column(
          children: [
            VInputText(
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
                padding: EdgeInsets.symmetric(horizontal: paddingSuperSmall.sp),
                child: const Icon(
                  Icons.person,
                  color: VColor.secondary,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Username can't be empty";
                }
                return null;
              },
            ),
            SizedBox(
              height: marginMedium.h,
            ),
            VInputText(
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
                padding: EdgeInsets.symmetric(horizontal: paddingSuperSmall.sp),
                child: const Icon(
                  Icons.lock,
                  color: VColor.secondary,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password can't be empty";
                }
                return null;
              },
            ),
            SizedBox(height: paddingMedium.h),
            SizedBox(
              width: double.infinity,
              child: VButton(
                "Login",
                buttonColor: VColor.secondary,
                textAlign: TextAlign.center,
                textPadding: marginExtraLarge,
                centerText: true,
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {}
                  await controller.doLogin();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
