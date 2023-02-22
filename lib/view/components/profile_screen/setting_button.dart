

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/style/color_manger.dart';
import '../../../core/resources/constants.dart';

class SettingButton extends StatelessWidget {
  SettingButton({Key? key,
  required this.icon,
    required this.text,
    this.isDelete=false,
    required this.function,
  }) : super(key: key);

  String text;
  Function function;
  IconData icon;
  bool isDelete=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: MaterialButton(
        height: 50.h,
        elevation: 0.0,
        onPressed: (){
          function();
        },
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Icon(icon, color: Colors.black,size: 24.w,)),
            SizedBox(width: 12.w,),
            Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color:Colors.black,
                fontSize: 18.sp,
                fontFamily: fontFamily,
              ),
            ),
            const Spacer(),
            CircleAvatar(
                radius: 12.w,
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_forward_ios, color: AppColors.darkTitlesColor,size: 16.w,)),
          ],
        ),
      ),
    );
  }
}

