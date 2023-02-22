
import 'package:artech/model/college_model.dart';
import 'package:artech/view/components/core/core_components.dart';
import 'package:artech/view/pages/layout/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/methods/get_width_and _height.dart';
import '../../core/resources/constants.dart';

class CollegeCard extends StatelessWidget {
  CollegeCard({Key? key, required this.collegeModel}) : super(key: key);
  CollegeModel collegeModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context, const HomeLayout());
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              collegeModel.image,
              height: getHeight(188, context),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            collegeModel.name,
            style: TextStyle(
              fontSize: 20.sp,
              fontFamily: fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
