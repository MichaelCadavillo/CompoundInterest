import 'package:flutter/material.dart';

class BorderTransition {
  Function(void) callback;

  BorderTransition(this.callback);

  void removeBorderRadius()  {
    print("removeBorderRadius called!");
    BorderRadius _newBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(0),
      topRight: Radius.circular(0),
    );
    callback(_newBorderRadius);
  }

  void addBorderRadius()  {
    print("addBorderRadius called!");
    BorderRadius _newBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(50),
      topRight: Radius.circular(50),
    );
    callback(_newBorderRadius);
  }

  void transitionBorderRadius(double pos)  {
    BorderRadius _newBorderRadius = BorderRadius.only(
      topLeft: Radius.circular((pos==0)?10:pos*50),
      topRight: Radius.circular((pos==0)?10:pos*50),
    );
    callback(_newBorderRadius);
  }
}