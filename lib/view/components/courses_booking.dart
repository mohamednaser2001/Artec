import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/constants.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            '$imagePath/images/offer3.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(4.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'كورس فن الديكور',
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '20/2/2023',
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
