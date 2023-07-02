import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/widgets/categories.dart';

class TabletsTab extends StatefulWidget {
  const TabletsTab({Key? key}) : super(key: key);

  @override
  State<TabletsTab> createState() => _TabletsTabState();
}

class _TabletsTabState extends State<TabletsTab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650.h,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          children: [
            Categories(
                productName: context.localization.tab_s8_ultra,
                productDescription: context.localization.tab_s8_ultra_description,
                price: 1099
            ),
            Categories(
                productName: context.localization.tab_s7,
                productDescription: context.localization.tab_s7_description,
                price: 549
            ),
            Categories(
                productName: context.localization.tab_a8,
                productDescription: context.localization.tab_a8_description,
                price: 259
            ),
            Categories(
                productName: context.localization.tab_a7,
                productDescription: context.localization.tab_a7_description,
                price: 134
            ),
          ],
        ),
    );
  }
}
