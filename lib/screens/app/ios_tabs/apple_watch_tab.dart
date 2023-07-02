import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/widgets/categories.dart';

class AppleWatchTab extends StatefulWidget {
  const AppleWatchTab({Key? key}) : super(key: key);

  @override
  State<AppleWatchTab> createState() => _AppleWatchTabState();
}

class _AppleWatchTabState extends State<AppleWatchTab> {

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
              productName: context.localization.apple_watch_se,
              productDescription: context.localization.apple_watch_se_description,
              price: 249
          ),
          Categories(
              productName: context.localization.apple_watch_series8,
              productDescription: context.localization.apple_watch_series8_description,
              price: 399
          ),
          Categories(
              productName: context.localization.apple_watch_ultra,
              productDescription: context.localization.apple_watch_ultra_description,
              price: 799
          ),
        ],
      ),
    );
  }
}
