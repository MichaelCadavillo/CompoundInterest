import 'package:flutter/material.dart';
import 'screens/slide_up_panel.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static double fabVisibility = 1.0;
  final _initialAmountKey = GlobalKey<FormState>();
  final _interestRateKey = GlobalKey<FormState>();
  final _interestRateDropdownKey = GlobalKey<FormState>();
  final _durationKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _keyList = {
      "initialAmount" : _initialAmountKey, 
      "interestRate" : _interestRateKey, 
      "interestRateDropdown" : _interestRateDropdownKey, 
      "duration" : _durationKey
    };

    return Scaffold(
        drawer: Drawer(
          child: ListView(
              children: ListTile.divideTiles(context: context, tiles: [
            ListTile(
              title: Text("Investment Tracker"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Compounding Interest Calculator"),
              onTap: () {},
            ),
          ]).toList()),
        ),
        appBar: AppBar(
          elevation: 0,
          title: Text("Interest Calculator",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.blue,
        body: SlideUpPanel(notifyParent: callback, keyList: _keyList),
        floatingActionButton: (_MyHomePageState.fabVisibility != 0)? CalculateFAB(keyList: _keyList, fabVisibility : _MyHomePageState.fabVisibility) : Container()
    );
  }

  callback(double pos){
    setState(() {
      _MyHomePageState.fabVisibility = pos;
    });
  }
}
