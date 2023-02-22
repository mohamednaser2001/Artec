import 'package:artech/core/resources/style/color_manger.dart';
import 'package:artech/core/resources/constants.dart';
import 'package:artech/view_model/blocs/app_cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/methods/get_width_and _height.dart';
import '../../../view_model/blocs/app_cubit/states.dart';
import '../../components/core/core_components.dart';
import '../../components/exams/finish_exam_dialog.dart';
import 'drawing_area_screen.dart';

class ArtisticExamScreen extends StatelessWidget {
  const ArtisticExamScreen({Key? key}) : super(key: key);

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
                BlocConsumer<AppCubit, AppStates>(
                  listener: (context, state){},
                  builder: (context, state)=>ConditionalBuilder(
                    condition: AppCubit.get(context).artisticExamImage!=null,
                    builder: (context)=>Stack(
                      children: [
                        ClipRRect(
                           borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            AppCubit.get(context).artisticExamImage!,
                            height: 180.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 16.w,
                          right: 16.w,
                          child: InkWell(
                            onTap: (){
                              AppCubit.get(context).deleteArtisticExamImage();
                            },
                            child: CircleAvatar(
                                radius: 18.w,
                                backgroundColor: Colors.redAccent,
                                child: const Icon(Icons.delete_rounded, color: Colors.white,)),

                          ),
                        ),
                      ],
                    ),
                    fallback: (context)=>SizedBox(),
                  ),
                ),

                SizedBox(height: 16.h,),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: customButton(
                    text: 'ارفع الصورة',
                    width: MediaQuery.of(context).size.width*0.4,
                    textColor: Colors.black,
                    suffixIcon: Icons.upload_rounded,
                    function: (){
                      AppCubit.get(context).pickArtisticExamImage(context);
                    },
                  ),
                ),

                SizedBox(height: 40.h,),
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

                SizedBox(height: 20.0.h,),
                customButton(
                  text: 'انهاء الامتحان',
                  color: Colors.white,
                  textColor: Colors.black,
                  withBorder: true,
                  width: getWidth(232, context),
                  function: (){
                    finishExamDialog(
                      context: context,
                      function: (){
                        Navigator.pop(context);
                        Navigator.pop(context);
                        AppCubit.get(context).endTimer();
                      },
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
