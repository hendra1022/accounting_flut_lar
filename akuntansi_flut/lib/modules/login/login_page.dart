import 'package:akuntansi_flut/modules/login/components/login_form.dart';
import 'package:akuntansi_flut/modules/login/login.dart';
import 'package:akuntansi_flut/utils/constants.dart';
import 'package:akuntansi_flut/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/v_color.dart';
import 'components/login_screen_top_image.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      backgroundColor: VColor.background,
    );
  }

  _body() {
    return SingleChildScrollView(
      child: GetBuilder<LoginController>(
        builder: (controller) => const Responsive(
          mobile: MobileLoginPage(),
          desktop: DeskopLoginPage(),
        ),
      ),
    );
  }
}

class MobileLoginPage extends StatelessWidget {
  const MobileLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingExtraLarge.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LoginScreenTopImage(),
          Row(
            children: const [
              Expanded(
                flex: 8,
                child: LoginForm(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DeskopLoginPage extends StatelessWidget {
  const DeskopLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingExtraLarge.w),
      child: Row(
        children: [
          const Expanded(
            child: LoginScreenTopImage(),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(width: 450, child: LoginForm()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
