import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/methods/get_width_and _height.dart';
import '../../../core/resources/constants.dart';

class ExamResultCart extends StatelessWidget {
  ExamResultCart({Key? key, required this.isPass}) : super(key: key);
  bool isPass;
  @override
  Widget build(BuildContext context) {
    return Container(
      width : getWidth(321, context),
      height : getWidth(321, context),
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isPass? Colors.green : Colors.red, width: 1.5),
        boxShadow:[
          BoxShadow(
            color: Colors.grey[300]!,
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0.5, 0.5),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            isPass? '$imagePath/images/pass_exam.svg' : '$imagePath/images/fail_in_exam.svg',
            width: getWidth(214, context),
          ),
          Text(
            isPass? 'لائق' : 'غير لائق',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              fontFamily: fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
