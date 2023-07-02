
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/prefs/shared_pref_controller.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      bool loggedIn = SharedPrefController().getValueFor<bool>(key: PrefKeys.loggedIn.name) ?? false;
      String route = loggedIn? '/bottom_navigation_screen':'/bottom_navigation_screen';
      Navigator.pushReplacementNamed(context,route);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Color(0xFF40A798),
              Color(0xFF476269)
            ]
          )
        ),
        child: Text('iConnect', style: GoogleFonts.pacifico(fontSize: 34,fontWeight: FontWeight.bold, color: Colors.white,),),
      ),
    );
  }
}
