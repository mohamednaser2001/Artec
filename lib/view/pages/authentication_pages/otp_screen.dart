import 'dart:async';
import 'package:artech/view/components/authentication/arrow_back_button.dart';
import 'package:artech/view/components/authentication/arrow_button.dart';
import 'package:artech/view/pages/authentication_pages/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/resources/style/color_manger.dart';
import '../../../core/resources/constants.dart';
import '../../components/authentication/header_image.dart';
import '../../components/core/core_components.dart';




class OTPScreen extends StatelessWidget {

  TextEditingController pinFieldController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
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
                    Text(
                      'قم بادخال الكود',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontFamily: fontFamily,
                        color: AppColors.darkTitlesColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'أدخل رمز التحقيق الذي أرسلناه لك على عنوان بريدك الالكتروني أو رقم الهاتف.',
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
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              'أدخل الكود',
                              style: TextStyle(
                                fontSize: 20.sp,
                                height: 1.1,
                                fontFamily: fontFamily,
                                color: AppColors.descriptionColor,
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: MediaQuery.of(context).size.width*0.15.w),
                            child: Form(
                              key: formKey,
                              child: PinCodeTextField(
                                appContext: context,
                                pastedTextStyle:const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                length: 4,

                                animationType: AnimationType.fade,
                                validator: (v) {
                                  if (v!.length < 4) {
                                    return "أدخل باقي الرقم";
                                  } else {
                                    return null;
                                  }
                                },
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.underline,
                                  activeFillColor: Colors.white,
                                  activeColor: Colors.black,
                                  inactiveColor: Colors.grey,
                                  selectedColor: AppColors.primaryColor,
                                ),
                                cursorColor: Colors.black,
                                animationDuration: const Duration(milliseconds: 300),
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: fontFamily,
                                  fontSize: 20.sp,
                                ),
                                errorAnimationController: errorController,
                                controller: pinFieldController,
                                keyboardType: TextInputType.number,
                                onCompleted: (v) {

                                },

                                onChanged: (value) {

                                },
                                beforeTextPaste: (text) {
                                  return true;
                                },
                              ),
                            ),
                          ),

                          ArrowButton(function: (){
                            navigateTo(context, ResetPasswordScreen());
                          }),

                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: customTextButton(
                              text: 'اعادة ارسال الرمز؟',
                              withUnderLine: true,
                              textColor: Colors.grey,
                              fontSize: 12.sp,
                              onPressed: (){},
                            ),
                          ),
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





