import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/widgets/categories.dart';

class IphoneTab extends StatefulWidget {
  const IphoneTab({Key? key}) : super(key: key);

  @override
  State<IphoneTab> createState() => _IphoneTabState();
}

class _IphoneTabState extends State<IphoneTab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650.h,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        children: [
          Categories(
              productName: context.localization.iphone_14_pro,
              productDescription: context.localization.iphone_14_pro_description,
              price: 999,
          ),
          Categories(
            productName: context.localization.iphone_14,
            productDescription: context.localization.iphone_14_description,
            price: 799,
          ),
          Categories(
              productName: context.localization.iphone_13_pro,
              productDescription: context.localization.iphone_13_pro_description,
              price: 599
          ),
          Categories(
              productName: context.localization.iphone_se,
              productDescription: context.localization.iphone_se_description,
              price: 429
          ),
        ],
      ),
    );
  }
}
