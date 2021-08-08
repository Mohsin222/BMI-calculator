import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_bmi_calculator/Result.dart';
import 'package:my_bmi_calculator/utilities/calculation.dart';
import 'package:my_bmi_calculator/utilities/constant.dart';
import 'package:my_bmi_calculator/widget/BigButton.dart';
import 'package:my_bmi_calculator/widget/GenderCard.dart';
import 'package:my_bmi_calculator/widget/ReusableCard.dart';

class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiMain(),
    );
  }
}

class BmiMain extends StatefulWidget {
  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  int height = 150;
  int age = 10;
  int weight = 50;

  var col;
  var maleCardColor;
  var femaleCardColor;

  void MalCardColor() {
    if (maleCardColor == activeColor) {
      femaleCardColor = activeColor;
      maleCardColor = inactiveColor;
    } else if (femaleCardColor == activeColor) {
      maleCardColor = activeColor;
      femaleCardColor = inactiveColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontFamily: 'Pacifico', fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff111539),
      ),
      backgroundColor: Color(0xff0c1134),
      body: Column(
        children: [
          Expanded(
            //gender cards
            child: Row(
              children: [
                //MAle female card
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      //maleCardColor = changeCL();
                      maleCardColor = activeColor;
                      setState(() {
                        MalCardColor();
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: maleCardColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: GenderCard(
                        genderIcon: FontAwesomeIcons.mars,
                        genderText: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print("FEMALE CARD PRESS");

                      //  femaleCardColor = changeCL();
                      setState(() {
                        MalCardColor();
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: femaleCardColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: GenderCard(
                        genderIcon: FontAwesomeIcons.venus,
                        genderText: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            //Second Section
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color(0xff272a4c),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "HEIGHT",
                    textAlign: TextAlign.center,
                    style: MaintextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: bigText),
                      Text(
                        "cm",
                        style: unitText,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      activeColor: Colors.pink,
                      inactiveColor: Colors.grey,
                      min: 120,
                      max: 220,
                      label: height.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          //third Section
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusabelCard(
                    colour: Color(0xff272a4c),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: MaintextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: bigText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              clipBehavior: Clip.hardEdge,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                              style: ElevatedButton.styleFrom(
                                primary: increse_decreaseButton,
                                padding: EdgeInsets.all(13),
                                shape: CircleBorder(),
                              ),
                            ),
                            ElevatedButton(
                              clipBehavior: Clip.hardEdge,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                              style: ElevatedButton.styleFrom(
                                primary: increse_decreaseButton,
                                padding: EdgeInsets.all(13),
                                shape: CircleBorder(),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusabelCard(
                    colour: Color(0xff272a4c),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: MaintextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: bigText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              clipBehavior: Clip.hardEdge,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                              style: ElevatedButton.styleFrom(
                                primary: increse_decreaseButton,
                                padding: EdgeInsets.all(13),
                                shape: CircleBorder(),
                              ),
                            ),
                            ElevatedButton(
                              clipBehavior: Clip.hardEdge,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                              style: ElevatedButton.styleFrom(
                                primary: increse_decreaseButton,
                                padding: EdgeInsets.all(13),
                                shape: CircleBorder(),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                print("Calculate");
                //        CalculateBodyMass(weight, height);

                CalculateBodyMass bodyMass = CalculateBodyMass(weight, height);

                String resultMessage = bodyMass.getInterpretation();
                double bmi = bodyMass.calculateBMI();
                bmi = double.parse(bmi.toStringAsFixed(1));
                String resultText = bodyMass.getResult();
                print(resultText);
                // bmi.toString();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result(
                            resultText: resultText,
                            message: resultMessage,
                            result: bmi.toString(),
                          )),
                );
              },
              child: BigButton(
                btnText: 'CALCUALATE',
              ))
        ],
      ),
    );
  }
}
