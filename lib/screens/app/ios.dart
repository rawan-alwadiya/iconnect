import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/screens/app/ios_tabs/apple_watch_tab.dart';
import 'package:iconnect/screens/app/ios_tabs/ipad_tab.dart';
import 'package:iconnect/screens/app/ios_tabs/iphone_tab.dart';
import 'package:iconnect/screens/app/ios_tabs/mac_tab.dart';

class Ios extends StatefulWidget {
  const Ios({Key? key}) : super(key: key);

  @override
  State<Ios> createState() => _IosState();
}

class _IosState extends State<Ios> with SingleTickerProviderStateMixin{

  late TabController _tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: (){
      //         Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
      //       },
      //       icon: Icon(Icons.arrow_back_ios)),
      //   title: Row(
      //     children: [
      //       SizedBox(width: 60.w,),
      //       Image.network(
      //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvBRrg7o2vxE_LOEwy6k05_EJPEekE1IY7yg&usqp=CAU',
      //         width: 40.w,
      //         height: 40.h,
      //       ),
      //       SizedBox(width: 10.w,),
      //       Text('IOS',style: GoogleFonts.poppins(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 28.sp,
      //       color: Color(0xFF476269),
      // )),
      //     ],
      //   ),
      // ),
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
                SizedBox(width: 70.w,),
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpYDoi7NwLjFgUuCTabNT6qsEpxXK-T5hefA&usqp=CAU',
                  width: 40.w,
                  height: 40.h,
                ),
                SizedBox(width: 10.w,),
                Text(context.localization.ios ,style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.sp,
                  color: Color(0xFF476269),
                  // color:Colors.grey.shade800,
                  // Color(0xFF476269),
                )),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
              labelColor: Colors.black,
              onTap: (int index){
              setState(() {
                _tabController.index= index;
              });
              },
              indicatorColor: Color(0xff40A798),
              // indicator: BoxDecoration(
              //   color: Color(0xff40A798)
              // ),

              tabs: [
                Tab(text: context.localization.mac,),
                Tab(text: context.localization.iphone,),
                Tab(text: context.localization.ipad,),
                Tab(text: context.localization.watch,),
              ]
          ),
          IndexedStack(
            index: _tabController.index,
            children: [
              Visibility(
                visible: _tabController.index==0,
                  child: MacTap(),
              ),
              Visibility(
                visible: _tabController.index==1,
                child: IphoneTab(),
              ),
              Visibility(
                visible: _tabController.index==2,
                child: IpadTab(),
              ),
              Visibility(
                visible: _tabController.index==3,
                child: AppleWatchTab(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
