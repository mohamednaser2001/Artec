

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources/constants.dart';

class ArrowButton extends StatelessWidget {
  ArrowButton({Key? key, required this.function}) : super(key: key);
  Function function;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: const Color(0xff143C50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      onPressed: (){
        function();
      },
      child: SvgPicture.asset('$imagePath/icons/arrow_right.svg', width: 28.w,),
    );
  }
}
