import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/extensions/context_extension.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  late TextEditingController _mobileController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text(context.localization.forget_password),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9m_XkRKXa8nfTv1kkOndR3kWxj2C20ixM2g&usqp=CAU',
              height: 450.h,
              width: 320.w,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 35.h,),
            Text(
              context.localization.forget_password_subtitle,
              style: GoogleFonts.poppins(fontSize: 19.sp),),
            SizedBox(height: 25.h,),
            TextField(
              controller: _mobileController,
              keyboardType: TextInputType.text,
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

            SizedBox(height: 25.h,),
            ElevatedButton(
              onPressed: (){
                _performSubmit();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF476269),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                context.localization.submit,
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
  void _performSubmit(){
    if(_checkData()){
      _submit();
    }
  }

  bool _checkData() {
    if (_mobileController.text.isNotEmpty) {
      return true;
    } else{
      return false;
    }
  }

  void _submit(){
    Navigator.pushNamed(context, '/reset_password_screen');
  }
}
