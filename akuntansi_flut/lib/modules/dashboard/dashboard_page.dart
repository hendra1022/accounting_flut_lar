import 'package:flutter/material.dart';

import '../../utils/widgets/v_widgets.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return const Center(
      child: VText("dashboard"),
    );
  }
}
