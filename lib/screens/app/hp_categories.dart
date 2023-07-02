import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/prefs/shared_pref_controller.dart';
import 'package:iconnect/widgets/categories.dart';

class HpCategories extends StatefulWidget {
  const HpCategories({Key? key}) : super(key: key);

  @override
  State<HpCategories> createState() => _HpCategoriesState();
}

class _HpCategoriesState extends State<HpCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            // padding: EdgeInsets.all(25),
            padding: EdgeInsets.only(top: 25.h,bottom: 20.h, left: 25.w,right: 25.w),
            child: Row(
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
                    },
                    icon: Icon(Icons.arrow_back_ios,color: Color(0xFF476269))),
                SizedBox(width:SharedPrefController().getLangauge()=='en'? 70.w:50.w,),
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTSO46VwQjJRAoz2L3Im6zLBg-TXY9kBhKXQ&usqp=CAU',
                  width: 40.w,
                  height: 40.h,
                ),
                SizedBox(width: 10.w,),
                Text(context.localization.hp,style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.sp,
                  color: Color(0xFF476269),
                  // color:Colors.grey.shade800,
                  // Color(0xFF476269),
                )),
              ],
            ),
          ),
          SizedBox(
            height: 700.h,
            child: ListView(
              padding: EdgeInsets.only(top: 55.h,bottom: 25.h),
              children: [
                Categories(
                    productName: context.localization.hp_intel_core_i9,
                    productDescription: context.localization.hp_intel_core_i9_description,
                    price: 950
                ),
                Categories(
                    productName: context.localization.hp_intel_core_i7,
                    productDescription: context.localization.hp_intel_core_i7_description,
                    price: 750
                ),
                Categories(
                    productName: context.localization.hp_omen,
                    productDescription: context.localization.hp_omen_description,
                    price: 15550
                ),
                Categories(
                    productName: context.localization.hp_envy_13,
                    productDescription: context.localization.hp_envy_13_description,
                    price: 939
                ),
                Categories(
                    productName: context.localization.hp_chromebook,
                    productDescription: context.localization.hp_chromebook_description,
                    price: 659
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
