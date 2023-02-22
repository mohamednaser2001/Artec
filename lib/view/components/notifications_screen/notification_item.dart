import 'package:artech/core/methods/get_width_and%20_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/style/color_manger.dart';
import '../../../core/resources/constants.dart';


class NotificationItem extends StatelessWidget {
  NotificationItem({Key? key, required this.index}) : super(key: key);
  int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        //height: 130,
        color: index<1 ? const Color(0xffccdae1): Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'لقد تم اعتماد نتيجة الاختبارات',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: fontFamily,
                        height: 1.5.sp,
                        fontSize: 20.sp,
                      ),
                    ),
                    Text(
                      'لقد تم اعتماد نتيجة اختبارات القدرات اليوم الموافق 31/2/2025 من قبل عميد الكلية وتم اختيار الطلاب الجدد لدخول الكلية وبدء عام جديد.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.descriptionColor,
                        fontFamily: fontFamily
                      ),
                    )
                  ],
                ),
              ),

              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  '$imagePath/images/college.jpg',
                  width: getWidth(112, context),
                  height: getWidth(112, context),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


