import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'Backdrop.dart';
import 'transitions/PanelBorderTransition.dart';

class SlideUpPanel extends StatefulWidget {
  const SlideUpPanel({
    Key key,
  }) : super(key: key);

  @override
  _SlideUpPanelState createState() => _SlideUpPanelState();
}

class _SlideUpPanelState extends State<SlideUpPanel> {
  static var _defaultPanelState = PanelState.OPEN;
  BorderRadius _borderRadius = BorderRadius.only(
      topLeft: Radius.circular((_defaultPanelState==PanelState.OPEN)?PanelBorderTransition.maxRadius:PanelBorderTransition.minRadius),
      topRight: Radius.circular((_defaultPanelState==PanelState.OPEN)?PanelBorderTransition.maxRadius:PanelBorderTransition.minRadius),
    );

  callback(_borderRadius){
    setState(() {
      this._borderRadius = _borderRadius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      defaultPanelState: _defaultPanelState,
        onPanelSlide: (double pos) => {
          PanelBorderTransition(callback, _borderRadius).transitionBorderRadius(pos)
        },
        maxHeight: MediaQuery.of(context).size.width * 1.30,
        borderRadius: _borderRadius,
        panel: Column(children: <Widget>[
          SizedBox(height: 5),
          Divider(
            color: Colors.black12,
            thickness: 4,
            indent: 125,
            endIndent: 125,
          ),
          SizedBox(height: 50),
          Text("This is the sliding Widget"),
        ]),
        body: Backdrop());
  }
}
