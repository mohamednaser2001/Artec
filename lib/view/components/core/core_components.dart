
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/style/color_manger.dart';
import '../../../core/resources/constants.dart';



Widget line({Color color= Colors.grey, double width=double.infinity})=>Container(
  height: 1.0,color: color, width: width,
);



Future<dynamic> navigateWithoutBack(context,Widget widget)=>Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (context)=>widget),
        (route) => false
);


Future<dynamic> navigateTo(context,Widget widget)=>Navigator.push(context,
  MaterialPageRoute(builder: (context)=>widget),
);


Widget DefaultTextFormField({
  required TextEditingController controller,
  required String ?validator(String ? str),
  Widget ? icon,
  Widget ? prefixIcon,
  String ? text,
  Color color =AppColors.textFieldBackground,
  bool withBorder =true,
  bool isDescription =false,
  bool isPassword =false,
  bool isSecured =false,
  double radius=100,
  bool isEnabled=true,
  Color hintColor =const Color(0xffA0A0A0),
  double hintSize =22,
  Color enabledBorderColor = AppColors.grayBorderColor,
  Color focusBorderColor = AppColors.primaryColor,
  required context,
  Function ? suffixIconPressed,
  double verticalPadding=0,
  double horizontalPadding=0,
  TextInputType inputType =TextInputType.text,
})=>Container(
  //height: height.h,
  alignment: Alignment.bottomCenter,
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
  ),
  child: Center(
    child: TextFormField(
      enabled:isEnabled ? true: false,
      controller: controller,
      textAlignVertical: TextAlignVertical.bottom,
      validator: validator,
      maxLines:isDescription ? 7:1,
      obscureText:isSecured ? true: false,
      keyboardType: inputType,
      decoration: InputDecoration(
        isDense: true,
        hintText: text,
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: hintSize.sp,
          fontFamily: fontFamily,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: verticalPadding.h,horizontal: horizontalPadding.w),
        prefixIcon:prefixIcon==null ? null : prefixIcon, ///  /// /// ///
        prefixIconConstraints: BoxConstraints(maxHeight: 30.h,minWidth: 32.w),
        suffixIcon:icon==null ? null : icon,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(radius)),
                borderSide: BorderSide(color: withBorder ? focusBorderColor : Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(radius)),
                borderSide: BorderSide(color:withBorder ? enabledBorderColor : color),
        ),
      ),
    ),
  ),
);




Widget customTextButton({
  required String text,
  required Function onPressed,
  double fontSize=16,
  bool withUnderLine =false,
  Color textColor=AppColors.primaryColor,
  IconData? icon=null ,
})=>TextButton(
  style: ButtonStyle(foregroundColor : MaterialStateProperty.all<Color>(textColor)),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        text,
        style: TextStyle(
          fontFamily: fontFamily,
          decoration: withUnderLine ? TextDecoration.underline : TextDecoration.none,
          color: textColor,
          fontSize: fontSize.sp,
        ),
      ),
      if(icon!=null)
        Icon(icon, size: 16.sp,),
    ],
  ),
  onPressed: (){
    onPressed();
  },
);


Widget customButton({
  required String text,
  required Function function,
  Color color =AppColors.primaryColor,
  Color iconColor =Colors.black,
  Color textColor = Colors.white,
  bool withBorder=false,
  double radius=50,
  double height=52,
  double fontSize=18,
  double width=double.infinity,
  IconData? icon,
  IconData? suffixIcon,
  double elevation=2,
})=>MaterialButton(
  elevation: elevation,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(radius),
    side:withBorder ? BorderSide(width: 2.0,color: AppColors.primaryColor) : BorderSide.none,
  ),
  color: color,
  height:height,
  minWidth:width,
  child: Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      if(icon!=null)
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Icon(icon, color: iconColor.withOpacity(0.7),size: 20,),
        ),
      SizedBox(width: 2.w,),
      Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
          fontSize: fontSize.sp,
        ),
      ),
      if(suffixIcon!=null)
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Icon(suffixIcon, color: iconColor.withOpacity(0.7),size: 20,),
        ),
    ],
  ),
  onPressed: (){
  function();
  },
);












