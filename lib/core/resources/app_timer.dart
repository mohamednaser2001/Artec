

import 'dart:async';

import 'package:artech/view_model/blocs/app_cubit/cubit.dart';
import 'package:flutter/material.dart';

class AppTimer{

  BuildContext context;
  static late Timer timer;
  static int time=50;
  AppTimer(this.context);

  static void startTimer(){
    timer =Timer.periodic(const Duration(seconds: 1), (timer) {
      if(DateTime.now().second==0){
        time--;
      }

      ('$time:${60-DateTime.now().second}');
    });

  }

  static void endTimer(){
    timer.cancel();
  }
}