import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/database/user_db_controller.dart';
import 'package:iconnect/extensions/context_extension.dart';
import 'package:iconnect/models/process_response.dart';
import 'package:iconnect/models/users.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late TextEditingController _nameController;
  late TextEditingController _phoneNumber;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _phoneNumber = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _phoneNumber.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text(context.localization.create_title),
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/login_screen');
              }, icon: Icon(Icons.arrow_back_ios,)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, ),
          child: Column(
            children: [
              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRN7msvx0xw1nY2pD3oXBnny-g0udWeiAaP5g&usqp=CAU',
            height: 300.h,
            width: 330.w,
            fit: BoxFit.cover,
              ),
              SizedBox(height: 15.h,),
              Text(
                context.localization.create_subtitle,
                style: GoogleFonts.poppins(fontSize: 16),),
              SizedBox(height: 25,),
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: context.localization.name,
                  prefixIcon: Icon(Icons.person_outlined),
                  enabledBorder: OutlineInputBorder(
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
              )
              ),
              SizedBox(height: 10,),
              TextField(
                  controller: _phoneNumber,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    hintText: context.localization.mobile,
                    prefixIcon: Icon(Icons.phone_android_outlined),
                    enabledBorder: OutlineInputBorder(
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
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: context.localization.email,
            prefixIcon: Icon(Icons.email_outlined),
            enabledBorder: OutlineInputBorder(
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
        SizedBox(height: 10),
        TextField(
          controller: _passwordController,
          keyboardType: const TextInputType.numberWithOptions(),
          decoration: InputDecoration(
            hintText: context.localization.password,
            prefixIcon: Icon(Icons.lock),
            enabledBorder: OutlineInputBorder(
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
              SizedBox(height: 25,),
             ElevatedButton(
                 onPressed: (){
                   _performRegister();
                   // Navigator.pushReplacementNamed(context, '/out_boarding');
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Color(0xFF476269),
                   // backgroundColor: Color(0xff40A798),
                   minimumSize: Size(double.infinity, 50),
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10),
                   ),
                 ),
                 child: Text(
                   context.localization.register,
                   style: GoogleFonts.poppins(
                   fontSize: 17.sp,
                     fontWeight: FontWeight.w600
                 ),
                 ),
             ),
            ],
          ),
      ),
    );
  }

 void _performRegister(){
    if(_checkData()){
      _register();
    }
 }

 bool _checkData(){
    if(_nameController.text.isNotEmpty && _phoneNumber.text.isNotEmpty
        && _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){
      return true;
    }else{
      context.showSnackBar(
          message: context.localization.please_fill_data_register,
          error: true);
      return false;
    }
 }

  void _register()async{
    // Navigator.pop(context);
    ProcessResponse processResponse = await UserDbController().register(user: user);
    if(processResponse.success){
      Navigator.pushReplacementNamed(context, '/out_boarding');
      // Navigator.pushReplacementNamed(context, '/login_screen');
    }
    context.showSnackBar(
        message: processResponse.message,
        error: !processResponse.success);

  }
  User get user {
    User user = User();
    user.name = _nameController.text;
    user.mobile = _phoneNumber.text;
    // user.email = _emailController.text;
    user.password = _passwordController.text;
    return user;
  }

}
