import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritePageIndicator extends StatelessWidget {
  const FavoritePageIndicator({
    Key? key,
    required bool currentPage,
    required double marginEnd,
  }) :_currentPage=currentPage, _marginEnd=marginEnd, super(key: key);

  final bool _currentPage;
  final double _marginEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18.w,
      height: 4.h,
      margin: EdgeInsetsDirectional.only(end: _marginEnd),
      decoration: BoxDecoration(
        color: _currentPage? Color(0xFFF05454):Color(0xFF8C999A),
        borderRadius: BorderRadius.circular(2)
      ),
    );
  }
}
