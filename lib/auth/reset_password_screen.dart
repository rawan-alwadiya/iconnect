import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/extensions/context_extension.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  late TextEditingController _mobileController;
  late TextEditingController _codeController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileController = TextEditingController();
    _codeController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mobileController.dispose();
    _codeController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text(context.localization.reset_password),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk-qxfeX5ffgUdcE-XCJrQ2I85SJ6Osp50yg&usqp=CAU',
              height: 290.h,
              width: 320.w,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 15,),
            Text(
              context.localization.create_subtitle,
              style: GoogleFonts.poppins(fontSize: 16),),
            SizedBox(height: 15,),
            TextField(
                controller: _mobileController,
                keyboardType: TextInputType.number,
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
                )
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                hintText: context.localization.code,
                prefixIcon: Icon(Icons.numbers_outlined),
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
              controller: _passwordController,
              keyboardType: TextInputType.emailAddress,
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
            SizedBox(height: 10),
            TextField(
              controller: _confirmPasswordController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: context.localization.confirm_password,
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
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: (){
                _performResetPassword();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF476269),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                context.localization.reset_password,
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

  void _performResetPassword(){
    if(_checkData()){
      _resetPassword();
    }
  }

  bool _checkData(){
    if(_mobileController.text.isNotEmpty && _codeController.text.isNotEmpty
        && _passwordController.text.isNotEmpty && _confirmPasswordController.text.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }

  void _resetPassword(){
    Navigator.pushReplacementNamed(context, '/login_screen');

  }
}
