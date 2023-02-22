
import 'package:artech/core/methods/get_width_and%20_height.dart';
import 'package:artech/core/resources/style/color_manger.dart';
import 'package:artech/core/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../components/core/default_app_bar.dart';
import '../components/exams/exam_result.dart';

class ExamsResultsScreen extends StatelessWidget {
  const ExamsResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryScaffoldColor,
      appBar: DefaultAppBar(
        title: 'نتائج الاختبار',
        withLeadingButton: true,
        leadingFunction: (){
          Navigator.pop(context);
        },
      ),

      body: Column(
        children: [
          SizedBox(height: 30.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal:10.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),

            child: Row(
              children: [
                Text(
                  'نتائج اختبار القدرات',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: fontFamily,
                  ),
                ),
                SizedBox(width: 10.w,),
                Text(
                  '2023',
                  style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontFamily: fontFamily,
                  ),
                ),
              ],
            ),
          ),

          Expanded(child: Center(child: ExamResultCart(isPass: false))),
          SizedBox(height: 60.h,),
        ],
      ),
    );
  }
}



