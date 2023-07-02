import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/extensions/context_extension.dart';
class OrderCompleter extends StatelessWidget {
  const OrderCompleter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.h,left: 20.w,right: 20.w),
              child: Row(
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
                      },
                      icon: Icon(Icons.arrow_back_ios),),
                  SizedBox(width: 20.w,),
                  Text(context.localization.order_completed,style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                    color: Color(0xFF476269),
                  ))
                ],
              ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 170.h,bottom: 170.h),
            child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwOps1fIz-O7IzOj3UirPKbayJ3nOAmrqsSA&usqp=CAU',
            height: 300.h,
            width: 320.w,
            fit: BoxFit.fill,),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10,left: 35.w,right: 35.w),
            child: ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Color(0xFF40A798),
                ),
                child: Text(context.localization.done,style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    color: Colors.white))),
          )
        ],
      ),
    );
  }
}
