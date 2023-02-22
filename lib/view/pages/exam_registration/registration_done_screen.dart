import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/methods/get_width_and _height.dart';
import '../../../core/resources/constants.dart';
import '../../../core/resources/style/color_manger.dart';

class RegistrationDonePage extends StatelessWidget {
  const RegistrationDonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: getHeight(390, context),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Image.asset(
              '$imagePath/images/registration_done.png',
              height: getHeight(283, context),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'تم التسجيل بنجاح',
                  style: TextStyle(
                    fontSize: 20.sp,
                    height: 1.1,
                    fontWeight: FontWeight.w600,
                    fontFamily: fontFamily,
                    color:Colors.black.withOpacity(0.8),
                  ),
                ),
                SizedBox(width: 10.w,),
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 10.w,
                  child: const Icon(Icons.done, color: Colors.white,),
                ),
              ],
            ),



          ],
        ),
      ),
    );
  }
}
