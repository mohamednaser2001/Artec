import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/constants.dart';
import '../../../components/core/core_components.dart';

class CreditPage extends StatelessWidget {
  CreditPage({Key? key}) : super(key: key);
  var idController = TextEditingController();
  var expiryDateController = TextEditingController();
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h,),
          Text(
            'رقم البطاقة',
            style: TextStyle(
              fontSize: 20,
              fontFamily: fontFamily,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          DefaultTextFormField(
            context: context,
            color: Colors.white,
            radius: 6,
            prefixIcon: Padding(
              padding: EdgeInsets.all(5.0.w),
              child: SvgPicture.asset('$imagePath/icons/payment_icon.svg'),
            ),
            inputType: TextInputType.number,
            hintColor: Colors.grey,
            controller: idController,
            verticalPadding: 6.h,
            horizontalPadding: horizontalPaddingOfAuthenticationTFF,
            validator: (value){},
            text: '**** **** **** ****',
          ),

          SizedBox(height: 16.h,),
          Text(
            'سارية حتى',
            style: TextStyle(
              fontSize: 20,
              fontFamily: fontFamily,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          DefaultTextFormField(
            context: context,
            controller: expiryDateController,
            radius: 6,
            hintColor: Colors.grey,
            inputType: TextInputType.number,
            verticalPadding: 4.h,
            horizontalPadding: horizontalPaddingOfAuthenticationTFF,
            color: Colors.white,
            validator: (value){},
            text: 'شهر/سنة',
          ),

          SizedBox(height: 16.h,),
          Text(
            'حامل البطاقة',
            style: TextStyle(
              fontSize: 20,
              fontFamily: fontFamily,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          DefaultTextFormField(
            context: context,
            controller: nameController,
            radius: 6,
            hintColor: Colors.grey,
            inputType: TextInputType.text,
            verticalPadding: 4.h,
            horizontalPadding: horizontalPaddingOfAuthenticationTFF,
            color: Colors.white,
            validator: (value){

            },
            text: 'الاسم بالكامل',
          ),
        ],
      ),
    );
  }
}
