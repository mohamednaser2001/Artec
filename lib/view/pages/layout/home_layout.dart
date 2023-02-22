
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/resources/style/color_manger.dart';
import '../../../core/resources/constants.dart';
import '../../../view_model/blocs/app_cubit/cubit.dart';
import '../../../view_model/blocs/app_cubit/states.dart';




class HomeLayout  extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){},
        builder: (context, state){
          AppCubit cubit =AppCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                cubit.changeBottomNavBarIndex(index);
              },
              elevation: 5,
              iconSize: 32.w,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              currentIndex: cubit.currentIndex,
              unselectedItemColor: Colors.grey[400],
              selectedItemColor: Colors.black,
              selectedIconTheme:const IconThemeData(
                shadows:[
                  BoxShadow(
                    color: Colors.grey,  //color of shadow
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(2, 0),
                  ),
                ],
              ),
              items: cubit.bottomNavBarItems,
            ),

          );
        },
      ),
    );
  }
}

