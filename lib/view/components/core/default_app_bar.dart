import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/resources/style/color_manger.dart';
import '../../../core/resources/constants.dart';
import 'core_components.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{

  Function leadingFunction;
  Function? drawerFunction;
  String title;
  bool withDrawer;
  bool withLeadingButton;
  Color appBarColor;

   DefaultAppBar({Key? key,
     required this.title,
     this.withDrawer=false,
     this.withLeadingButton=false,
     required this.leadingFunction,
     this.appBarColor=Colors.transparent,
     this.drawerFunction,
   }) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: appBarColor,
      centerTitle: true,
      leading: null,
      /*
      withDrawer==true ? IconButton(
          icon: SvgPicture.asset('$imagePath/icons/drawer_icon.svg'),
        onPressed: (){
            drawerFunction!();
        },
      ) : null,
      */
      title: Text(
        title,
        style: TextStyle(
          fontSize: 28.sp,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontFamily: fontFamily,
        ),
      ),
      actions: [
        if(withLeadingButton==true)
          IconButton(
            padding: EdgeInsets.all(10.w),
              onPressed: (){leadingFunction();},
              icon: SvgPicture.asset('$imagePath/icons/arrow_left.svg')),
      ],
    );
  }



  @override
  final Size preferredSize;
}
