import 'package:flutter/material.dart';

class BorderTransition {
  BorderRadius _currentRadius;
  Function(void) callback;

  BorderTransition(this.callback, this._currentRadius);

  BorderRadius removeBorderRadius()  {
    print("removeBorderRadius called!");
    BorderRadius _newBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(0),
      topRight: Radius.circular(0),
    );
    callback(_newBorderRadius);
  }

  BorderRadius addBorderRadius()  {
    print("addBorderRadius called!");
    BorderRadius _newBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(50),
      topRight: Radius.circular(50),
    );
    callback(_newBorderRadius);
  }
}