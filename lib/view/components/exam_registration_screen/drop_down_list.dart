import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/style/color_manger.dart';
import '../../../core/resources/constants.dart';

class DropDownItem extends StatelessWidget {
  DropDownItem({Key? key, required this.header, this.isDiscount=false, required this.values}) : super(key: key);
  List<String>values;
  String header;
  bool isDiscount=false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              header,
              style: TextStyle(
                color: AppColors.darkTitlesColor,
                fontFamily: fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            if(isDiscount)
              Text(
                ')اختياري(',
                style: TextStyle(
                  color: AppColors.descriptionColor,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp,
                ),
              ),
          ],
        ),
        SizedBox(height: 4.0.h,),
        Container(
          width: double.infinity,
          height: 36.h,
          padding: EdgeInsets.symmetric(horizontal: 12.0.w,),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(color: AppColors.grayBorderColor,width: 1.0),
          ),
          child: DropdownButton(
            underline:const SizedBox(),

            isExpanded: true,
            value: values[0],
            style: TextStyle(
              fontSize: 14.0.sp,
              fontFamily: fontFamily,
              fontWeight: FontWeight.w500,
              color: AppColors.grayBorderColor,
            ),
            borderRadius: BorderRadius.circular(12.0),
            // Down Arrow Icon
            icon: Icon(Icons.arrow_drop_down,size: 26.w,),
            items: values.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (newValue) {},
          ),
        ),
      ],
    );
  }
}
