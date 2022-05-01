import 'package:bmi_calculator/ui/ReuseableCard.dart';
import 'package:bmi_calculator/ui/bmi_calculator.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String calculate;
  final String result;
  final String interpretation;

  ResultPage(
      {required this.calculate,
      required this.result,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Text(
                "You Result",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReuseableCard(
                  color: cardActiveColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        result.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xff22e67b),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        calculate,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 100,
                            fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Normal BMI Range",
                            style: TextStyle(
                              color: Color(0xff474959),
                              fontSize: 25,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              "18.5 - 25 kg/m2",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      )
                    ],
                  ))),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  "re-calculate".toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              height: 80,
              margin: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xffFF0067)),
            ),
          )
        ],
      ),
    );
  }
}
