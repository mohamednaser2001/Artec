import 'package:artech/core/methods/get_width_and%20_height.dart';
import 'package:artech/model/college_model.dart';
import 'package:artech/view/components/core/default_app_bar.dart';
import 'package:artech/view/pages/courses_booking_screen.dart';
import 'package:artech/view/pages/exam_registration/exam_registration_screen.dart';
import 'package:artech/view/pages/exams_results_screen.dart';
import 'package:artech/view/pages/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/resources/style/color_manger.dart';
import '../../../core/resources/constants.dart';
import '../../../view_model/blocs/app_cubit/cubit.dart';
import '../../components/core/background_curved_container.dart';
import '../../components/core/core_components.dart';
import '../../components/home_screen/department_cart.dart';
import '../../components/home_screen/home_cart.dart';
import '../exams/instructions_screen.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    List<HomeCart> homeCarts=[
      HomeCart(collegeModel: cubit.homeMenu[0], function: (){navigateTo(context, const ProfileScreen());},),
      HomeCart(collegeModel: cubit.homeMenu[1], function: (){navigateTo(context, ExamRegistrationScreen());},),
      HomeCart(collegeModel: cubit.homeMenu[2], function: (){navigateTo(context, const InstructionsScreen());},),
      HomeCart(collegeModel: cubit.homeMenu[3], function: (){navigateTo(context, const ExamsResultsScreen());},),
      HomeCart(collegeModel: cubit.homeMenu[4], function: (){navigateTo(context, CoursesBookingScreen());},),
      HomeCart(collegeModel: cubit.homeMenu[5], function: (){navigateTo(context, const InstructionsScreen());},),
    ];

    return Scaffold(
      backgroundColor: AppColors.secondaryScaffoldColor,
      appBar: DefaultAppBar(
        title: 'الصفحة الرئيسية',
        appBarColor: AppColors.primaryColor,
        leadingFunction: (){},
      ),

      body: Stack(
        children: [
          BackgroundCurvedContainer(height:MediaQuery.of(context).size.height*0.15, radius: 500,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الأقسام',
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: getHeight(140, context),
                child: ListView.separated(
                  itemCount: AppCubit.get(context).departments.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemBuilder: (context, index)=>DepartmentCart(collegeModel: AppCubit.get(context).departments[index], ),
                  separatorBuilder: (context, index)=>SizedBox(width: 20.w,),
                ),
              ),

              SizedBox(height: 20.h,),
              Text(
                'القائمة',
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ), 
              Expanded(
                child: GridView.count(
                  padding: EdgeInsets.all(10.w),
                  crossAxisCount: 2,
                  mainAxisSpacing: 30.h,
                  crossAxisSpacing: 24.w,
                  childAspectRatio: 1.w/0.52.h,
                  children: List.generate(
                        cubit.homeMenu.length,
                        (index) => homeCarts[index],
                ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}








