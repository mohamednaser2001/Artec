
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/methods/get_width_and _height.dart';
import '../../../../core/resources/constants.dart';
import '../../../../model/question_model.dart';
import 'answer_item.dart';

class MCQExamBody extends StatelessWidget {
  MCQExamBody({Key? key, required this.question, required this.questionIndex}) : super(key: key);
  QuestionModel question;
  int questionIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 38.0,),
        Container(
          color: Colors.white,
          height: getHeight(83, context),
          width: double.infinity,
          alignment: AlignmentDirectional.center,
          child: Text(
            question.question,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 26.sp,
              fontFamily: fontFamily,
            ),
          ),
        ),

        SizedBox(height: 36.0.h,),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index)=> AnswerItem(answer: question.answers[index], answerIndex: index, questionIndex: questionIndex,),
            separatorBuilder: (context, index)=>SizedBox(height: 20.h,),
            itemCount: question.answers.length,
          ),
        ),
      ],
    );
  }
}
