import 'package:artech/view/components/core/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/methods/get_width_and _height.dart';
import '../../../core/resources/style/color_manger.dart';
import '../../../core/resources/constants.dart';
import '../../../view_model/blocs/app_cubit/cubit.dart';
import '../../../view_model/blocs/app_cubit/states.dart';
import '../../components/core/core_components.dart';
import '../../components/exams/finish_exam_dialog.dart';

class DrawingAreaScreen extends StatelessWidget {
  const DrawingAreaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
        title: '',
        withLeadingButton: true,
        leadingFunction: (){
          Navigator.pop(context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            padding: EdgeInsets.all(10.w),
            margin: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const[
                Icon(Icons.draw_outlined, size: 32,),
                Icon(Icons.crop_square_rounded, size: 32,),
                Icon(Icons.circle_outlined, size: 32,),
                Icon(Icons.brush, size: 32,),
                Icon(Icons.edit_sharp, size: 32,),
                Icon(Icons.draw_outlined, size: 32,),
              ],
            ),
          ),

          const Expanded(
            child: SizedBox(
              width: double.infinity,
            ),
          ),

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
            height: getHeight(72, context),
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
    );
  }
}



