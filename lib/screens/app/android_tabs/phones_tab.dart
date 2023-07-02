import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/widgets/categories.dart';

class PhonesTab extends StatefulWidget {
  const PhonesTab({Key? key}) : super(key: key);

  @override
  State<PhonesTab> createState() => _PhonesTabState();
}

class _PhonesTabState extends State<PhonesTab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650.h,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        children: [
          Categories(
              productName: context.localization.samsung_s23_ultra,
              productDescription: context.localization.samsung_s23_ultra_description,
              price: 1199
          ),
          Categories(
              productName: context.localization.samsung_s22_ultra,
              productDescription: context.localization.samsung_s22_ultra_description,
              price: 950
          ),
          Categories(
              productName: context.localization.samsung_z_fold4,
              productDescription: context.localization.samsung_z_fold4_description,
              price: 1799,
          ),
          Categories(
            productName: context.localization.vivo_x80_pro,
            productDescription: context.localization.vivo_x80_pro_description,
            price: 799,
          ),
          Categories(
            productName: context.localization.google_pixel_6a,
            productDescription: context.localization.google_pixel_6a_description,
            price: 297,
          ),
          Categories(
              productName: context.localization.asus_zenfone9,
              productDescription: context.localization.asus_zenfone9_description,
              price: 699
          ),
        ],
      ),
    );
  }
}
