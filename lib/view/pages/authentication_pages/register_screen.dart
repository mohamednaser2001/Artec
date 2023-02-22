import 'package:artech/core/methods/get_width_and%20_height.dart';
import 'package:artech/view/pages/authentication_pages/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/style/color_manger.dart';
import '../../../core/resources/constants.dart';
import '../../components/authentication/header_image.dart';
import '../../components/core/core_components.dart';


class RegisterScreen extends  StatelessWidget {
  var nationalIdController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var ensurePasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.4,
                  decoration:const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(defaultHorizontalScreenPadding.w),
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
                              'انشاء حساب',
                              style: TextStyle(
                                fontSize: 30.sp,
                                color: Colors.white,
                                fontFamily: fontFamily,
                              ),
                            ),
                            SizedBox(height: 24.0.h,),

                            DefaultTextFormField(
                              context: context,
                              controller: nameController,
                              hintColor: Colors.grey,
                              inputType: TextInputType.text,
                              verticalPadding: verticalPaddingOfAuthenticationTFF,
                              horizontalPadding: horizontalPaddingOfAuthenticationTFF,
                              color: Colors.white,
                              validator: (value){
                                if(value!.isEmpty) return 'ادخل اسم الطالب';
                                return null;
                              },
                              text: 'اسم الطالب',
                            ),

                            SizedBox(height: 20.h,),
                            DefaultTextFormField(
                              context: context,
                              color: Colors.white,
                              controller: nationalIdController,
                              verticalPadding: verticalPaddingOfAuthenticationTFF,
                              horizontalPadding: horizontalPaddingOfAuthenticationTFF,
                              suffixIconPressed: (){

                              },
                              validator: (value){
                                if(value!.isEmpty) return 'Enter your password';
                                return null;
                              },
                              text: 'الرقم القومي',
                            ),

                            SizedBox(height: 20.h,),
                            DefaultTextFormField(
                              context: context,
                              color: Colors.white,
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
                            ),

                            SizedBox(height: 20.h,),
                            DefaultTextFormField(
                              context: context,
                              color: Colors.white,
                              controller: ensurePasswordController,
                              verticalPadding: verticalPaddingOfAuthenticationTFF,
                              horizontalPadding: horizontalPaddingOfAuthenticationTFF,
                              suffixIconPressed: (){

                              },
                              validator: (value){
                                if(value!.isEmpty) return 'Enter your password';
                                return null;
                              },
                              text: 'تأكيد كلمة المرور',
                            ),

                            SizedBox(height: 30.0.h,),


                            customButton(
                              text: 'انشاء حساب',
                              color: Colors.white,
                              elevation: 0.1,
                              fontSize: 17,
                              textColor: Colors.black,
                              height: getHeight(53, context),
                              radius: 10,
                              function: (){
                                navigateTo(context, OTPScreen());
                              } ,
                            ),

                            Align(
                              alignment: Alignment.topRight,
                              child: customTextButton(
                                  text: 'تسجيل الدخول',
                                  fontSize: 16.sp,
                                  textColor: Colors.white,
                                  onPressed: (){
                                    Navigator.pop(context);
                                  }
                              ),
                            ),
                            SizedBox(height: 30.0.h,),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.0.h,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


