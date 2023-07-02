import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/bloc/bloc/cart_bloc.dart';
import 'package:iconnect/bloc/bloc/favorites_bloc.dart';
import 'package:iconnect/bloc/events/cart_event.dart';
import 'package:iconnect/bloc/events/favorites_event.dart';
import 'package:iconnect/models/cart.dart';
import 'package:iconnect/models/favorite.dart';
import 'package:iconnect/prefs/shared_pref_controller.dart';

class BestSelling extends StatefulWidget {
  const BestSelling({
    Key? key,
    required this.imageProduct,
    required this.productTitle,
    required this.productDescription,
    required this.productPrice
  }) : super(key: key);

  final String imageProduct;
  final String productTitle;
  final String productDescription;
  final int productPrice;

  @override
  State<BestSelling> createState() => _BestSellingState();
}

class _BestSellingState extends State<BestSelling> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xFF8C999A),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '-30%',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Icon(Icons.favorite_border, color: Colors.red,),
              FavoriteButton(
                iconSize: 32,
                valueChanged: (_) {
                  _addToFavorites();
                },
              ),
            ],
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.only(left: 10.w,right: 10.w,top: 10.h,bottom: 7.h),
              child: Image.network(
                widget.imageProduct,
                height: 120.h,
                width: 120.w,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: SharedPrefController().getLangauge()=='en'?
            CrossAxisAlignment.start: CrossAxisAlignment.end,
            children: [
              Text(widget.productTitle,style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: Colors.black,
              ),
              ),
            ],
          ),
          SizedBox(height: 4.h,),
          Align(
            alignment:SharedPrefController().getLangauge()=='en'?
            Alignment.centerLeft: Alignment.centerRight,
            child: Text(
              widget.productDescription,
              style: GoogleFonts.poppins(
                fontSize: 11.sp,
                color: Color(0xFF476269),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${widget.productPrice.toString()}',style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF476269),
                ),
                ),
                 InkWell(
                   onTap: (){
                    _save();
                   },
                   child: Icon(
                     Icons.shopping_cart_checkout,
                     color: Color(0xFF476269),
                   ),
                 ),
              ],
            ),
          ),
        ],
      ),
    );
  }

Cart get cart{
 Cart cart = Cart();
 cart.productImage = widget.imageProduct;
 cart.productName = widget.productTitle;
 cart.productDescription = widget.productDescription;
 cart.productPrice= widget.productPrice;
 cart.userId= SharedPrefController().getValueFor<int>(key: PrefKeys.id.name)!;
 return cart;

}

Favorite get favorite{
    Favorite favorite = Favorite();
    favorite.productImage=widget.imageProduct;
    favorite.productName=widget.productTitle;
    favorite.productDescription=widget.productDescription;
    favorite.productPrice=widget.productPrice;
    favorite.userId=SharedPrefController().getValueFor<int>(key: PrefKeys.id.name)!;
    return favorite;
}

void _save(){
    BlocProvider.of<CartBloc>(context).add(ChooseCartItems(cart));
}
void _addToFavorites(){
    BlocProvider.of<FavoritesBloc>(context).add(ChooseFavoriteItems(favorite));
}

}
