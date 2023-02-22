import 'package:artech/view/pages/exam_registration/user_information_pages/user_image_page.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../view_model/blocs/app_cubit/cubit.dart';
import '../../../../view_model/blocs/app_cubit/states.dart';
import 'information_page.dart';

class UserInformationPage extends StatelessWidget {
  UserInformationPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state)=> SingleChildScrollView(
        child: ConditionalBuilder(
          condition: AppCubit.get(context).isInformationPage,
          builder:(context)=> UserInformation(),
          fallback: (context)=> const UserImage(),
        ),
      ),
    );
  }
}
