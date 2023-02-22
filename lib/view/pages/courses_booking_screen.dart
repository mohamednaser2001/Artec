

import 'package:artech/core/methods/get_width_and%20_height.dart';
import 'package:artech/core/resources/style/color_manger.dart';
import 'package:artech/view/components/core/default_app_bar.dart';
import 'package:artech/view_model/blocs/app_cubit/states.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/resources/constants.dart';
import '../../view_model/blocs/app_cubit/cubit.dart';
import '../components/core/core_components.dart';
import '../components/courses_booking.dart';

class CoursesBookingScreen extends StatelessWidget {
  CoursesBookingScreen({Key? key}) : super(key: key);
  TextEditingController searchController=TextEditingController();
  var sliderController = PageController();
  var pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.secondaryScaffoldColor,
      appBar: DefaultAppBar(
        title: '',
        withLeadingButton: true,
        leadingFunction: (){
          Navigator.pop(context);
        },
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultHorizontalScreenPadding, vertical: defaultVerticalScreenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أهلا,\n محمد ناصر',
              style: TextStyle(
                fontSize: 24.sp,
                height: 1,
                fontWeight: FontWeight.bold,
                fontFamily: fontFamily,
              ),
            ),
            SizedBox(height: 10.h,),
            DefaultTextFormField(
              controller: searchController,
              validator: (value){},
              context: context,
              verticalPadding: 3.h,
              horizontalPadding: 8.w,
              enabledBorderColor: Colors.grey,
              icon: Padding(
                padding: EdgeInsets.all(12.0.w),
                child: SvgPicture.asset('$imagePath/icons/search.svg',),
              ),
              text: 'البحث عن الكورسات...',
              color:const Color(0xffF5F5F5),
              withBorder: true,
              radius: 14,
            ),

            SizedBox(height: 16.h,),
            CarouselSlider(
              items: List.generate(
                3,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                '$imagePath/images/offer3.jpg',
                                //height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'كورس\n أساسيات التصميم الجرافيكي',
                                    style: TextStyle(
                                      fontFamily: fontFamily,
                                      fontSize: 20.sp,
                                      height: 1,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '20/25 درس',
                                    style: TextStyle(
                                      fontFamily: fontFamily,
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  customButton(
                                    text: 'استمرار',
                                    color: const Color(0xffFF00DD),
                                    withBorder: true,
                                    radius: 13,
                                    width: getWidth(114, context),
                                    height: getHeight(33, context),
                                    function: (){},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
              options: CarouselOptions(
                height: getHeight(188, context),
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1.0,
              ) ,
            ),

     /*
     ///TODO Handle the controller between them
           SmoothPageIndicator(
            controller: sliderController,
            count: 3,
            effect:const ExpandingDotsEffect(
              activeDotColor: Colors.indigo,
              dotColor: Colors.grey,
              dotHeight: 7.0,
              expansionFactor: 4,
              dotWidth: 7,
              spacing: 5.0,
            ),
          ),
*/
            SizedBox(height: 16.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ابحث عن دورتك',
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                customTextButton(
                  text: 'اظهار الكل',
                  textColor: Colors.grey,
                  fontSize: 16,
                  onPressed: (){

                  },
                ),


              ],
            ),

            BlocConsumer<AppCubit, AppStates>(
              listener: (context, state){},
              builder: (context, state) {
                AppCubit cubit =AppCubit.get(context);
                return Row(
                children: [
                  customButton(
                    textColor: cubit.isAllCourses ? Colors.white : Colors.grey,
                    width: 70.w,
                    radius: 6,
                    fontSize: 20,
                    elevation: 0.0,
                    height: 32.h,
                    color: cubit.isAllCourses ? const Color(0xff0008FF) : Colors.transparent,
                    text: 'الكل',
                    function: (){
                      pageViewController.jumpToPage(0);
                      cubit.toggleCoursesPage(true);
                    },
                  ),
                  SizedBox(width: 10.w,),
                  customButton(
                    textColor: cubit.isAllCourses ? Colors.grey : Colors.white,
                    width: 70.w,
                    radius: 6,
                    fontSize: 20,
                    height: 32.h,
                    elevation: 0.0,
                    color: cubit.isAllCourses ? Colors.transparent : const Color(0xff0008FF),
                    text: 'الشائع', function: (){
                      pageViewController.jumpToPage(1);
                    cubit.toggleCoursesPage(false);
                  },
                  ),
                ],
              );
              },
            ),

            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: (index){
                  if(index==0) {
                    AppCubit.get(context).toggleCoursesPage(true);
                  }else {
                    AppCubit.get(context).toggleCoursesPage(false);
                  }
                },
                controller: pageViewController,
                itemCount: 2,
                itemBuilder: (context, index)=>coursesScreens[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


List<Widget> coursesScreens =[
  GridView.count(
    padding: EdgeInsets.all(10.w),
    crossAxisCount: 2,
    mainAxisSpacing: 20.h,
    crossAxisSpacing: 30.w,
    childAspectRatio: 1.w/0.6.h,
    children: List.generate(
      5,
          (index) => CourseCard(),
    ),
  ),

  GridView.count(
    padding: EdgeInsets.all(10.w),
    crossAxisCount: 2,
    mainAxisSpacing: 20.h,
    crossAxisSpacing: 30.w,
    childAspectRatio: 1.w/0.6.h,
    children: List.generate(
      5,
          (index) => CourseCard(),
    ),
  ),
];
 

