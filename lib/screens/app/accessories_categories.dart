import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/prefs/shared_pref_controller.dart';
import 'package:iconnect/widgets/categories.dart';

class AccessoriesCategories extends StatefulWidget {
  const AccessoriesCategories({Key? key}) : super(key: key);

  @override
  State<AccessoriesCategories> createState() => _AccessoriesCategoriesState();
}

class _AccessoriesCategoriesState extends State<AccessoriesCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  ListView(
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
                  SizedBox(width:SharedPrefController().getLangauge()=='en'? 20.w: 40.w,),
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcrS32-F2NsZdz2MyMuExaZ_Oy-KwSKKr7MQ&usqp=CAU',
                    width: 40.w,
                    height: 40.h,
                  ),
                  SizedBox(width: 10.w,),
                  Text(context.localization.accessories,style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.sp,
                    color: Color(0xFF476269),
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
                        productName: context.localization.airpods_pro,
                        productDescription: context.localization.airpods_pro_description,
                        price: 249,
                    ),
                    Categories(
                      productName: context.localization.kef_q950,
                      productDescription: context.localization.kef_q950_description,
                      price: 979,
                    ),
                    Categories(
                      productName: context.localization.bowers_wilkins,
                      productDescription: context.localization.bowers_wilkins_description,
                      price: 399,
                    ),
                    Categories(
                      productName: context.localization.usb_led_lights,
                      productDescription: context.localization.usb_led_lights,
                      price: 20,
                    ),
                  ],
                ),
            ),
          ],
        )
    );
  }
}
