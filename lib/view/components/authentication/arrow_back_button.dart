

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources/constants.dart';

class ArrowBackButton extends StatelessWidget {
  ArrowBackButton({Key? key, required this.function}) : super(key: key);
  Function function;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.h,
      left: 0.0,
      child: IconButton(
        icon: SvgPicture.asset('$imagePath/icons/arrow_left.svg', width: 26.w,),
        onPressed: (){
          function();
        },
      ),
    );
  }
}
