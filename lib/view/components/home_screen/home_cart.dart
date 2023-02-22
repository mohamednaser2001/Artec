

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/methods/get_width_and _height.dart';
import '../../../core/resources/constants.dart';
import '../../../model/college_model.dart';

class HomeCart extends StatelessWidget {
  HomeCart({Key? key, required this.collegeModel, required this.function}) : super(key: key);
  CollegeModel collegeModel;
  Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        function();
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow:[
            BoxShadow(
              color: Colors.grey[400]!,
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0.5, 0.5),
            ),
          ],
        ),

        child: Row(
          children: [
            SvgPicture.asset(
              collegeModel.image,
              width: getWidth(34, context),
              height: getWidth(34, context),
            ),
            SizedBox(width: 6.w,),
            Expanded(
              child: Text(
                collegeModel.name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: fontFamily,
                  height: 1.3,
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
