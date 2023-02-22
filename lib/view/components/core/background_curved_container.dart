import 'package:artech/core/resources/style/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundCurvedContainer extends StatelessWidget {
  BackgroundCurvedContainer({Key? key, required this.height, this.radius=50}) : super(key: key);
  double height;
  double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        ),
      ),
    );
  }
}
