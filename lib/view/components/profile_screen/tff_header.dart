
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/constants.dart';

class TFFHeader extends StatelessWidget {
  TFFHeader({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: 20.sp,
        color: Colors.black,
      ),
    );
  }
}
