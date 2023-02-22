import 'dart:async';
import 'package:artech/core/resources/constants.dart';
import 'package:artech/view/components/authentication/header_image.dart';
import 'package:artech/view/pages/authentication_pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Timer(const Duration(seconds: 1,milliseconds: 200), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context)=> LoginScreen()),
              (route) => false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeaderImage(imageName: 'logo', width: 190),
            SizedBox(height: 10.h),
            Text(
              'ArTec',
              style: TextStyle(
                color: Colors.white,
                fontFamily: fontFamily,
                fontSize: 38.sp,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.15.h),
          ],
        ),
      ),
    );
  }
}
