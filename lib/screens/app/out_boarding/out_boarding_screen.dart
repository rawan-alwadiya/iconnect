import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/widgets/out_boarding_content.dart';

class OutBoarding extends StatefulWidget {
  const OutBoarding({Key? key}) : super(key: key);

  @override
  State<OutBoarding> createState() => _OutBoardingState();
}

class _OutBoardingState extends State<OutBoarding> {

  int _pageIndex=0;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Visibility(
                visible: _pageIndex!=2,
                replacement: TextButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  },
                  child: Text(context.localization.start,style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    color: Color(0xFF476269),
                  ),
                  ),
                ),
                child: TextButton(
                  onPressed: (){
                    _pageController.animateToPage(
                        2,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOutBack
                    );
                  },
                  child: Text(context.localization.skip,style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    color: Color(0xFF476269),
                  ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: BouncingScrollPhysics(),
                onPageChanged: (int pageIndex){
                  setState(() {
                    _pageIndex = pageIndex;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: [
                  OutBoardingContent(
                    imageName: 'https://img.graphicsurf.com/2019/12/online-shopping-vector-illustration2.jpg',
                    title: context.localization.easy_shopping,
                    subTitle: context.localization.easy_shopping_subtitle,
                  ),
                  OutBoardingContent(
                    imageName: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTswnIaSNi9c-qYqWY0wWeDzSua63FWSy-o3A&usqp=CAU',
                    title: context.localization.add_to_cart,
                    subTitle: context.localization.add_to_cart_subtitle,
                  ),
                  OutBoardingContent(
                    imageName: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6QdoTanlLM-Md5BjSb5MMTUurJMOcqVs0dg&usqp=CAU',
                    title: context.localization.quick_payment,
                    subTitle: context.localization.quick_payment_subtitle,
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 30.w),
              child: Visibility(
                visible: _pageIndex!=2,
                replacement: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF476269),
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/activate_screen');
                  },
                  child: Text(context.localization.get_started,style: GoogleFonts.poppins(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),),
                ),
                child:  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF476269),
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: (){
                    _pageController.animateToPage(
                      ++_pageIndex,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutBack,
                    );
                  },
                  child: Text(context.localization.next,style: GoogleFonts.poppins(
                      fontSize: 17.sp,
                    fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelectorIndicator(
                    backgroundColor:_pageIndex ==0 ? Color(0xFF476269) : Colors.grey,
                    borderColor: _pageIndex == 0? Colors.grey : Colors.transparent,
                    size: 10,
                ),
                TabPageSelectorIndicator(
                  backgroundColor:_pageIndex ==1 ? Color(0xFF476269) : Colors.grey,
                  borderColor: _pageIndex == 1? Colors.grey : Colors.transparent,
                  size: 10,
                ),
                TabPageSelectorIndicator(
                  backgroundColor:_pageIndex ==2 ? Color(0xFF476269) : Colors.grey,
                  borderColor: _pageIndex == 2? Colors.grey : Colors.transparent,
                  size: 10,
                ),
              ],
            ),
            SizedBox(height: 30,),

            
          ],
        ),
      ),
      );

  }
}


