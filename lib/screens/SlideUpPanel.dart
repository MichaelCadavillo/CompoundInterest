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

  callback(_borderRadius) {
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
        panel: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25
          ),
          child: Column(children: <Widget>[
            SizedBox(height: 5),
            Divider(
              color: Colors.black12,
              thickness: 4,
              indent: 125,
              endIndent: 125,
            ),
            SizedBox(height: 50),
            Text("This is the sliding Widget"),
            formField(labelText:"Principal Amount: "),
            formField(labelText:"Interest Rate P.A.: ", hintText: "In Percentage: x%")
          ]),
        ),
        body: Backdrop());
  }

  TextFormField formField({String labelText, String hintText}){
    return TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.bar_chart),
                hintText: hintText,
                labelText: labelText,
              ),
              onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String value) {
                return value.contains('@') ? 'Do not use the @ char.' : null;
              },
            );
  }
}
