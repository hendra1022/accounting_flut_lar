import 'package:flutter/material.dart';

import 'constants.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < mobileSize;

  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= mobileSize && MediaQuery.of(context).size.width <= webSize;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width > webSize;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 992) {
      return desktop;
    } else if (size.width >= 576 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
