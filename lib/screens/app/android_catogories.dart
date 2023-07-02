import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/screens/app/android_tabs/phones_tab.dart';
import 'package:iconnect/screens/app/android_tabs/tablets_tab.dart';

class AndroidCategories extends StatefulWidget {
  const AndroidCategories({Key? key}) : super(key: key);

  @override
  State<AndroidCategories> createState() => _AndroidCategoriesState();
}

class _AndroidCategoriesState extends State<AndroidCategories>
    with SingleTickerProviderStateMixin{

  late TabController _tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
                SizedBox(width: 40.w,),
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhsHis2IY9sDP3_DCYt7gZXihn8P0Ukck91A&usqp=CAU',
                  width: 40.w,
                  height: 40.h,
                ),
                SizedBox(width: 10.w,),
                Text(context.localization.android,style: GoogleFonts.poppins(
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
              tabs: [
                Tab(text: context.localization.phones,),
                Tab(text: context.localization.tablets,),
              ],
          ),
          IndexedStack(
            index: _tabController.index,
            children: [
              Visibility(
                visible: _tabController.index==0,
                  child: PhonesTab(),
              ),
              Visibility(
                visible: _tabController.index==1,
                  child: TabletsTab(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
