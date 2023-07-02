import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/widgets/categories.dart';

class MacTap extends StatefulWidget {
  const MacTap({Key? key}) : super(key: key);

  @override
  State<MacTap> createState() => _MacTapState();
}

class _MacTapState extends State<MacTap> {
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
              productName: context.localization.mac_book_bro,
              productDescription: context.localization.mac_book_pro_description,
              price: 2499
          ),
          Categories(
              productName: context.localization.mac_book_air_m1,
              productDescription: context.localization.mac_book_air_m1_description,
              price: 999
          ),
          Categories(
              productName: context.localization.mac_book_air_m2,
              productDescription: context.localization.mac_book_air_m2_description,
              price: 1199
          ),
          Categories(
              productName: context.localization.imac,
              productDescription: context.localization.imac_description,
              price: 1499
          ),
          Categories(
              productName: context.localization.mac_mini,
              productDescription: context.localization.mac_mini_description,
              price: 599
          ),
        ],
      ),
    );
  }
}
