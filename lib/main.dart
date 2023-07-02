import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnect/auth/activate_screen.dart';
import 'package:iconnect/auth/forget_password_screen.dart';
import 'package:iconnect/auth/login_screen.dart';
import 'package:iconnect/auth/register_screen.dart';
import 'package:iconnect/auth/reset_password_screen.dart';
import 'package:iconnect/bloc/bloc/cart_bloc.dart';
import 'package:iconnect/bloc/bloc/favorites_bloc.dart';
import 'package:iconnect/bloc/states/cart_state.dart';
import 'package:iconnect/bloc/states/favorites_state.dart';
import 'package:iconnect/cubit/language_cubic.dart';
import 'package:iconnect/cubit/language_state.dart';
import 'package:iconnect/database/db_controller.dart';
import 'package:iconnect/prefs/shared_pref_controller.dart';
import 'package:iconnect/screens/app/accessories_categories.dart';
import 'package:iconnect/screens/app/android_catogories.dart';
import 'package:iconnect/screens/app/bottom_navigation_screen.dart';
import 'package:iconnect/screens/app/cart_screen.dart';
import 'package:iconnect/screens/app/favorites_screen.dart';
import 'package:iconnect/screens/app/hp_categories.dart';
import 'package:iconnect/screens/app/ios.dart';
import 'package:iconnect/screens/app/order_completed.dart';
import 'package:iconnect/screens/app/out_boarding/out_boarding_screen.dart';
import 'package:iconnect/screens/app/payment_method.dart';
import 'package:iconnect/screens/launch_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  await DbController().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: (context, child){
        return MultiBlocProvider(
          providers: [
            BlocProvider<CartBloc>(create: (context)=>CartBloc(LoadingState())),
            BlocProvider<FavoritesBloc>(create:(context)=> FavoritesBloc(FavoriteLoadingState())),
            BlocProvider(create: (context)=> LangauageCubit()..getSavedLanguage())
          ],
          child: BlocBuilder<LangauageCubit,LanguageState>(
            builder: (context,state){
              if(state is ChangeLanguageState){
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      scaffoldBackgroundColor: Colors.white,
                      backgroundColor: Colors.white,
                      appBarTheme: AppBarTheme(
                          centerTitle: true,
                          backgroundColor: Colors.white,
                          elevation: 0,
                          titleTextStyle: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22
                          ),
                          iconTheme: IconThemeData(color: Colors.black)
                      )

                  ),
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                  ],
                  supportedLocales: [
                    Locale('en'),
                    Locale('ar')
                  ],
                  locale: state.locale,
                  initialRoute: '/launch_screen',
                  routes: {
                    '/launch_screen':  (context) => const LaunchScreen(),
                    '/register_screen': (context) => const RegisterScreen(),
                    '/login_screen': (context) => const LoginScreen(),
                    '/out_boarding':(context) => const OutBoarding(),
                    // '/home_screen' : (context) => const HomeScreen(),
                    '/bottom_navigation_screen': (context) => const BottomNavigationScreen(),
                    '/cart_screen': (context) => const CartScreen(),
                    '/activate_screen':(context) => const ActivateScreen(),
                    '/forget_password_screen': (context) => const ForgetPassword(),
                    '/reset_password_screen': (context) => const ResetPassword(),
                    '/favorites_screen': (context) => const FavoritesScreen(),
                    '/payment_method': (context) => const PaymentMethod(),
                    '/order_completed': (context) => const OrderCompleter(),
                    '/ios':(context) => const Ios(),
                    '/android_categories': (context) => const AndroidCategories(),
                    '/hp_categories':(context) => const HpCategories(),
                    '/accessories_categories': (context) => const AccessoriesCategories(),
                  },
                );
              }else {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      scaffoldBackgroundColor: Colors.white,
                      backgroundColor: Colors.white,
                      appBarTheme: AppBarTheme(
                          centerTitle: true,
                          backgroundColor: Colors.white,
                          elevation: 0,
                          titleTextStyle: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22
                          ),
                          iconTheme: IconThemeData(color: Colors.black)
                      )

                  ),
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                  ],
                  supportedLocales: [
                    Locale('en'),
                    Locale('ar')
                  ],
                  locale: Locale(SharedPrefController().getValueFor(
                      key: PrefKeys.language.name) ?? 'en'),
                  initialRoute: '/launch_screen',
                  routes: {
                    '/launch_screen': (context) => const LaunchScreen(),
                    '/register_screen': (context) => const RegisterScreen(),
                    '/login_screen': (context) => const LoginScreen(),
                    '/out_boarding': (context) => const OutBoarding(),
                    // '/home_screen' : (context) => const HomeScreen(),
                    '/bottom_navigation_screen': (
                        context) => const BottomNavigationScreen(),
                    '/cart_screen': (context) => const CartScreen(),
                    '/activate_screen': (context) => const ActivateScreen(),
                    '/forget_password_screen': (
                        context) => const ForgetPassword(),
                    '/reset_password_screen': (
                        context) => const ResetPassword(),
                    '/favorites_screen': (context) => const FavoritesScreen(),
                    '/payment_method': (context) => const PaymentMethod(),
                    '/order_completed': (context) => const OrderCompleter(),
                    '/ios': (context) => const Ios(),
                    '/android_categories': (
                        context) => const AndroidCategories(),
                    '/hp_categories': (context) => const HpCategories(),
                    '/accessories_categories': (
                        context) => const AccessoriesCategories(),
                  },
                );
              }
            },

          ),
        );
      },
    );
  }
}
