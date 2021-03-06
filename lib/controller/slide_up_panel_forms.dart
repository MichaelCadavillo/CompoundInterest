import 'package:compounding_interest/screens/library.dart';
import 'package:flutter/material.dart';

Form formField(
    {String labelText, String hintText, @required GlobalKey formkey}) {
  return Form(
    key: formkey,
    child: TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(Icons.bar_chart),
        hintText: hintText,
        labelText: labelText,
      ),
      onSaved: (String value) {},
      validator: (value) {
        print("Validator called");
        if (value.isEmpty) {
          return 'Please enter a number.';
        }
        return null;
      },
    ),
  );
}

Form percentFormField(
    {String labelText, String hintText, @required GlobalKey formkey}) {
  return Form(
    key: formkey,
    child: TextFormField(
      textAlign: TextAlign.end,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(Icons.bar_chart),
        suffix: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "%",
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
        ),
        hintText: hintText,
        labelText: labelText,
      ),
      onSaved: (String value) {},
      validator: (value) {
        print("Validator called");
        if (value.isEmpty) {
          return 'Please enter a number.';
        }
        return null;
      },
    ),
  );
}

calculateButton(widget, BuildContext context) {
  final _initialAmount = widget.keyList["initialAmount"];
  final _interestRate = widget.keyList["interestRate"];
  final _interestRateDropdown = widget.keyList["interestRateDropdown"];
  final _duration = widget.keyList["duration"];

  if (_initialAmount.currentState.validate() &&
      _interestRate.currentState.validate() &&
      _interestRateDropdown.currentState.validate() &&
      _duration.currentState.validate()) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Processing Data')));
  }
  return null;
}
