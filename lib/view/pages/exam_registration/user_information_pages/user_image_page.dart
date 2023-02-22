import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/methods/get_width_and _height.dart';
import '../../../../core/resources/constants.dart';
import '../../../../view_model/blocs/app_cubit/cubit.dart';
import '../../../../view_model/blocs/app_cubit/states.dart';
import '../../../components/core/core_components.dart';

class UserImage extends StatelessWidget {
  const UserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'اضافة صورة',
          style: TextStyle(
              fontFamily: fontFamily,
              fontSize: 24.sp,
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.bold
          ),
        ),

        SizedBox(height: 16.h),
        BlocConsumer<AppCubit, AppStates>(
          listener: (context, state){},
          builder: (context, state) {
            AppCubit cubit= AppCubit.get(context);

            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.42,
              margin: EdgeInsets.symmetric(horizontal: 14.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const[
                  BoxShadow(
                    color: Color(0xff13FF32),  //color of shadow
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(-3, -3),
                  ),
                  BoxShadow(
                    color: Color(0xff002BFF),  //color of shadow
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: getWidth(240, context).w,
                        height: getWidth(240, context).w,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration:const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: cubit.userImage!=null ? Image.file(cubit.userImage!, fit: BoxFit.cover,) : Image.asset('${imagePath}/images/user.png', ),
                      ),
                      Positioned(
                        bottom: 18.h,
                        right: 16.h,
                        child: InkWell(
                          onTap: (){
                            AppCubit.get(context).pickUserImage(context);
                          },
                          child: CircleAvatar(
                              radius: 18.w,
                              backgroundColor: Colors.black,
                              child: Icon(Icons.add, color: Colors.white,size: 20.w,)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),

        SizedBox(height: 20.h),
        customButton(
          text: 'حفظ',
          radius: 12,
          color: Colors.white,
          textColor: Colors.black,
          elevation: 0.0,
          width: getWidth(168, context),
          height: getWidth(56, context),
          function: (){
            AppCubit.get(context).changeUserInformationPage();
          },
        ),
      ],
    );
  }
}
