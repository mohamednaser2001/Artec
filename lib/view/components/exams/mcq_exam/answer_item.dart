import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/methods/get_width_and _height.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/style/color_manger.dart';
import '../../../../view_model/blocs/app_cubit/cubit.dart';
import '../../../../view_model/blocs/app_cubit/states.dart';

class AnswerItem extends StatelessWidget {
  AnswerItem({Key? key, required this.answer, required this.answerIndex, required this.questionIndex}) : super(key: key);
  String answer;
  int answerIndex;
  int questionIndex;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state)=> InkWell(
        onTap: (){
          AppCubit.get(context).changeAnswer(questionIndex, answerIndex);
        },
        child: Container(
          height: getHeight(53, context),
          padding: EdgeInsets.symmetric(horizontal: 16.0.w,),
          decoration: BoxDecoration(
              color:AppCubit.get(context).answerNumbers[questionIndex]== answerIndex ? AppColors.primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(6.0)
          ),
          child: Row(
            children: [
              Container(
                width: 28.0.w,
                padding:const EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    getChar(answerIndex),
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontFamily: fontFamily,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: Text(
                  answer,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontFamily: fontFamily,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }




  String getChar(int i){
    if(i==0) return 'أ';
    else if(i==1) return 'ب';
    else if(i==2) return 'ج';
    else return 'د';
  }
}
