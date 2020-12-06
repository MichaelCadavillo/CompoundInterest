import 'package:flutter/material.dart';

class PanelBorderTransition {
  BorderRadius _currentRadius;
  static final double minRadius = 15;
  static final double maxRadius = 45;
  Function(void) callback;

  PanelBorderTransition(this.callback, [this._currentRadius]);

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
      topLeft: Radius.circular(maxRadius),
      topRight: Radius.circular(maxRadius),
    );
    callback(_newBorderRadius);
  }

  void transitionBorderRadius(double pos)  {
    BorderRadius _newBorderRadius = BorderRadius.only(
      topLeft: Radius.circular((pos<0.15)?minRadius:pos * maxRadius),
      topRight: Radius.circular((pos<0.15)?minRadius:pos * maxRadius),
    );
    callback(_newBorderRadius);
  }
}