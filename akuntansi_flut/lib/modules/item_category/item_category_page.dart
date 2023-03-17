import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/v_color.dart';
import '../app_bar/custom_app_bar.dart';
import 'component/filter.dart';
import 'component/header.dart';
import 'component/table_builder.dart';

class ItemCategoryPage extends StatelessWidget {
  const ItemCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      appBar: customAppBar(),
      backgroundColor: VColor.background,
    );
  }

  Widget _body() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(paddingSmall),
      child: Column(
        children: [
          const ItemCategoryHeader(),
          const SizedBox(height: marginSmall),
          Expanded(
            child: ListView(
              children: const [
                ItemCategoryFilter(),
                SizedBox(height: marginMedium),
                ItemCategoryTable(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
