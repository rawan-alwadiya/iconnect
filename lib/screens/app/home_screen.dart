
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/models/all_best_selling.dart';
import 'package:iconnect/widgets/best_selling.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _searchController;
  // List<BestSelling> bestSelling= AllBestSelling.allBestSelling;
  // List<String> languages = ['En','Ar'];
  // String? selectedLanguage ='En';
  List<BestSelling> suggestions = <BestSelling>[];
  List<BestSelling> allBestSelling = AllBestSelling.allBestSelling;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController=TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispos
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // leading: IconButton(
      //   //   icon: Icon(Icons.sort, size: 30,),
      //   //   onPressed: (){
      //   //     scaffoldKey.currentState?.openDrawer();
      //   //   },
      //   //   color: Color(0xFF476269),
      //   // ),
      //   leadingWidth: 80,
      //   centerTitle: false,
      //   title: Text('iConnect', style: GoogleFonts.pacifico(
      //     fontSize: 35.sp,
      //     fontWeight: FontWeight.bold,
      //     color: Color(0xFF40A798),
      //   ),
      //   ),
      // ),

      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.sort, size: 30,),
      //     onPressed: ()=>Scaffold.of(context).openDrawer(),
      //     color: Color(0xFF476269),
      //   ),
      // drawer: Drawer(
      //   backgroundColor: Color(0xFF476269),
      //   child: ListView(
      //     children: [
      //       ListTile(
      //         onTap: (){},
      //         leading: SizedBox(
      //           height: 34.h,
      //           width: 34.h,
      //           child: Icon(Icons.person_outline, color: Colors.white70,),
      //         ),
      //         title: Text('My Profile',style: GoogleFonts.poppins(color: Colors.white70)),
      //       ),
      //       SizedBox(height: 50.h,),
      //       ListTile(
      //         onTap: (){},
      //         leading: SizedBox(
      //           height: 34.h,
      //           width: 34.h,
      //           child: Icon(Icons.shopping_bag_outlined,color: Colors.white70,),
      //         ),
      //         title: Text('My Orders',style: GoogleFonts.poppins(color: Colors.white70)),
      //       ),
      //       SizedBox(height: 50.h,),
      //       ListTile(
      //         onTap: (){},
      //         leading: SizedBox(
      //           height: 34.h,
      //           width: 34.h,
      //           child: Icon(Icons.add_shopping_cart_outlined,color: Colors.white70,),
      //         ),
      //         title: Text('Categories',style: GoogleFonts.poppins(color: Colors.white70)),
      //       ),
      //       SizedBox(height: 50.h,),
      //       ListTile(
      //         onTap: (){},
      //         leading: SizedBox(
      //           height: 34.h,
      //           width: 34.h,
      //           child: Icon(Icons.language_outlined,color: Colors.white70,),
      //         ),
      //         title: Text('Change Language',style: GoogleFonts.poppins(color: Colors.white70),),
      //       ),
      //       SizedBox(height: 50.h,),
      //       ListTile(
      //         onTap: (){},
      //         leading: SizedBox(
      //           height: 34.h,
      //           width: 34.h,
      //           child: Icon(Icons.info_outline,color: Colors.white70,),
      //         ),
      //         title: Text('About Us',style: GoogleFonts.poppins(color: Colors.white70)),
      //       ),
      //     ],
      //   ),
      // ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 25,left: 25,bottom: 10),
            child: Row(
              children: [
                // IconButton(
                //   icon: Icon(Icons.sort, size: 30,),
                //   onPressed: (){},
                //   color: Color(0xFF476269),
                // ),
                SizedBox(width: 20.w),
                Text(context.localization.iconnect, style: GoogleFonts.pacifico(
                  fontSize: 38.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF40A798),
                ),
                ),
                Spacer(),

                IconButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  },
                  icon: Icon(
                    Icons.logout_outlined,
                    color: Colors.grey.shade500,
                    size: 22.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 650.h,
            child: ListView(
              padding: EdgeInsets.only(bottom: 25.h),
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 15.h),
                  child: TextFormField(
                    controller: _searchController,
                    textInputAction: TextInputAction.search,
                    cursorColor: Color(0xFF40A798),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 10.h,left: 10.w),
                      hintText: context.localization.search,
                      prefixIcon: Icon(Icons.search,
                        // color: Color(0xFF40A798),
                        color: Colors.grey.shade400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xFF40A798),
                          width: 1,
                        ),
                      ),
                      focusColor: Color(0xFF40A798),
                      hintStyle: GoogleFonts.poppins(
                        // color: Color(0xFF40A798),
                        color: Colors.grey.shade400
                      ),
                      constraints: BoxConstraints(
                        maxHeight: 45.h
                      ),
                    ),
                    onChanged: (String value){
                      setState(() {
                        searchBestSelling(value);
                      });
                    },
                  ),
                ),
            SizedBox(height: 20.h,),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w,right: 10.w),
                child: Text(context.localization.categories,style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                  color: Color(0xFF476269),
                ),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/ios');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTatDv8e215-obuKbvELF20snt0K_6Tgc_jVQ&usqp=CAU',
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpYDoi7NwLjFgUuCTabNT6qsEpxXK-T5hefA&usqp=CAU',
                            // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOAiroRXpeflTb7d6JvEVG4gEHXSr6DhoyIA&usqp=CAU',
                            // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZAm5iUbmMAA8_fSOnxG5e8YgI53nsw0U2JQ&usqp=CAU',
                            width: 40.w,
                            height: 40.h,
                          ),
                          Text(context.localization.ios,style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF476269),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, '/android_categories');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhsHis2IY9sDP3_DCYt7gZXihn8P0Ukck91A&usqp=CAU',
                            width: 40.w,
                            height: 40.h,
                          ),
                          Text(context.localization.android ,style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF476269),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, '/hp_categories');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTSO46VwQjJRAoz2L3Im6zLBg-TXY9kBhKXQ&usqp=CAU',
                            width: 40.w,
                            height: 40.h,
                          ),
                          Text(context.localization.hp,style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF476269),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, '/accessories_categories');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcrS32-F2NsZdz2MyMuExaZ_Oy-KwSKKr7MQ&usqp=CAU',
                            width: 40.w,
                            height: 40.h,
                          ),
                          Text(context.localization.accessories,style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF476269),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w,right: 10.w),
                child: Text(context.localization.best_selling,style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                    color: Color(0xFF476269)
                ),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            GridView.builder(
              itemCount: _searchController.text.isEmpty? AllBestSelling.allBestSelling.length: suggestions.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.63,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.h,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                // final allBestSelling = bestSelling[index];
                // List<BestSelling> suggestions = <BestSelling>[];
                allBestSelling = <BestSelling>[
                  BestSelling(
                    imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXKDLVMMktEFOQJOsZW8Pvadmm50prYuBpYQ&usqp=CAU',
                    productTitle: context.localization.hp_intel_core_i7,
                    productDescription: context.localization.hp_intel_core_i7_description,
                    productPrice: 750,
                  ),
                  BestSelling(
                    imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVSBdUfsI7ye8uo7Ufa3e5fuZU9rsOocPBdQ&usqp=CAU',
                    productTitle: context.localization.ipad_pro_max,
                    productDescription: context.localization.ipad_pro_max_description,
                    productPrice: 820,
                  ),
                  BestSelling(
                    imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQktypcQ9_IaB12MOUbuaus--l9kZ5uCo0BuQ&usqp=CAU',
                    productTitle: context.localization.apple_watch_se,
                    productDescription: context.localization.apple_watch_se_description,
                    productPrice: 249,
                  ),
                  BestSelling(
                    imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIC1TlSI8D60e8WkRiFgZMy1TLABe2Ngmzhg&usqp=CAU',
                    productTitle: context.localization.samsung_s22_ultra,
                    productDescription: context.localization.samsung_s22_ultra_description,
                    productPrice: 950,
                  ),
                  BestSelling(
                    imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHhzVe5WSFoBLCJGjyrm4YDtTb-X-TENhVrw&usqp=CAU',
                    productTitle: context.localization.iphone_13_pro,
                    productDescription: context.localization.iphone_13_pro_description,
                    productPrice: 590,
                  ),
                  BestSelling(
                    imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0ursOXxY9xSVekpasc9iBNyGJZ_xT9zpqvQ&usqp=CAU',
                    productTitle: context.localization.hp_omen,
                    productDescription: context.localization.hp_omen_description,
                    productPrice: 1550,
                  ),
                  BestSelling(
                    imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_BEqVwUqUY0oJbGZsX5ZYGvD8JiixVK3Bzg&usqp=CAU',
                    productTitle: context.localization.tab_s8_ultra,
                    productDescription: context.localization.tab_s8_ultra_description,
                    productPrice: 1099,
                  ),
                  BestSelling(
                    imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl9PEk7KYS34J507WFK9Dx8gj9ksSLiSUM1A&usqp=CAU',
                    productTitle: context.localization.vivo_x80_pro,
                    productDescription: context.localization.vivo_x80_pro_description,
                    productPrice: 799,
                  ),
                  BestSelling(
                    imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNPc7-3J-7YyOKzc_0bx4yNk_zJ5xR7C_Y2Q&usqp=CAU',
                    productTitle: context.localization.ipad_air,
                    productDescription: context.localization.ipad_air_description,
                    productPrice: 599,
                  ),
                  BestSelling(
                    imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7J4pJCSZMclCcFRVcVGU25awNsvPYAM1pPg&usqp=CAU',
                    productTitle: context.localization.hp_envy_13,
                    productDescription: context.localization.hp_envy_13_description,
                    productPrice: 939,
                  ),
                  BestSelling(
                    imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHscN-1ZQHwP__g20797Mng3jgF1l4uekJxw&usqp=CAU',
                    productTitle: context.localization.google_pixel_6a,
                    productDescription: context.localization.google_pixel_6a_description,
                    productPrice: 297,
                  ),
                  BestSelling(
                    imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxCpuW4SGkEsT0uo_w7i9V3XC1JpfM-nMwAQ&usqp=CAU',
                    productTitle: context.localization.mac_book_bro,
                    productDescription: context.localization.mac_book_pro_description,
                    productPrice: 2499,
                  ),
                  BestSelling(
                    imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC-l8oPwveZdbBnCqEvaQrFoc-fHNmFXbKKQ&usqp=CAU',
                    productTitle: context.localization.airpods_pro,
                    productDescription: context.localization.airpods_pro_description,
                    productPrice: 249,
                  ),
                  BestSelling(
                    imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgiM3gh5TvyQL5MoCNLBWHyE6HTpFZ5YXIXQ&usqp=CAU',
                    productTitle: context.localization.hp_chromebook,
                    productDescription: context.localization.hp_chromebook_description,
                    productPrice: 659,
                  ),
                ];
                return BestSelling(
                    imageProduct: _searchController.text.isEmpty? allBestSelling[index].imageProduct : searchBestSelling(_searchController.text)[index].imageProduct,
                    productTitle: _searchController.text.isEmpty? allBestSelling[index].productTitle : searchBestSelling(_searchController.text)[index].productTitle,
                    productDescription: _searchController.text.isEmpty? allBestSelling[index].productDescription : searchBestSelling(_searchController.text)[index].productDescription,
                    productPrice: _searchController.text.isEmpty? allBestSelling[index].productPrice : searchBestSelling(_searchController.text)[index].productPrice,
                );
              },
            ),
        ],
      ),
          ),
        ],
      ),
          );
    //     ],
    //   ),
    // );
  }
  List<BestSelling> searchBestSelling(String title){
    if(title !=null) {
      suggestions = allBestSelling.where((element) {
        final bestSellingProductTitle = element.productTitle.toLowerCase();
        final input = title.toLowerCase();

        return bestSellingProductTitle.contains(input);
      }).toList();

      // allBestSelling = suggestions;
      return suggestions;
    }else{
      return allBestSelling;
    }
  }
}


