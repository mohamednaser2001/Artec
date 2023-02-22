import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/constants.dart';

class InstructionItem extends StatelessWidget {
  InstructionItem({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 4.w,
          backgroundColor: Colors.black,
        ),
        SizedBox(width: 10.w,),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            height: 1.4,
            fontFamily: fontFamily,
            fontSize: 22.sp,
          ),
        ),
      ],
    );
  }
}
