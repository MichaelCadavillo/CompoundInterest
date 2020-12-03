import 'package:flutter/material.dart';

class Backdrop extends StatelessWidget {
  const Backdrop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).size.height * 0.08),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(children: [
            SizedBox(width: 25),
             Text(
              "₱",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Text(
              "25,000",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ]),
        )
      ],
    );
  }
}
