import 'package:artech/core/resources/constants.dart';
import 'package:artech/view/components/core/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/college_model.dart';
import '../components/colleges_screen.dart';

class CollegesScreen extends StatelessWidget {
   CollegesScreen({Key? key}) : super(key: key);

  List<CollegeModel> currentColleges =[
    CollegeModel(name: 'كلية الفنون الجميلة', image: '$imagePath/images/college.jpg'),
    CollegeModel(name: 'كلية التربية النوعية', image: '$imagePath/images/college.jpg'),
    CollegeModel(name: 'كلية التربية الفنية', image: '$imagePath/images/college.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'اختر الكلية',
        withLeadingButton: false,
        leadingFunction: (){

        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 30.w),
        child: ListView.separated(
            itemBuilder: (context, index)=>CollegeCard(collegeModel:currentColleges[index],),
            separatorBuilder: (context, index)=>SizedBox(height: 24.h,),
            itemCount: 3),
      ),
    );
  }
}
