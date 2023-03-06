import 'package:flutter/material.dart';

import '../../utils/v_color.dart';
import '../../utils/widgets/v_widgets.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      backgroundColor: VColor.background,
    );
  }

  _body() {
    return const Center(
      child: VText("dashboard"),
    );
  }
}
