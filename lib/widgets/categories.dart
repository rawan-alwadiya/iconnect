import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/bloc/bloc/cart_bloc.dart';
import 'package:iconnect/bloc/bloc/favorites_bloc.dart';
import 'package:iconnect/bloc/events/cart_event.dart';
import 'package:iconnect/bloc/events/favorites_event.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/models/cart.dart';
import 'package:iconnect/models/favorite.dart';
import 'package:iconnect/models/select_item_color.dart';
import 'package:iconnect/prefs/shared_pref_controller.dart';
import 'package:iconnect/widgets/favorite_custom_page_indicator.dart';
import 'package:iconnect/widgets/favorites_content.dart';

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
    required this.productName,
    required this.productDescription,
    required this.price,
  }) : super(key: key);

  final String productName;
  final String productDescription;
  final int price;


  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  late PageController _pageController;
  int _pageIndex=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController=PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 15.w,bottom: 10.h,right: 15.w),
      height: 610.h,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: BouncingScrollPhysics(),
              onPageChanged: (int pageIndex){
                setState(() {
                  _pageIndex= pageIndex;
                });
              },
              scrollDirection: Axis.horizontal,
              children: [
                for(int i=0;i< ItemColor().itemImages(widget.productName).length; i++)
                  FavoritesContent(image: ItemColor().itemImages(widget.productName)[i]),
              ],
            ),
          ),
          SizedBox(height: 30.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i=0;i< ItemColor().itemImages(widget.productName).length; i++)
                FavoritePageIndicator(
                  currentPage: _pageIndex==i,
                  marginEnd: i<ItemColor().itemImages(widget.productName).length-1? 14:0,
                ),
            ],
          ),
          SizedBox(height: 20.h,),
          Row(
            children: [
              Text(widget.productName,style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 18.5.sp,
                color: Colors.black,
              )),
              Spacer(),
              FavoriteButton(
                  iconSize: 32,
                  valueChanged: (_){
                    BlocProvider.of<FavoritesBloc>(context).add(ChooseFavoriteItems(favorite));
                  }),
            ],
          ),
          SizedBox(height: 10.h,),
          Align(
           alignment: SharedPrefController().getLangauge()=='en'?
            Alignment.centerLeft: Alignment.centerRight,
            child: Text(widget.productDescription,style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 17.sp,
              color: Colors.black,
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
              for(int i=0;i< ItemColor().itemColors(widget.productName).length; i++)
                Container(
                  height: 22.h,
                  width: 20.w,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: ItemColor().itemColors(widget.productName)[i],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 8,
                        ),
                      ]
                  ),
                ),
            ],
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${context.localization.price} \$${widget.price}',style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                  color: Colors.black
              )),
              Spacer(),
              ElevatedButton(
                onPressed: (){
                  BlocProvider.of<CartBloc>(context).add(ChooseCartItems(cart));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(220, 45),
                  backgroundColor: Color(0xff40A798),
                ),
                child: Text(context.localization.add_to_cart_button,style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Cart get cart{
    Cart cart = Cart();
    List<String> images = ItemColor().itemImages(widget.productName);
    cart.productImage=images[0];
    cart.productName = widget.productName;
    cart.productDescription= widget.productDescription;
    cart.productPrice=widget.price;
    cart.quantity=1;
    cart.userId = SharedPrefController().getValueFor(key: PrefKeys.id.name)!;
    return cart;
  }

  Favorite get favorite{
    Favorite favorite = Favorite();
    List<String> images = ItemColor().itemImages(widget.productName);
    favorite.productImage= images[0];
    favorite.productName= widget.productName;
    favorite.productDescription=widget.productDescription;
    favorite.productPrice=widget.price;
    favorite.userId= SharedPrefController().getValueFor(key: PrefKeys.id.name)!;
    return favorite;
  }
}
