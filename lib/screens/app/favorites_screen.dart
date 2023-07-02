import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/bloc/bloc/cart_bloc.dart';
import 'package:iconnect/bloc/bloc/favorites_bloc.dart';
import 'package:iconnect/bloc/events/cart_event.dart';
import 'package:iconnect/bloc/events/favorites_event.dart';
import 'package:iconnect/bloc/states/favorites_state.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/models/cart.dart';
import 'package:iconnect/models/favorite.dart';
import 'package:iconnect/models/select_item_color.dart';
import 'package:iconnect/prefs/shared_pref_controller.dart';
import 'package:iconnect/widgets/favorite_custom_page_indicator.dart';
import 'package:iconnect/widgets/favorites_content.dart';
import 'package:path/path.dart' as path;

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}
class _FavoritesScreenState extends State<FavoritesScreen> {
  int _pageIndex=0;
  late String _title;
  // int _colorIndex=0;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController= PageController();
    BlocProvider.of<FavoritesBloc>(context).add(ReadFavorites());
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
      body: BlocConsumer<FavoritesBloc,FavoriteStates>(
        listenWhen: (previous,current)=>
        current is ProcessState && current.processType ==ProcessType.delete,
        listener: (context,state){
          state as ProcessState;
          context.showSnackBar(message: state.message, error: !state.status);
        },
        buildWhen: (previous,current)=>
        current is FavoriteLoadingState || current is ReadState,
        builder: (context,state){
          if(state is FavoriteLoadingState){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is ReadState && state.favorites.isNotEmpty){
           return ListView(
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(25),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text(context.localization.favorites,style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 23.sp,
                          color: Color(0xFF476269),
                        ),),
                      ),
                      Spacer(),
                      Icon(Icons.favorite, size: 30,color: Colors.red,),
                    ],
                  ),
                ),
                SizedBox(
                  height: 610.h,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                      // shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: state.favorites.length,
                      itemBuilder: (context, index){
                      return
                        Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 15.w,bottom: 10.h,right: 15.w),
                        height: 600.h,
                        // width: 350.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: PageView(
                                controller: _pageController,
                                physics: const BouncingScrollPhysics(),
                                onPageChanged: (int pageIndex){
                                  setState(() {
                                    _pageIndex= pageIndex;
                                  });
                                },
                                scrollDirection: Axis.horizontal,
                                children: [
                                  for(int i=0;i<ItemColor().itemImages(state.favorites[index].productName).length;i++)
                                    FavoritesContent(image: ItemColor().itemImages(state.favorites[index].productName)[i])
                                ],
                              ),
                            ),
                            // Container(
                            //   height: 230.h,
                            //   width: double.infinity,
                            //   child: Image.network(state.favorites[index].productImage),
                            // ),
                            SizedBox(height: 30.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for(int i=0;i<ItemColor().itemImages(state.favorites[index].productName).length;i++)
                                  FavoritePageIndicator(
                                      currentPage: _pageIndex==i,
                                      marginEnd: i<ItemColor().itemImages(state.favorites[index].productName).length-1? 14:0)
                              ],
                            ),
                            SizedBox(height: 10.h,),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //     IconButton(
                            //         onPressed: (){
                            //           if(_pageIndex!=0){
                            //             _pageController.previousPage(
                            //                 duration: const Duration(seconds: 1), curve: Curves.easeInOutBack);
                            //           }
                            //         },
                            //         icon: const Icon(Icons.arrow_back_ios)
                            //     ),
                            //     IconButton(
                            //         onPressed: (){
                            //           if(_pageIndex!= ItemColor().itemImages(state.favorites[index].productName).length-1){
                            //             _pageController.nextPage(
                            //                 duration: Duration(seconds: 1), curve: Curves.easeInOutBack);
                            //           }
                            //         },
                            //         icon: const Icon(Icons.arrow_forward_ios))
                            //   ],
                            // ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Text(
                                  state.favorites[index].productName,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.5.sp,
                                      color: Colors.black
                                )),
                                Spacer(),
                                FavoriteButton(
                                  iconSize: 32,
                                  isFavorite: true,
                                  valueChanged: (_) {
                                    BlocProvider.of<FavoritesBloc>(context).add(DeleteFavoriteEvent(index));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h,),
                            Align(
                              alignment: SharedPrefController().getLangauge()=='en'? Alignment.bottomLeft:Alignment.centerRight,
                              child: Text(state.favorites[index].productDescription,
                                  style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17.sp,
                                  color: Colors.black
                              )),
                            ),
                            SizedBox(height: 10.h,),
                            Row(
                              children: [
                                Text(context.localization.color,style: GoogleFonts.poppins(
                                     fontWeight: FontWeight.w600,
                                     fontSize: 17.sp,
                                     color: Colors.black)),
                                SizedBox(width: 10.w),
                                for(int i=0; i<ItemColor().itemColors(state.favorites[index].productName).length;i++)
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      state.favorites[index].productColor=i;
                                    });
                                  },
                                  child: Container(
                                    height: 22.h,
                                    width: 20.w,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(horizontal: 5.w),

                                    decoration: BoxDecoration(
                                      color: ItemColor().itemColors(state.favorites[index].productName)[i],
                                      borderRadius: BorderRadius.circular(15),
                                      // shape: BoxShape.circle,
                                        border: Border.all(
                                          color:state.favorites[index].productColor==i? Colors.blue.shade100: Colors.transparent,
                                          width:state.favorites[index].productColor==i? 3:0,
                                        ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 8,
                                        ),
                                      ]
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                            Text('${context.localization.price} \$${state.favorites[index].productPrice}',
                                style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 17.sp,
                                color: Colors.black
                            )),
                                Spacer(),
                                ElevatedButton(
                                    onPressed: (){
                                      BlocProvider.of<CartBloc>(context).add(ChooseCartItems(_addToCart(state.favorites[index])));
                                      },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      minimumSize: Size(200, 40),
                                      backgroundColor: Color(0xffF1F1F1),
                                    ),
                                    child:Text(
                                        context.localization.add_to_cart_button,style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                        fontSize: 20.sp,
                                        color: Colors.black)
                                    )),
                                ],
                            ),
                          ],
                        ),
                      );
                      }),
                )
              ],
            );
          }else
            return ListView(
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(25),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w,right: 10.w),
                        child: Text(context.localization.favorites,style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 23.sp,
                          color: Color(0xFF476269),
                        ),),
                      ),
                      Spacer(),
                      Icon(Icons.favorite, size: 26,color: Colors.red,),
                    ],
                  ),
                ),
                Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 260.h,horizontal: 20.w
                ),
                  child: Center(child: Text(context.localization.no_favorites,style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF476269),
                  ))),
             ),

              ],
            );
        },
      )
    );
  }

  Cart _addToCart(Favorite favorite){
    List<String> images = ItemColor().itemImages(favorite.productName);
    Cart cart = Cart();
    cart.productName= favorite.productName;
    cart.productImage = images[0];
    cart.productDescription= favorite.productDescription;
    cart.quantity=1;
    cart.productColor = favorite.productColor;
    cart.productPrice = favorite.productPrice;
    cart.userId = SharedPrefController().getValueFor<int>(key: PrefKeys.id.name)!;
    return cart;
  }
}


