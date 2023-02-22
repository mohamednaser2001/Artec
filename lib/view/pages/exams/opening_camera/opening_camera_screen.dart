import 'package:artech/core/methods/get_width_and%20_height.dart';
import 'package:artech/view/components/core/core_components.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/resources/style/color_manger.dart';
import '../../../../view_model/blocs/app_cubit/cubit.dart';
import '../../../../view_model/blocs/app_cubit/states.dart';
import '../../../components/core/default_app_bar.dart';
import '../artistic_exam_screen.dart';
import '../drawing_area_screen.dart';
import '../mcq_exam_screen.dart';


class OpeningCameraScreen extends StatefulWidget {
  const OpeningCameraScreen({Key? key}) : super(key: key);

  @override
  State<OpeningCameraScreen> createState() => _OpeningCameraScreenState();
}

class _OpeningCameraScreenState extends State<OpeningCameraScreen> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  int direction = 0;

  @override
  void initState() {
    startCamera(direction);
    super.initState();
  }

  void startCamera(int direction) async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController.initialize().then((value) {
      if(!mounted) {
        return;
      }
      setState(() {}); //To refresh widget
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(cameraController.value.isInitialized) {
      return Scaffold(
        appBar: DefaultAppBar(
          title: '',
          withLeadingButton: true,
          leadingFunction: (){
            Navigator.pop(context);
          },
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: getWidth(27, context),
                    backgroundColor: Colors.white,
                    child: Image.asset('$imagePath/icons/clock.png',),
                  ),
                  CircleAvatar(
                    radius: getWidth(27, context),
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset('$imagePath/icons/video_icon.svg',),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        direction = direction == 0 ? 1 : 0;
                        startCamera(direction);
                      });
                    },
                    child: CircleAvatar(
                      radius: getWidth(27, context),
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset('$imagePath/icons/camera_icon.svg',),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
                height: MediaQuery.of(context).size.height*0.5,
                width: double.infinity,
                child: CameraPreview(cameraController)),


            customButton(
              text: 'بدأ الامتحان',
              color: Colors.white,
              elevation: 0.0,
              textColor: Colors.black,
              radius: 16,
              withBorder: true,
              width: getWidth(232, context),
              height: getWidth(72, context),
              function: (){
                Navigator.pop(context);
                selectExamType(context: context, );
              },
            ),

            SizedBox(height: 6.h,),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

}




Future<dynamic> selectExamType({
  required context,
}) => showDialog(
  context: context,
  builder: (context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      contentPadding: const EdgeInsets.all(0.0),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: getWidth(20, context),
                    child: SvgPicture.asset('$imagePath/icons/x_icon.svg', color: Colors.white,),
                  ),
                ),
                SizedBox(height: 10.h,),
                BlocConsumer<AppCubit, AppStates>(
                  listener: (context, state){},
                  builder: (context, state)=>  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: customButton(
                            text: 'اختيار\nمن متعدد',
                            height: getHeight(111, context),
                            radius: 6,
                            color: AppCubit.get(context).isMCQExamDone ? const Color(0xff788990) : AppColors.primaryColor,
                            fontSize: 12.sp,
                            textColor: Colors.black,
                            function: (){
                              if(!AppCubit.get(context).isMCQExamDone){
                                navigateTo(context, MCQExamScreen());
                                AppCubit.get(context).startTimer(context: context, time: 2);
                                AppCubit.get(context).exitMCQExam();
                              }
                            }
                        ),
                      ),
                      SizedBox(width: 8.w,),
                      Expanded(
                        child: customButton(
                            text: 'التصميم\nالزخرفي',
                            height: getHeight(111, context),
                            radius: 6,
                            fontSize: 12.sp,
                            color: AppCubit.get(context).isDrawingExamExamDone ? const Color(0xff788990) : AppColors.primaryColor,
                            textColor: Colors.black,
                            function: (){
                              if(!AppCubit.get(context).isDrawingExamExamDone){
                                navigateTo(context, DrawingAreaScreen());
                                AppCubit.get(context).startTimer(context: context, time: 1);
                                AppCubit.get(context).exitDrawingExam();
                              }
                            }
                        ),
                      ),
                      SizedBox(width: 8.w,),
                      Expanded(
                        child: customButton(
                            text: 'التعبير\nالفني',
                            height: getHeight(111, context),
                            radius: 6,
                            color: AppCubit.get(context).isArtisticExamDone ? const Color(0xff788990) : AppColors.primaryColor,
                            fontSize: 12.sp,
                            textColor: Colors.black,
                            function: (){
                              if(!AppCubit.get(context).isArtisticExamDone){
                                navigateTo(context, const ArtisticExamScreen());
                                AppCubit.get(context).startTimer(context: context, time: 1);
                                AppCubit.get(context).exitArtisticExam();
                              }
                            }
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h,),
              ],
            ),
          ),
        ],
      ),
    );
  },
);