
import 'package:artech/core/methods/get_width_and%20_height.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/resources/constants.dart';

class HeaderImage extends StatelessWidget {
  HeaderImage({Key? key, required this.imageName, required this.width, this.withBackground=false}) : super(key: key);
  String imageName;
  double width;
  bool withBackground;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: withBackground,
      builder: (context)=> Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:const BorderRadius.only(
            bottomLeft: Radius.circular(65),
            bottomRight: Radius.circular(65),
          ),
          border: Border.all(color: const Color(0xffE8F2F8), width: getWidth(10, context)),
        ),
        child: Column(
          children: [
            SizedBox(height: 28.h,),
            SvgPicture.asset(
              '$imagePath/images/$imageName.svg',
              width: getWidth(width, context),
              height: getWidth(width, context),
            ),
          ],
        ),
      ),
      fallback: (context)=> SvgPicture.asset(
        '$imagePath/images/$imageName.svg',
        width: getWidth(width, context),
        height: getWidth(width, context),
      ),
    );
  }
}
