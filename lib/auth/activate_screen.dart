import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/extensions/context_extension.dart';

class ActivateScreen extends StatefulWidget {
  const ActivateScreen({Key? key}) : super(key: key);

  @override
  State<ActivateScreen> createState() => _ActivateScreenState();
}

class _ActivateScreenState extends State<ActivateScreen> {

  late TextEditingController _mobileController;
  late TextEditingController _codeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileController = TextEditingController();
    _codeController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mobileController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text(context.localization.activate_account),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOa1ofxeBooHiTI3sM3wNnAbn0rRzzgbxj4Q&usqp=CAU',
              height: 405.h,
              width: 320.w,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 15,),
            Text(
              context.localization.forget_password_subtitle,
              style: GoogleFonts.poppins(fontSize: 19.sp),),
            SizedBox(height: 25,),
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
            SizedBox(height: 10.h,),
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
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
            SizedBox(height: 25.h,),
            ElevatedButton(
              onPressed: (){
                _performActivation();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF476269),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                context.localization.activate,
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
  void _performActivation(){
    if(_checkData()){
      _activate();
    }
  }

  bool _checkData(){
    if(_mobileController.text.isNotEmpty && _codeController.text.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }

  void _activate(){
    Navigator.pushReplacementNamed(context, '/login_screen');

  }
}
