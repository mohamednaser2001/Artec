import 'package:artech/view/pages/exams/drawing_area_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/methods/get_width_and _height.dart';
import '../../../core/resources/style/color_manger.dart';
import '../../../core/resources/constants.dart';
import '../../../view_model/blocs/app_cubit/cubit.dart';
import '../../../view_model/blocs/app_cubit/states.dart';
import '../../components/core/core_components.dart';

class DecorativeDesignExamScreen extends StatelessWidget {
  const DecorativeDesignExamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryScaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultHorizontalScreenPadding, vertical: defaultVerticalScreenPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: 4.w,backgroundColor: Colors.black,),
                    SizedBox(width: 10.w,),
                    Text(
                      'اختبار الرسم:',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: fontFamily,
                      ),
                    ),
                  ],
                ),
                Text(
                  'تعتبر المدرسة واحدة من اهم الاماكن التي يسمارس فيها الرياضة بشكل منتظم ومتنوع, من خلال مناهج التربية الطلابية.',
                  style: TextStyle(
                    fontSize: 20.sp,
                    height: 1.1,
                    fontFamily: fontFamily,
                  ),
                ),

                SizedBox(height: 20.h,),
                Row(
                  children: [
                    CircleAvatar(radius: 4.w,backgroundColor: Colors.black,),
                    SizedBox(width: 10.w,),
                    Text(
                      'المطلوب:',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: fontFamily,
                      ),
                    ),
                  ],
                ),
                Text(
                  'بالخطوط (وبالخطوات كلما امكن) مشهدا لاحد ملامح الرياضة المدرسية في الملاعب, مراعيا قدر استطاعتك التعبير عن النسب الصحيحة للجسم البشري ومحققا التنوع الضروري للخطوط.',
                  style: TextStyle(
                    fontSize: 20.sp,
                    height: 1.1,
                    fontFamily: fontFamily,
                  ),
                ),

                SizedBox(height: 20.h,),

                SizedBox(height: 20.0.h,),
                customButton(
                  text: 'بدء الرسم',
                  color: Colors.white,
                  height: getHeight(72, context),
                  textColor: Colors.black,
                  withBorder: true,
                  width: getWidth(232, context),
                  function: (){
                    navigateTo(context, const DrawingAreaScreen());
                  },
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.2.h,),
                BlocConsumer<AppCubit, AppStates>(
                  listener: (context, state){},
                  builder: (context, state){
                    AppCubit cubit = AppCubit.get(context);
                    return Text(
                      AppCubit.get(context).remainingTime,
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.sp,
                      ),
                    );
                  },
                ),
                SizedBox(height: 30.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
