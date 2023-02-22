
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_states.dart';

class LoginCubit extends Cubit <LoginStates>{
  LoginCubit():super(LoginInitialState());


  static LoginCubit get(context)=> BlocProvider.of(context);


  bool isActive=false;
  void changeRadioButton(){
    isActive=!isActive;
    emit(ChangeRadioButtonState());
  }




}