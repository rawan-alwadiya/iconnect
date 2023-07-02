
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/widgets/categories.dart';

class IpadTab extends StatefulWidget {
  const IpadTab({Key? key}) : super(key: key);

  @override
  State<IpadTab> createState() => _IpadTabState();
}

class _IpadTabState extends State<IpadTab> {

  late  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController= PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650.h,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
          children:[
            Categories(
                productName: context.localization.ipad_pro_max,
                productDescription: context.localization.ipad_pro_max_description,
                price: 820
            ),
            Categories(
                productName: context.localization.ipad_air,
                productDescription: context.localization.ipad_air_description,
              price: 599,
            ),
            Categories(
                productName: context.localization.ipad_10th_gen,
                productDescription: context.localization.ipad_10th_gen_description,
              price: 449,
            ),
            Categories(
                productName: context.localization.ipad_9th_gen,
                productDescription:context.localization.ipad_9th_gen_description,
              price: 329,
            ),
            Categories(
              productName: context.localization.ipad_mini,
              productDescription:context.localization.ipad_mini_description,
              price: 499,
            ),
          ]
      ),
    );
  }
}
