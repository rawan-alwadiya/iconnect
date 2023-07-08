import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import 'package:iconnect/bloc/bloc/cart_bloc.dart';
import 'package:iconnect/bloc/events/cart_event.dart';
import 'package:iconnect/bloc/states/cart_state.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/models/select_item_color.dart';
import 'package:iconnect/prefs/shared_pref_controller.dart';
import 'package:iconnect/screens/app/payment_method.dart';
import 'package:iconnect/widgets/cart_total.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CartBloc>(context).add(ReadCart());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CartBloc,CartStates>(
        listenWhen: (previous,current)=>
        current is ProcessState && current.processType == ProcessType.Delete,
        listener: (context,state){
          state as ProcessState;
          context.showSnackBar(message: state.message, error: !state.status);
        },
        buildWhen: (previous,current)=>
        current is LoadingState || current is ReadState,
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator(),);
          } else if (state is ReadState && state.cart.isNotEmpty) {
            return ListView(
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(25),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Text(context.localization.shopping_cart, style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 23.sp,
                          color: Color(0xFF476269),
                        ),
                        ),
                      ),
                      Spacer(),
                      // Icon(
                      //   Icons.more_vert,
                      //   size: 30,
                      //   color: Color(0xFF476269),
                      // ),
                      badges.Badge(
                        // backgroundColor: Color(0xFFFF5959),
                        badgeStyle: badges.BadgeStyle(
                            padding: EdgeInsets.all(5),
                            badgeColor: Color(0xFFFF5959)
                        ),
                        badgeContent: Text('${state.cart.length}', style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),),
                        // child: InkWell(
                        //   onTap: (){
                        //     // Navigator.pushNamed(context, '/cart_screen');
                        //   },
                        child: Icon(
                          Icons.shopping_cart_checkout,
                          size: 30.sp,
                          color: Color(0xFF476269),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 490.h,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, ),
                      // shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: state.cart.length,
                      itemBuilder: (context, index) {
                        return Container(
                          // clipBehavior: Clip.antiAlias,
                          padding: EdgeInsets.all(10),
                          margin:SharedPrefController().getLangauge()=='en'?
                          EdgeInsets.only(left: 5.w, top: 10.h):EdgeInsets.only(right: 5.w, top: 10.h),
                          height: 170.h,
                          // color: Colors.white,
                          decoration: BoxDecoration(
                            color: Colors.white
                          ),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                // mainAxisSize: MainAxisSize.max,
                                children: [
                                  // Radio(
                                  //     value: '',
                                  //     groupValue: '',
                                  //     activeColor: Color(0xFF40A798),
                                  //     onChanged: (index){},
                                  // ),
                                  Container(
                                    height: 100.h,
                                    width: 100.w,
                                    margin: SharedPrefController().getLangauge()=='en'?
                                    EdgeInsets.only(right: 10.w): EdgeInsets.only(left: 10.w),
                                    child: Image.network(state.cart[index].productImage)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(state.cart[index].productName,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13.5.sp,
                                                color: Colors.black)),
                                        SizedBox(height: 20.h,),
                                        Text('${context.localization.price} \$${state.cart[index].productPrice
                                            .toString()}', style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                            color: Colors.black),),
                                        SizedBox(height: 10.h,),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        height: 35.h,
                                        width: 30.w,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF40A798),
                                            borderRadius: BorderRadius.circular(17),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                blurRadius: 10,
                                                spreadRadius: 1,
                                              )
                                            ]
                                        ),
                                        child:
                                        IconButton(
                                          icon: Icon(
                                            CupertinoIcons.minus,
                                            size: 12,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            BlocProvider.of<CartBloc>(context).add(UpdateQuantity(state.cart[index]));
                                            setState(() {
                                              if(state.cart[index].quantity>1){
                                              state.cart[index].quantity--;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 4.5.w,),
                                      Text('${state.cart[index].quantity}',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13.sp,
                                              color: Colors.black)),
                                      SizedBox(width: 4.5.w,),
                                      Container(
                                        padding: EdgeInsets.all(0),
                                        height: 35.h,
                                        width: 30.w,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF40A798),
                                            borderRadius: BorderRadius.circular(17),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                blurRadius: 10,
                                                spreadRadius: 1,
                                              )
                                            ]

                                        ),
                                        child:
                                        IconButton(
                                          icon: Icon(
                                            CupertinoIcons.plus,
                                            size: 12,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            BlocProvider.of<CartBloc>(context).add(UpdateQuantity(state.cart[index]));
                                            setState(() {
                                              state.cart[index].quantity++;
                                              // state.cart.length++;
                                            });
                                          },

                                        ),
                                      ),
                                    ],
                                  ),
                                      IconButton(
                                        iconSize: 28,
                                        onPressed: () {
                                          BlocProvider.of<CartBloc>(context).add(
                                              DeleteEvent(index));
                                        },
                                        icon: Icon(Icons.delete),
                                        color: Colors.red.shade800,
                                      ),
                                ],
                              ),
                              ],
                              ),
                              Container(
                                padding: SharedPrefController().getLangauge()=='en'?
                                EdgeInsets.only(left: 112.w):EdgeInsets.only(right: 112.w),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        // SizedBox(width: SharedPrefController().getLangauge()=='en'? 128.w:128.w,),
                                        Text('${context.localization.color}',style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                            color: Colors.black)),
                                        SizedBox(width: 5.w,),
                                        for(int i=0;i< ItemColor().itemColors(state.cart[index].productName).length;i++)
                                          InkWell(
                                              onTap: (){
                                                setState(() {
                                                  // _colorIndex=i;
                                                  state.cart[index].productColor=i;
                                                });

                                              },
                                              child: Container(
                                                height: 18.h,
                                                width: 16.w,
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                                decoration: BoxDecoration(
                                                    color: ItemColor().itemColors(state.cart[index].productName)[i],
                                                    borderRadius: BorderRadius.circular(15),
                                                    border: Border.all(
                                                        color: state.cart[index].productColor==i? Colors.blue.shade100: Colors.transparent,
                                                        width: state.cart[index].productColor==i? 3:0
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey.withOpacity(0.5),
                                                          spreadRadius: 2,
                                                          blurRadius: 8
                                                      )
                                                    ]
                                                ),
                                              )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${context.localization.total} ', style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Colors.black),),
                      Text('\$${CartTotal().totalPrice(state.cart)}',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Colors.black)),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 30.w,right: 30.w, bottom: 30.h),
                  child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentMethod(total: CartTotal().totalPrice(state.cart))
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Color(0xffF1F1F1)
                  ),
                  child: Text(context.localization.order_now,style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: Colors.black))
                  ),
                ),
              ],
            );
          } else
            return ListView(
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(25),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w,right: 10.w),
                        child: Text(context.localization.shopping_cart, style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Color(0xFF476269),
                        ),
                        ),
                      ),
                      Spacer(),
                      // Icon(
                      //   Icons.more_vert,
                      //   size: 30,
                      //   color: Color(0xFF476269),
                      // ),
                      badges.Badge(
                        badgeContent: Text('0', style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),),
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: Color(0xFFFF5959),
                          padding: EdgeInsets.all(5),
                        ),
                        // child: InkWell(
                        //   onTap: (){
                        //     // Navigator.pushNamed(context, '/cart_screen');
                        //   },
                        child: Icon(
                          Icons.shopping_cart_checkout,
                          size: 30.sp,
                          color: Color(0xFF476269),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 250.h,horizontal: 20.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(context.localization.enjoy_shopping,textAlign:TextAlign.center,style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color(0xFF476269),
                  ),),
                  SizedBox(height: 20.h,),
                  Text(context.localization.add_items,textAlign:TextAlign.center,style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color(0xFF476269),
                  ),)
                  ],
                  ),
                )
              ],

            );
        }
      ),

    );

  }

}
