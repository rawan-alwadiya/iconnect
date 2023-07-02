import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OutBoardingContent extends StatelessWidget {
  const OutBoardingContent({
    Key? key,
    required this.imageName,
    required this.title,
    required this.subTitle,


  }) : super(key: key);

  final String imageName;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Image.network(imageName,height:420,width: 400,fit: BoxFit.fill,),
          Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 24,fontWeight: FontWeight.w600)),
          SizedBox(height: 20.h,),

          Text(subTitle,textAlign: TextAlign.center,style: GoogleFonts.poppins(fontSize: 20),),
        ],
      ),
    );
  }
}