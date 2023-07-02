import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FavoritesContent extends StatelessWidget {
   FavoritesContent({
    required this.image,
    Key? key}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
          child: Image.network(
            '$image',
            height: 320.h,
            width: 400.w,
            fit: BoxFit.fill,
          ),

    );

  }

}
