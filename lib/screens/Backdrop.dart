import 'package:flutter/material.dart';

class Backdrop extends StatelessWidget {
  const Backdrop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 25),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "₱",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                "25,000.00",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ]),
            Row(
              children: [
                Text("Your total balance",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey[200],
                ),)
              ],
            )
          ],
        ),
      ],
    );
  }
}
