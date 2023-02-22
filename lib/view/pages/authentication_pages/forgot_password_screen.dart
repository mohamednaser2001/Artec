import 'dart:async';
import 'package:artech/view/components/authentication/arrow_back_button.dart';
import 'package:artech/view/components/authentication/arrow_button.dart';
import 'package:artech/view/pages/authentication_pages/otp_screen.dart';
import 'package:artech/view/pages/authentication_pages/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/resources/style/color_manger.dart';
import '../../../core/resources/constants.dart';
import '../../components/authentication/header_image.dart';
import '../../components/core/core_components.dart';




class ForgotPasswordScreen extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultHorizontalScreenPadding.w),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                ArrowBackButton(function: (){
                  Navigator.pop(context);
                }),
                Column(
                  children: [
                    HeaderImage(imageName: 'otp_image', width: 138, withBackground: true,),
                    SizedBox(height: 20.h,),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'نسيت كلمة السر؟',
                        style: TextStyle(
                          fontSize: 30.sp,
                          height: 1.2,
                          fontFamily: fontFamily,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      'من فضلك أدخل البريد الالكتروني الخاص بك أو رقم الهاتف لاعادة تعيين كلمة المرور.',
                      style: TextStyle(
                        fontSize: 16.sp,
                        height: 1.1,
                        fontFamily: fontFamily,
                        color: AppColors.descriptionColor,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 24.h,),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              'البريد الالكتروني/ رقم الهاتف',
                              style: TextStyle(
                                fontSize: 20.sp,
                                height: 1.1,
                                fontFamily: fontFamily,
                                color: AppColors.descriptionColor,
                              ),
                            ),
                          ),

                          SizedBox(height: 14.h,),
                          Form(
                            key: formKey,
                            child: DefaultTextFormField(
                              controller: emailController,
                              withBorder: false,
                              verticalPadding: 4,
                              inputType: TextInputType.emailAddress,
                              color: Colors.white,
                              validator: (value){},
                              context: context,
                            ),
                          ),
                          Container(height: 1.h,color: Colors.grey,),
                          SizedBox(height: 20.h,),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: customTextButton(
                              text: 'اعادة تعيين كلمة المرور',
                              textColor: Colors.black.withOpacity(0.8),
                              fontSize: 16.sp,
                              onPressed: (){},
                            ),
                          ),

                          SizedBox(height: 10.h,),
                          ArrowButton(function: (){
                            navigateTo(context, OTPScreen());
                          }),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.25.h,
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





