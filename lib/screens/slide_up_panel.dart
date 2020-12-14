import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'backdrop.dart';
import 'transitions/panelborder_transition.dart';
import '../controller/slide_up_panel_forms.dart';

class SlideUpPanel extends StatefulWidget {
  final Function(double pos) notifyParent;
  final Map<String, GlobalKey<FormState>> keyList;

  const SlideUpPanel(
      {Key key,
      @required this.notifyParent(double pos),
      @required this.keyList})
      : super(key: key);

  @override
  _SlideUpPanelState createState() => _SlideUpPanelState();
}

class _SlideUpPanelState extends State<SlideUpPanel> {
  static var _defaultPanelState = PanelState.OPEN;
  static List<String> _interestRateFrequency = ['Annually', 'Monthly'];
  static List<String> _savingsDuration = ['Years', 'Months'];
  String _selectedInterestRateFrequency = _interestRateFrequency[1];
  String _selectedSavingsDuration = _savingsDuration[1];

  BorderRadius _borderRadius = BorderRadius.only(
    topLeft: Radius.circular((_defaultPanelState == PanelState.OPEN)
        ? PanelBorderTransition.maxRadius
        : PanelBorderTransition.minRadius),
    topRight: Radius.circular((_defaultPanelState == PanelState.OPEN)
        ? PanelBorderTransition.maxRadius
        : PanelBorderTransition.minRadius),
  );

  callback(borderRadius) {
    setState(() {
      this._borderRadius = borderRadius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        defaultPanelState: _defaultPanelState,
        onPanelSlide: (double pos) {
          PanelBorderTransition(callback).transitionBorderRadius(pos);
          //FadeFABIcon(callback).fade(pos);
          widget.notifyParent(pos);
        },
        maxHeight: MediaQuery.of(context).size.width * 1.30,
        borderRadius: _borderRadius,
        panel: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
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
            formField(
                formkey: widget.keyList["initialAmount"],
                labelText: "Initial Amount: "),
            Row(
              children: [
                Flexible(
                  child: percentFormField(
                      formkey: widget.keyList["interestRate"],
                      labelText: "Interest Rate: "),
                  flex: 2,
                ),
                Flexible(
                  child: Form(
                    key: widget.keyList["interestRateDropdown"],
                    child: DropdownButton<String>(
                        itemHeight: 80,
                        isExpanded: true,
                        items: _interestRateFrequency.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                              padding: EdgeInsets.only(top: 15),
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(value)),
                            ),
                          );
                        }).toList(),
                        value: _selectedInterestRateFrequency,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedInterestRateFrequency = newValue;
                          });
                        }),
                  ),
                  flex: 1,
                ),
              ],
            ),
            formField(
                formkey: widget.keyList["duration"], labelText: "Duration: "),
          ]),
        ),
        body: Backdrop());
  }
}

class CalculateFAB extends StatefulWidget {
  final Map<String, GlobalKey<FormState>> keyList;
  final double fabVisibility;
  CalculateFAB({Key key, @required this.fabVisibility, @required this.keyList})
      : super(key: key);

  @override
  _CalculateFABState createState() => _CalculateFABState();
}

class _CalculateFABState extends State<CalculateFAB> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.fabVisibility,
      child: FloatingActionButton.extended(
        label: Text("Calculate", overflow: TextOverflow.clip, maxLines: 1),
        //onPressed: calculateFABOnPressed(),
        onPressed: () => calculateButton(widget, context),
      ),
    );
  }
}
