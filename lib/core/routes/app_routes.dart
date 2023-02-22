
import 'package:flutter/material.dart';
import '../../view/pages/layout/home_layout.dart';

class AppRoutes{
  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case 'login':
        return MaterialPageRoute(builder: (_)=>const HomeLayout(),);
      case 'register':
        return MaterialPageRoute(builder: (_)=>const HomeLayout(),);
      case '/':
        return MaterialPageRoute(builder: (_)=>const HomeLayout(),);
    }
  }
}
