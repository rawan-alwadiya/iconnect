import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/cubit/language_cubic.dart';
import 'package:iconnect/database/user_db_controller.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/models/process_response.dart';
import 'package:iconnect/prefs/shared_pref_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController _mobileController;
  late TextEditingController _passwordController;
  String _language= SharedPrefController().getLangauge();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text(context.localization.login),
        actions: [
          IconButton(
              onPressed: (){
                _showLanguageBottomSheet();
              },
              icon: Icon(
                Icons.language,
                color: Colors.grey.shade500,
              ),
          ),
          SizedBox(width: 10.w,),
        ],
      ),

         body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3o7riEe2tb5BJNQVxV66LsBoptxh8qIOc9g&usqp=CAU",
                        height: 280.h,
                        width: 340.w,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 20.h,),
                      Text(context.localization.login_title, style: GoogleFonts.poppins(
                          fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                      SizedBox(height: 15.h,),
                      Text(
                        context.localization.login_subtitle,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 11.h,),
                      TextField(
                        controller: _mobileController,
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          hintText: context.localization.mobile,
                          prefixIcon: Icon(Icons.phone_android_outlined),
                          enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                          decoration: InputDecoration(
                          hintText: context.localization.password,
                          prefixIcon: Icon(Icons.lock_clock_outlined),
                          enabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.grey,
                              ),
                          ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.blue,
                              ),
                          ),
                      ),
                      ),
                      // SizedBox(height: 5,),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, '/forget_password_screen');
                            },
                            child: Text('   ${context.localization.forget_password}',
                              style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                // color: Color(0xFF476269),
                                color: Colors.grey,
                              ),
                            ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: (){
                            _performLogin();
                            // Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
                          },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF476269),
                            // backgroundColor: Color(0xff40A798),
                          minimumSize: Size(double.infinity, 50.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                          child: Text(
                            context.localization.sign_in,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 17
                            ),
                          ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center ,
                        children: [
                          Text(context.localization.no_account, style: GoogleFonts.poppins(
                            fontSize: 16,
                          ),),
                          TextButton(
                            onPressed: (){
                              Navigator.pushReplacementNamed(context, '/register_screen');
                            },
                            child: Text(
                              context.localization.create_now,
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight:FontWeight.w600,
                                color: Color(0xFF476269),
                                // color: Color(0xff40A798)
                              ),),
                          ),

                        ],
                      ),
                    ],
                  ),
         ),
                );
  }

  void _showLanguageBottomSheet() async{
    String? langCode= await showModalBottomSheet(
        context: context,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
        ),
        builder: (context){
          return BottomSheet(
              onClosing: (){},
              builder: (context){
                return Padding(
                    padding:EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.localization.change_language,
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                      ),),
                      SizedBox(height: 5.h,),
                      Text(
                        context.localization.select_language,
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          // height: 1,
                          color: Colors.black45,
                        ),
                      ),
                      Divider(),
                      RadioListTile(
                        contentPadding: EdgeInsets.zero,
                          title: Text('English',style: GoogleFonts.poppins(),),
                          activeColor: Color(0xFF476269),
                          // activeColor: Color(0xff40A798),
                          value: 'en',
                          groupValue: _language,
                          onChanged: (String? value){
                          if(value!= null){
                            setState(() {
                              _language = value;
                            });
                            // BlocProvider.of<LangauageCubit>(context).changeLanguage(_language);
                            Navigator.pop(context,'en');
                          }
                          }
                      ),
                      RadioListTile(
                        contentPadding: EdgeInsets.zero,
                          activeColor: Color(0xFF476269),
                          // activeColor: Color(0xff40A798),
                          title: Text('العربية',style: GoogleFonts.poppins(),),
                          value: 'ar',
                          groupValue: _language,
                          onChanged: (String? value){
                          if(value!=null){
                            setState(() {
                              _language=value;

                            });
                            // BlocProvider.of<LangaugeCubit>(context).changeLanguage(_language);
                            Navigator.pop(context,'ar');
                          }
                          }
                      ),
                    ],
                  ),
                );
              },
          );
        },
    );
    if(langCode!=null){
      Future.delayed(Duration(microseconds: 500),(){
        BlocProvider.of<LangauageCubit>(context).changeLanguage(_language);
      });
    }
  }

  void _performLogin(){
    if(_checkData()){
      _login();
    }
  }

  bool _checkData() {
    if (_mobileController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      return true;
    } else{
      return false;
    }
  }

  void _login()async{
    ProcessResponse processResponse =
    await UserDbController().login(
        mobile: _mobileController.text,
        password: _passwordController.text);
    if(processResponse.success){
      Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
    }
    context.showSnackBar(
        message: processResponse.message,
        error: !processResponse.success);
  }
}
