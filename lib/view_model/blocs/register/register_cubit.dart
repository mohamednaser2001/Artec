
import 'package:artech/view_model/blocs/register/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterCubit extends Cubit <RegisterStates>{
  RegisterCubit():super(RegisterInitialState());


  static RegisterCubit get(context)=> BlocProvider.of(context);


  List<String> accountType=['individual','company'];
  late String currentOption=accountType[0];
  void changeAccountType(String value){
    currentOption=value;
    emit(LoginChangeAccountTypeState());
  }


/*
  bool isShown = false;
  void changePassword(){
    isShown=!isShown;
    emit(OrangeAppRegisterChangeState());
  }
*/
}