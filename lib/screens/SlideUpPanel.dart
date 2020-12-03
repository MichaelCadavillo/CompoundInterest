import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'Backdrop.dart';
import 'transitions/BorderTransition.dart';

class SlideUpPanel extends StatefulWidget {
  const SlideUpPanel({
    Key key,
  }) : super(key: key);

  @override
  _SlideUpPanelState createState() => _SlideUpPanelState();
}

class _SlideUpPanelState extends State<SlideUpPanel> {
  BorderRadius _borderRadius = BorderRadius.only(
      topLeft: Radius.circular(50),
      topRight: Radius.circular(50),
    );

  callback(_borderRadius){
    setState(() {
      this._borderRadius = _borderRadius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        onPanelClosed: (){
          BorderTransition(callback, _borderRadius).removeBorderRadius();
        },
        onPanelOpened: (){
          BorderTransition(callback, _borderRadius).addBorderRadius();
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
