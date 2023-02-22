

import 'package:artech/core/methods/get_width_and%20_height.dart';
import 'package:artech/core/resources/constants.dart';
import 'package:artech/view/components/core/core_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/exams/instructions_screen.dart';
import 'opening_camera/opening_camera_screen.dart';

class InstructionsScreen extends StatelessWidget {
  const InstructionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 20.h),
            child: Column(
              children: [
                Container(
                  height: getHeight(68, context),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[700]!,),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        '$imagePath/icons/instructions.jpg',
                      ),
                      Text(
                        'التعليمات',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: fontFamily,
                          fontSize: 24.sp,
                        ),
                      ),
                      SvgPicture.asset(
                        '$imagePath/icons/x_icon.svg',
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h,),
                SvgPicture.asset(
                  '$imagePath/images/instructions.svg',
                  height: getHeight(306, context),
                  width: getWidth(283, context),
                  fit: BoxFit.cover,
                ),

                SizedBox(height: 20.h,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 22.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      InstructionItem(text: 'الرجاء التأكد من فتح الكاميرا',),
                      InstructionItem(text: 'الرجاء رفع الصورة بعد الانتهاء',),
                      InstructionItem(text: 'الرجاء التأكد رفع الصورة',),
                      InstructionItem(text: 'الرجاء انتظار نتيجة الامتحان',),
                    ],
                  ),
                ),

                SizedBox(height: 30.h,),
                customButton(
                  text: 'بدأ الامتحان',
                  color: Colors.white,
                  elevation: 0.0,
                  textColor: Colors.black,
                  radius: 16,
                  withBorder: true,
                  width: MediaQuery.of(context).size.width*0.5,
                  function: (){
                    navigateTo(context, OpeningCameraScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


