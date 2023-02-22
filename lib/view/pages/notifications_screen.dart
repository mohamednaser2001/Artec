import 'package:artech/view/components/core/default_app_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/resources/style/color_manger.dart';
import '../../core/resources/constants.dart';
import '../components/core/core_components.dart';
import '../components/notifications_screen/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'الاشعارات',
        withLeadingButton: true,
        leadingFunction: (){},
      ),

      body: ConditionalBuilder(
        condition: 1>0,
        builder: (context)=>ListView.separated(
          itemBuilder: (context, index)=>NotificationItem(index: index),
          separatorBuilder: (context, index)=>line(),
          itemCount: 5,
        ),
        fallback: (context)=>Center(
          child: Text(
            'لا توجد اشعارات حالياا',
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: fontFamily,
              fontWeight: FontWeight.bold,
              color: AppColors.descriptionColor,
            ),
          ),
        ),
      ),
    );
  }
}


