import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/constants.dart';
import '../../../../view_model/blocs/app_cubit/cubit.dart';
import '../../../components/core/core_components.dart';

class UserInformation extends StatelessWidget {
  UserInformation({Key? key}) : super(key: key);
  var nationalIdController = TextEditingController();
  var numberController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'معلومات عن الطالب',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24.sp,
            fontFamily: fontFamily,
          ),
        ),

        SizedBox(height: 10.0.h,),
        DefaultTextFormField(
          context: context,
          controller: nameController,
          radius: 6,
          hintColor: Colors.black.withOpacity(0.7),
          inputType: TextInputType.text,
          verticalPadding: verticalPaddingOfAuthenticationTFF,
          horizontalPadding: horizontalPaddingOfAuthenticationTFF,
          color: Colors.white,
          validator: (value){},
          text: 'اسم الطالب',
        ),

        SizedBox(height: 20.h,),
        DefaultTextFormField(
          context: context,
          color: Colors.white,
          radius: 6,
          inputType: TextInputType.number,
          hintColor: Colors.black.withOpacity(0.7),
          controller: nationalIdController,
          verticalPadding: verticalPaddingOfAuthenticationTFF,
          horizontalPadding: horizontalPaddingOfAuthenticationTFF,
          validator: (value){},
          text: 'الرقم القومي',
        ),

        SizedBox(height: 20.h,),
        DefaultTextFormField(
          context: context,
          color: Colors.white,
          radius: 6,
          inputType: TextInputType.number,
          hintColor: Colors.black.withOpacity(0.7),
          controller: numberController,
          verticalPadding: verticalPaddingOfAuthenticationTFF,
          horizontalPadding: horizontalPaddingOfAuthenticationTFF,
          suffixIconPressed: (){},
          validator: (value){

          },
          text: 'رقم الجلوس',
        ),

        SizedBox(height: 20.h,),
        DefaultTextFormField(
          context: context,
          color: Colors.white,
          radius: 6,
          inputType: TextInputType.text,
          hintColor: Colors.black.withOpacity(0.7),
          controller: departmentController,
          verticalPadding: verticalPaddingOfAuthenticationTFF,
          horizontalPadding: horizontalPaddingOfAuthenticationTFF,
          validator: (value){},
          text: 'الشعبة',
        ),

        SizedBox(height: 20.h,),
        InkWell(
          onTap: (){
            AppCubit.get(context).changeUserInformationPage();
          },
          child: Container(
            height: 44.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'اضافة صورة شخصية',
                  style: TextStyle(
                    fontSize: 19.sp,
                    color: Colors.black.withOpacity(0.7),
                    fontFamily: fontFamily,
                  ),
                ),
                CircleAvatar(
                  radius: 13.w,
                  backgroundColor: Colors.black,
                  child: const Icon(Icons.add, color: Colors.white,),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 20.h,),
        DefaultTextFormField(
          context: context,
          color: Colors.white,
          radius: 6,
          inputType: TextInputType.number,
          hintColor: Colors.black.withOpacity(0.7),
          controller: phoneController,
          verticalPadding: verticalPaddingOfAuthenticationTFF,
          horizontalPadding: horizontalPaddingOfAuthenticationTFF,
          suffixIconPressed: (){

          },
          validator: (value){

          },
          text: 'رقم الهاتف',
        ),
        SizedBox(height: MediaQuery.of(context).size.height*.25.h,),
      ],
    );
  }
}
