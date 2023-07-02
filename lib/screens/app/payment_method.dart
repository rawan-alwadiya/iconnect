
import 'dart:math';

import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/models/payment_type.dart';
import 'package:iconnect/widgets/cart_total.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key,this.total}) : super(key: key);
  final int? total;

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {

  CardType _cardType= CardType.masterCard;
  String _cardNumber='5445 5645 5455 7755';
  String _cardExpiryDate='10/28';
  String _cardHolder='CARD HOLDER';
  String _cvv='456';
  bool _showBack=false;
  bool _cardNumberError=false;

  late FocusNode _focusNode;
  TextEditingController _cardNumberController=TextEditingController();
  TextEditingController _expiryDateController=TextEditingController();
  TextEditingController _cardHolderController=TextEditingController();
  TextEditingController _shippingAdress = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      _focusNode.hasFocus? _showBack=true : _showBack= false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(top: 50.h,left: 5.w,right: 5.w,bottom: 10.h),
        children: [
          Row(
            children: [
              IconButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
                },
                  icon: Icon(Icons.arrow_back_ios),),
              SizedBox(width: 20.w,),
              Text(context.localization.payment_details,style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
                color: Color(0xFF476269),
              ),),
            ],
          ),
          SizedBox(height: 10.h,),
          SizedBox(
            height: 575.h,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only( left: 25,bottom: 15),
                    child: Text(context.localization.how_pay,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Colors.grey.shade500,
                    ),),
                  ),
                  CreditCard(
                      frontBackground: CardBackgrounds.black,
                      backBackground: CardBackgrounds.white,
                    cardNumber: _cardNumber,
                    cardExpiry: _cardExpiryDate,
                    cardHolderName: _cardHolder,
                    cvv: _cvv,
                    bankName: 'Axis Bank',
                    cardType: _cardType,
                    showBackSide: _showBack,
                    showShadow: true,
                      textExpDate: 'Exp. Date',
                      textName: 'Name',
                      textExpiry: 'MM/YY'
                  ),
                  SizedBox(height: 20.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 10,right: 25,bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(context.localization.choose_payment,style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.black,
                        )),
                        SizedBox(height: 18.h,),
                        Row(
                          children: [
                            for(int i=0; i<6;i++)
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                     _cardType= PaymentType().chooseCardType(i);
                                    });
                                  },
                                    child: Image.asset(PaymentType().creditCardTypes[i])),
                                SizedBox(width:i!=5? 8.w: 0,),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 18.h,),
                        TextFormField(
                          controller: _cardNumberController,
                          decoration: InputDecoration(
                            hintText: context.localization.card_number,
                            // border: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //   )
                            // ),
                          ),

                          maxLength: 16,
                          onChanged: (value){
                            final newCardNumber=value.trim();
                            var str ='';
                            str =newCardNumber.substring(0,4)+' '+newCardNumber.substring(4,8)+' '+newCardNumber.substring(8,12)+' '+newCardNumber.substring(12,newCardNumber.length);
                            setState(() {
                              _cardNumber=str;
                            });
                          },
                          validator: (text){
                            if(text == null){_cardNumberError = true;}
                          },
                        ),
                        // SizedBox(height: 10.h,),
                        TextFormField(
                          controller: _expiryDateController,
                          decoration: InputDecoration(
                            hintText: context.localization.card_expiry
                          ),
                          maxLength: 4,
                          onChanged: (value){
                            final newExpiryDate= value.trim();
                            var date='';
                            date = newExpiryDate.substring(0,2)+'/'+newExpiryDate.substring(2,4);
                            setState(() {
                              _cardExpiryDate=date;
                            });
                          },
                        ),
                        TextFormField(
                          controller: _cardHolderController,
                          decoration: InputDecoration(
                            hintText: context.localization.card_holder_name
                          ),
                          onChanged: (value){
                            setState(() {
                              _cardHolder=value;
                            });
                          },
                        ),
                        SizedBox(height: 15.h,),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'CVV'
                          ),
                          maxLength: 3,
                          onChanged: (value){
                            setState(() {
                              _cvv=value;
                            });
                          },
                          focusNode: _focusNode,
                        ),
                        SizedBox(height: 20.h,),
                        Text(' ${context.localization.shipping_address}',style: GoogleFonts.poppins(
                          fontWeight:FontWeight.w500,
                          fontSize: 14.sp,
                          color: Colors.black,
                        )),
                        SizedBox(height: 15.h,),
                        TextFormField(
                          controller: _shippingAdress,
                          decoration: InputDecoration(
                            hintText: context.localization.street,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.grey.shade400
                              )
                            )
                          ),
                          minLines: 3,
                          maxLines: 3,
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.only(left: 32.w,right: 32.w,bottom: 15.h,top: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.localization.total, style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: Colors.black),),
                Text('\$${widget.total}',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: Colors.black),)
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 10,left: 20.w,right: 20.w),
            child: ElevatedButton(
              onPressed: (){
                // Navigator.pushReplacementNamed(context, '/order_completed');
                _performPayment();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Color(0xFF40A798),
              ),
              child: Text(context.localization.pay_now,style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  void _performPayment(){
    if(_cardNumberController.text.isNotEmpty &&
        _expiryDateController.text.isNotEmpty &&
        _cardHolderController.text.isNotEmpty &&
         _shippingAdress.text.isNotEmpty){
      Navigator.pushReplacementNamed(context, '/order_completed');
      context.showSnackBar(message: context.localization.order_completed_successfully);
    }else {
      context.showSnackBar(
          message: context.localization.please_enter_data, error: true);
    }
  }
}
