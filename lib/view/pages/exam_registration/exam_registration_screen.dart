import 'package:artech/core/resources/style/color_manger.dart';
import 'package:artech/core/resources/constants.dart';
import 'package:artech/view/components/core/default_app_bar.dart';
import 'package:artech/view/pages/exam_registration/payment_pages/payment_screen.dart';
import 'package:artech/view/pages/exam_registration/registration_done_screen.dart';
import 'package:artech/view/pages/exam_registration/user_information_pages/user_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../view_model/blocs/app_cubit/cubit.dart';
import '../../../view_model/blocs/app_cubit/states.dart';
import '../../components/core/core_components.dart';
import '../../components/exam_registration_screen/progress_bar.dart';

class ExamRegistrationScreen extends StatelessWidget {
  ExamRegistrationScreen({Key? key}) : super(key: key);
  var pageViewController = PageController();
  var formKey = GlobalKey<FormState>();

  List<Widget> mcqExamRegistrationPages =[
    UserInformationPage(),
    ExamRegistrationCostPage(),
    RegistrationDonePage(),
  ];

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    return Scaffold(
      backgroundColor: AppColors.secondaryScaffoldColor,
      resizeToAvoidBottomInset: false,
      appBar: DefaultAppBar(
        title: 'تسجيل الاختبار',
        withLeadingButton: true,
        leadingFunction: (){
          cubit.mcqRegistrationPageNumber=0;
          Navigator.pop(context);
        },
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultHorizontalScreenPadding.w, vertical: defaultVerticalScreenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            BlocConsumer<AppCubit, AppStates>(
              listener: (context, state){},
              builder:(context, state)=> CustomProgressIndicator(progress: (cubit.mcqRegistrationPageNumber+1),),
            ),

            SizedBox(height: 24.0.h,),

            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: (index){
                  cubit.changeMCQRegistrationPageNumber(index);
                },

                controller: pageViewController,
                itemCount: mcqExamRegistrationPages.length,
                itemBuilder: (context, index)=>mcqExamRegistrationPages[index],
              ),
            ),


            SizedBox(height: 30.0.h,),
            BlocConsumer<AppCubit, AppStates>(
              listener: (context, state){},
              builder: (context, state)=> customButton(
                text: cubit.mcqRegistrationPageNumber==2?'أنهاء' : 'استمرار',
                color: Colors.white,
                radius: 12,
                textColor: Colors.black.withOpacity(0.8),
                fontSize: 22.sp,
                function: (){
                  print(cubit.mcqRegistrationPageNumber);
                  if(cubit.mcqRegistrationPageNumber<2){
                    pageViewController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);
                  }else{
                    cubit.mcqRegistrationPageNumber=0;
                    Navigator.pop(context);
                  }
                },
              ),
            ),
            SizedBox(height: 16.0.h,),
          ],
        ),
      ),
    );
  }
}




















