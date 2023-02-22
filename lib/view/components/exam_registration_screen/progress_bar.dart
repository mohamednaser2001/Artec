import 'package:artech/core/resources/style/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/methods/get_width_and _height.dart';
import '../../../core/resources/constants.dart';


class CustomProgressIndicator extends StatelessWidget {
  CustomProgressIndicator({Key? key, required this.progress,}) : super(key: key);
  int progress;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          height: 10,
          width: double.infinity,
          color: Colors.white,
        ),
        Container(
          height: 10,
          width: ((size.width)/3)*progress,
          decoration: BoxDecoration(
            color:AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProgressPoint(text: '1', isReached: progress<4? true : false,),
            ProgressPoint(text: '2', isReached: progress<4 && progress>1? true : false,),
            ProgressPoint(text: '3', isReached: progress<4 && progress>2? true : false,),
          ],
        ),
      ],
    );
  }
}



class ProgressPoint extends StatelessWidget {
  ProgressPoint({Key? key, required this.text, required this.isReached}) : super(key: key);
  String text;
  bool isReached;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: getHeight(22, context),
      backgroundColor:isReached ? AppColors.primaryColor : Colors.white,
      child: Text(
        text,
        style: TextStyle(
            fontFamily: fontFamily,
            fontSize: 24.sp,
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
