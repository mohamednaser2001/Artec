import 'package:artech/core/methods/get_width_and%20_height.dart';
import 'package:artech/view/pages/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/style/color_manger.dart';
import '../../../core/resources/constants.dart';
import '../../components/core/core_components.dart';
import '../../components/core/default_app_bar.dart';
import '../../components/profile_screen/setting_button.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'الصفحة الشخصية',
        withLeadingButton: true,
        leadingFunction: (){},
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: getWidth(77, context).w,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: getWidth(75, context).w,
                  backgroundImage: AssetImage('${imagePath}images/offer1.jpg',),
                ),
              ),
              SizedBox(height: 4.h,),
              Text(
                'محمد ناصر',
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 26.sp,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 16.h,),
              customButton(
                text: 'تعديل الصفحة',
                elevation: 0.0,
                textColor: Colors.black,
                color: Colors.white,
                width: MediaQuery.of(context).size.width*0.5,
                icon: Icons.arrow_back_ios,
                iconColor: Colors.black,
                function: (){
                  navigateTo(context, EditProfileScreen());
                },
              ),

              SizedBox(height: 16.h,),
              SettingButton(
                text: 'الاعدادات',
                icon: Icons.settings_outlined,
                function: (){

                },
              ),

              SettingButton(
                text: 'تسجيل الخروج',
                icon: Icons.logout_rounded,
                function: (){},
              ),
              SizedBox(height: 50.h,),
            ],
          ),
        ),
      ),
    );
  }
}


