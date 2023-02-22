import 'package:artech/core/methods/get_width_and%20_height.dart';
import 'package:artech/core/resources/app_timer.dart';
import 'package:artech/view/components/authentication/header_image.dart';
import 'package:artech/view/pages/authentication_pages/forgot_password_screen.dart';
import 'package:artech/view_model/blocs/app_cubit/cubit.dart';
import 'package:artech/view_model/blocs/login/login_cubit.dart';
import 'package:artech/view_model/blocs/login/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/style/color_manger.dart';
import '../../../core/resources/constants.dart';
import '../../components/core/background_curved_container.dart';
import '../../components/core/core_components.dart';
import '../colleges_screen.dart';
import 'register_screen.dart';


class LoginScreen extends  StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Stack(
                children: [
                  BackgroundCurvedContainer(height: MediaQuery.of(context).size.height*0.4,),
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HeaderImage(imageName: 'logo', width: 171, ),
                        SizedBox(height: 24.0.h,),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: const Color(0xff9AB4C3),
                            borderRadius: BorderRadius.circular(81),
                            boxShadow:[
                              BoxShadow(
                                color: AppColors.primaryColor.withOpacity(0.5),  //color of shadow
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(2, 0),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  color: Colors.white,
                                  // fontWeight: FontWeight.w500,
                                  fontFamily: fontFamily,
                                ),
                              ),
                              SizedBox(height: 30.0.h,),

                              DefaultTextFormField(
                                context: context,
                                controller: emailController,
                                hintColor: Colors.grey,
                                inputType: TextInputType.emailAddress,
                                verticalPadding: verticalPaddingOfAuthenticationTFF,
                                horizontalPadding: horizontalPaddingOfAuthenticationTFF,
                                color: AppColors.textFieldBackground,
                                validator: (value){
                                  if(value!.isEmpty) return 'Enter your email';
                                  return null;
                                },
                                text: 'اسم المستخدم',
                                isPassword: false,
                              ),

                              SizedBox(height: 28.h,),
                              DefaultTextFormField(
                                context: context,
                                color: AppColors.textFieldBackground,
                                controller: passwordController,
                                verticalPadding: verticalPaddingOfAuthenticationTFF,
                                horizontalPadding: horizontalPaddingOfAuthenticationTFF,
                                suffixIconPressed: (){

                                },
                                validator: (value){
                                  if(value!.isEmpty) return 'Enter your password';
                                  return null;
                                },
                                text: 'كلمة المرور',
                                isPassword: true,
                                isSecured: true,
                              ),

                              SizedBox(height: 4.0.h,),
                              Row(
                                children: [
                                  BlocConsumer<LoginCubit, LoginStates>(
                                    listener: (context, state){},
                                    builder: (context, state)=> InkWell(
                                      onTap: (){
                                        LoginCubit.get(context).changeRadioButton();
                                      },
                                      child: CircleAvatar(
                                        radius: 7.5.w,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          radius: 5.5.w,
                                          backgroundColor:LoginCubit.get(context).isActive ? AppColors.primaryColor : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w,),
                                  Text(
                                    'تذكرني',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.white,
                                      fontFamily: fontFamily,
                                    ),
                                  ),
                                  const Spacer(),
                                  customTextButton(
                                    text: 'نسيت كلمة السر؟',
                                    withUnderLine: true,
                                    textColor: Colors.white,
                                    fontSize: 18.sp,

                                    onPressed: (){
                                      navigateTo(context, ForgotPasswordScreen());
                                    },
                                  ),
                                ],
                              ),

                              SizedBox(height: 30.0.h,),

                              customButton(
                                text: 'تسجيل الدخول',
                                color: Colors.white,
                                elevation: 0.1,
                                fontSize: 17,
                                textColor: Colors.black,
                                height: getHeight(53, context),
                                radius: 10,
                                function: (){
                                  navigateTo(context,  CollegesScreen());
                                } ,
                              ),

                              Align(
                                alignment: Alignment.topRight,
                                child: customTextButton(
                                    text: 'انشاء حساب',
                                    fontSize: 16.sp,
                                    textColor: Colors.white,
                                    onPressed: (){
                                      navigateTo(context, RegisterScreen());
                                    }
                                ),
                              ),
                              SizedBox(height: 30.0.h,),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


