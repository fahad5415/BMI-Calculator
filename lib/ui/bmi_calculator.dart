import 'package:bmi_calculator/ui/result_calculate.dart';
import 'package:bmi_calculator/ui/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'result_page.dart';

import 'ReuseableCard.dart';
import 'icon_context.dart';

const cardActiveColor = Color(0xff111428);
const bottomContainerHeight = 80.0;
const cardInactiveColor = Color(0xff111128);

enum Property {
  male,
  female,
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int _heightCalculate = 20;
  int _weightCalculate = 1;
  int _ageCalculate = 1;

  Color maleActiveColor = cardInactiveColor;
  Color femaleActiveColor = cardInactiveColor;

  void updateColor(Property selectProperty) {
    if (selectProperty == Property.male) {
      if (maleActiveColor == cardInactiveColor) {
        maleActiveColor = cardActiveColor;
        femaleActiveColor = cardInactiveColor;
      } else {
        maleActiveColor = cardInactiveColor;
      }
    }
    if (selectProperty == Property.female) {
      if (femaleActiveColor == cardInactiveColor) {
        femaleActiveColor = cardActiveColor;
        maleActiveColor = cardInactiveColor;
      } else {
        femaleActiveColor = cardInactiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff1D1E33),
      appBar: AppBar(
          title: Text(
            "BMI CALCULATOR",
          ),
          centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(Property.male);
                    });
                  },
                  child: ReuseableCard(
                    color: maleActiveColor,
                    childCard: IconContext(
                      childIcon: FontAwesomeIcons.mars,
                      textData: "MALE",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(Property.female);
                    });
                  },
                  child: ReuseableCard(
                    color: femaleActiveColor,
                    childCard: IconContext(
                        childIcon: FontAwesomeIcons.venus, textData: "FEMALE"),
                  ),
                ),
              )
            ],
          )),
          Expanded(
            child: ReuseableCard(
              color: cardActiveColor,
              childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                          color: Color(0xff8D8E98),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text("${_heightCalculate}", style: mainTextStyle()),
                        Text(
                          "cm",
                          style: TextStyle(
                              color: Color(0xff8D8E98),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xff8D8E98),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          thumbColor: Color(0xffFF0067),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          overlayColor: Color(0x29EB1555)),
                      child: Slider(
                          min: 20,
                          max: 250,
                          value: _heightCalculate.toDouble(),
                          onChanged: (val) {
                            setState(() {
                              _heightCalculate = val.round();
                            });
                          }),
                    )
                  ]),
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReuseableCard(
                  color: cardActiveColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: TextStyle(
                            color: Color(0xff8D8E98),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("${_weightCalculate}", style: mainTextStyle()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_weightCalculate > 1) {
                                  _weightCalculate--;
                                } else {
                                  // do nothing
                                }
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Color(0xff1C1F32),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _weightCalculate++;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Color(0xff1C1F32),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    color: Color(0xff8D8F98),
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  color: cardActiveColor,
                  childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: TextStyle(
                              color: Color(0xff8D8E98),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("${_ageCalculate}", style: mainTextStyle()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (_ageCalculate > 1) {
                                    _ageCalculate--;
                                  } else {
                                    // do nothing
                                  }
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color(0xff1C1F32),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _ageCalculate++;
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color(0xff1C1F32),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      color: Color(0xff8D8F98),
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ]),
                ),
              ),
            ]),
          ),
          GestureDetector(
            onTap: () {
              CalculateBrain calc = CalculateBrain(
                  height: _heightCalculate, weight: _weightCalculate);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                          calculate: calc.bmiCalculate(),
                          result: calc.getResult(),
                          interpretation: calc.getInterpretation())));
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: bottomContainerHeight,
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xffFF0067)),
              child: Center(
                  child: Text(
                "calculate".toUpperCase(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(
        color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold);
  }
}
