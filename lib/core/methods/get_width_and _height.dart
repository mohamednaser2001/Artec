

import 'package:flutter/material.dart';

/// this method will calculate the size of components by passing the size of
/// the component in the ui design and return the width of the component in the app.

double getWidth(double designWidth, context) {
  Size size = MediaQuery.of(context).size;
  return (designWidth*size.width)/428;
}


/// return the height of the component
double getHeight(double designHeight, context) {
  Size size = MediaQuery.of(context).size;
  return (designHeight*size.height)/926;
}