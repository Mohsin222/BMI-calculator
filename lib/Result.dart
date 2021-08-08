import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/utilities/constant.dart';
import 'package:my_bmi_calculator/widget/BigButton.dart';

class Result extends StatefulWidget {
  Result(
      {required this.resultText, required this.message, required this.result});
  final String resultText;
  final String result;
  final String message;

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Result',
            style: TextStyle(fontFamily: 'Pacifico', fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff111539),
        ),
        backgroundColor: Color(0xff0a0d22),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(left: 40, top: 30),
              child: Text(
                "Your Result",
                style: ResultHeading,
              ),
            ),
            Expanded(
              child: Container(
                margin:
                    EdgeInsets.only(left: 40, right: 40, top: 25, bottom: 20),
                // color: Colors.red,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFF1d1f33)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.resultText,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Staatliches'),
                    ),
                    Text(
                      widget.result,
                      style: bigText,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.message,
                        style: resultPageMessage,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: BigButton(
                btnText: 'Re Calculate',
              ),
            )
          ],
        ));
  }
}
