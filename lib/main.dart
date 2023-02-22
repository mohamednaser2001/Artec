
import 'package:artech/view/pages/splash_screen.dart';
import 'package:artech/view_model/blocs/app_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/resources/app_localization.dart';
import 'core/resources/style/app_theme.dart';

void main() {


  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  AppTheme appTheme= AppTheme();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return BlocProvider(
          create: (context)=>AppCubit(),
          child: MaterialApp(

            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }

              return supportedLocales.first;
            },

            theme: appTheme.lightTheme(),
            debugShowCheckedModeBanner: false,
            home: child,
          ),
        );
      },
      child:  SplashScreen(),
    );
  }
}

