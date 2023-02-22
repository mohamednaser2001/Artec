import 'dart:io';
import 'dart:async';
import 'package:artech/core/resources/app_timer.dart';
import 'package:artech/view/pages/profile/profile_screen.dart';
import 'package:artech/view_model/blocs/app_cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/resources/constants.dart';
import '../../../model/college_model.dart';
import '../../../model/question_model.dart';
import '../../../view/components/exams/finish_exam_dialog.dart';
import '../../../view/pages/exams/drawing_area_screen.dart';
import '../../../view/pages/home/home_screen.dart';
import '../../../view/pages/notifications_screen.dart';



class AppCubit extends Cubit<AppStates>{

  AppCubit():super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);

  List<BottomNavigationBarItem> bottomNavBarItems=[
    BottomNavigationBarItem(icon: Icon(Icons.home_rounded),label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.email_rounded),label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.person),label: ''),
  ];

  List<Widget> screens=[
    HomeScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  int currentIndex=0;
  void changeBottomNavBarIndex(int index){
    currentIndex=index;
    emit(AppChangeBottomNavBarIndexState());
  }




  List<CollegeModel> departments=[
    CollegeModel(image: '$imagePath/images/offer3.jpg', name: 'قسم النحت'),
    CollegeModel(image: '$imagePath/images/offer3.jpg', name: 'قسم الديكور'),
    CollegeModel(image: '$imagePath/images/offer3.jpg', name: 'قسم العمارة'),
    CollegeModel(image: '$imagePath/images/offer3.jpg', name: 'قسم التصوير'),
    CollegeModel(image: '$imagePath/images/offer3.jpg', name: 'قسم الجرافيك'),
  ];


  List<CollegeModel> homeMenu=[
    CollegeModel( image: '$imagePath/icons/home1.svg', name: 'البيانات الشخصية'),
    CollegeModel( image: '$imagePath/icons/home2.svg', name: 'تسجيل اختبار القدرات'),
    CollegeModel( image: '$imagePath/icons/home3.svg', name: 'بدأ اختبار القدرات'),
    CollegeModel( image: '$imagePath/icons/home4.svg', name: 'نتائج الاختبار'),
    CollegeModel( image: '$imagePath/icons/home5.svg', name: 'حجز الكورسات'),
    CollegeModel( image: '$imagePath/icons/home6.svg', name: 'الامتحان التجريبي'),
  ];


  int mcqRegistrationPageNumber=0;
  void changeMCQRegistrationPageNumber(int index){
    mcqRegistrationPageNumber= index;
    emit(AppChangeMCQRegistrationPageNumberState());
  }


  /// this method to toggle between courses pages in courses registration.
  bool isAllCourses=true;
  void toggleCoursesPage(bool value){
    isAllCourses=value;
    emit(AppToggleCoursesPageState());
  }


  /// this method to toggle between payment methods.
  bool isFawry=true;
  void togglePaymentMethods(bool value){
    isFawry=value;
    emit(AppTogglePaymentMethodsState());
  }


  /// if the user enter the exam the value will be true
  /// then he will not enter again.
  bool isMCQExamDone=false;
  void exitMCQExam(){
    isMCQExamDone=true;
  }

  bool isArtisticExamDone=false;
  void exitArtisticExam(){
    isArtisticExamDone=true;
  }

  bool isDrawingExamExamDone=false;
  void exitDrawingExam(){
    isDrawingExamExamDone=true;
  }

  List<QuestionModel> mcqQuestions=[
    QuestionModel(
      question: 'ماهي عاصمة مصر',
      answers: [
        'cairo',
        'toukh',
        'banha',
        'aswan',
      ],
    ),
    QuestionModel(
      question: 'ماهي عاصمة فلسطين',
      answers: [
        'cairo',
        'qalyubia',
        'qena',
        'cairo',
      ],
    ),
    QuestionModel(
      question: 'ماهي عاصمة لبنان',
      answers: [
        'cairo',
        'qalyubia',
        'qena',
        'aswan',
      ],
    ),
    QuestionModel(
      question: 'هل القاهرة عاصمة لبنان',
      answers: [
        'صح',
        'خطأ',
      ],
    ),
    QuestionModel(
      question: 'هل القاهرة عاصمة لبنان',
      answers: [
        'صح',
        'خطأ',
      ],
    ),
    QuestionModel(
      question: 'ماهي عاصمة فلسطين',
      answers: [
        'cairo',
        'qalyubia',
        'qena',
        'cairo',
      ],
    ),
    QuestionModel(
      question: 'ماهي عاصمة لبنان',
      answers: [
        'cairo',
        'qalyubia',
        'qena',
        'aswan',
      ],
    ),
  ];

  /// list of answers of the MCQ exam
  List<int> answerNumbers=[0,1,3,1,0,1,0];

  /// when the user select an answer this method is called and update the answer.
  void changeAnswer(int index, int answerNumber){
    answerNumbers[index]= answerNumber;
    emit(AppChangeAnswerNumberState());
  }

  int mcqExamPageNumber=0;
  void changeMCQExamPageNumber(int index){
    mcqExamPageNumber=index;
    emit(AppChangeMCQExamPageNumberState());
  }




  /// method to upload the user image when he register to the exam.
  File? artisticExamImage;
  var picker = ImagePicker();
  void pickArtisticExamImage(context) async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      artisticExamImage = File(pickedFile.path);
      emit(ArtisticExamImagePickedSuccess());
    } else {
      emit(ArtisticExamImagePickedError());
    }
  }

  void deleteArtisticExamImage(){
    artisticExamImage=null;
    emit(DeleteArtisticExamImageState());
  }


  File? userImage;
  void pickUserImage(context) async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      userImage = File(pickedFile.path);
      emit(UserImagePickedSuccess());
    } else {
      emit(UserImagePickedError());
    }
  }



  late Timer timer ;
  String remainingTime= '50:${DateTime.now().second}';
  void startTimer({
    context,
    required int time,
  }){
    timer= Timer.periodic(const Duration(seconds: 1), (timer) {
      if (DateTime.now().second == 0) {
        if(time==0){
          timer.cancel();
          finishExamDialog(
            context: context,
            function: (){
              Navigator.pop(context);
              Navigator.pop(context);
            },
          );
        }
        time--;
      }
      remainingTime= '$time:${60-DateTime.now().second}';

      emit(AppChangeTimeState());
    });
  }

  void endTimer(){
    timer.cancel();
  }


  /// pagination page
   int cIndex=0;
  void changePagination(int i){
    cIndex=i;
    emit(AppChangeAnswerNumberState());
  }

  bool isInformationPage= true;
  void changeUserInformationPage(){
    isInformationPage=!isInformationPage;
    emit(ChangeUserInformationPageState());
  }



/*
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  int direction = 0;

  // @override
  // void initState() {
  //   startCamera(direction);
  //   super.initState();
  // }

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

  */

}

