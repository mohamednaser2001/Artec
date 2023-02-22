
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/methods/get_width_and _height.dart';
import '../../../core/resources/constants.dart';
import '../../../core/resources/style/color_manger.dart';
import '../core/core_components.dart';

Future<dynamic> finishExamDialog({
  required context,
  required Function function,
}) => showDialog(
  context: context,
  barrierDismissible: false,
  builder: (context){
    return AlertDialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      contentPadding: const EdgeInsets.all(0.0),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: getWidth(20, context),
                      child: SvgPicture.asset('$imagePath/icons/x_icon.svg', color: Colors.white,),
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),

                Text(
                  'هل أنت متأكد من انهاء الامتحان؟\nسيتم حفظ اجابتك',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xff173F55),
                    fontSize: 22.sp,
                    height: 1.1,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontFamily,
                  ),
                ),
                SizedBox(height: 16.h,),
                customButton(
                  text: 'انهاء الامتحان',
                  color:  AppColors.primaryColor,
                  height: getHeight(52, context),
                  textColor: Colors.black,
                  withBorder: true,
                  width: getWidth(184, context),
                  function: (){
                    function();
                  },
                ),
                SizedBox(height: 20.h,),
              ],
            ),
          ),
        ],
      ),
    );
  },
);