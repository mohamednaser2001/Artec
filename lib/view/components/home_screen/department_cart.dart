import 'package:artech/core/methods/get_width_and%20_height.dart';
import 'package:artech/model/college_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/constants.dart';

class DepartmentCart extends StatelessWidget {
  DepartmentCart({Key? key, required this.collegeModel}) : super(key: key);
  CollegeModel collegeModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              collegeModel.image,
              width: getWidth(207, context),
              height: getHeight(138, context),
              fit: BoxFit.cover,),
        ),
        Text(
          collegeModel.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: 22.sp,
            height: 1.3,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

