import 'package:bmi_calculator/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/CardChild.dart';
import 'package:bmi_calculator/ReusedableCard.dart';
import 'Constants.dart';
import 'RoundIconButton.dart';
import 'ResultPage.dart';
import 'BottomButton.dart';
import 'BMICalculation.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGenger;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusedableCard(
                      selectedGenger == Gender.male
                          ? ActiveCardColor
                          : InactiveCardColor,
                      CardChild(FontAwesomeIcons.mars, "Male"), () {
                setState(() {
                  selectedGenger = Gender.male;
                });
              })),
              Expanded(
                  child: ReusedableCard(
                      selectedGenger == Gender.female
                          ? ActiveCardColor
                          : InactiveCardColor,
                      CardChild(FontAwesomeIcons.venus, "Female"), () {
                setState(() {
                  selectedGenger = Gender.female;
                });
              }))
            ],
          ),
        ),
        Expanded(
            child: ReusedableCard(
                InactiveCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Height',
                      style: LableTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: LableNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: LableTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0XFFEB1555),
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0X29EB1555),
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.5),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
                () {})),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusedableCard(
                      InactiveCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'weight',
                            style: LableTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: LableNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  weight++;
                                });
                              }),
                              SizedBox(height: 20), // its not working
                              RoundIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  weight--;
                                });
                              }),
                            ],
                          )
                        ],
                      ),
                      null)),
              Expanded(
                child: ReusedableCard(
                    InactiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: LableTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: LableNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                age++;
                              });
                            }),
                            SizedBox(
                              height: 10.0,
                            ),
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                age--;
                              });
                            })
                          ],
                        )
                      ],
                    ),
                    null),
              )
            ],
          ),
        ),
        BottomButton(() {
          BMICalculation bmi = BMICalculation(height, weight);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultPage(bmi.calculateBMI(),
                      bmi.getResult(), bmi.getInterpretation())));
        }, 'Calculate')
      ],
    ));
  }
}

//  Color maleColor = InactiveCardColor;
//  Color femaleColor = InactiveCardColor;
//  void updateColor(Gender gender) {
//    if (gender == Gender.male) {
//      if (maleColor == InactiveCardColor) {
//        maleColor = ActiveCardColor;
//        femaleColor = InactiveCardColor;
//      } else {
//        maleColor = InactiveCardColor;
//      }
//    }
//    if (gender == Gender.female) {
//      if (femaleColor == InactiveCardColor) {
//        femaleColor = ActiveCardColor;
//        maleColor = InactiveCardColor;
//      } else {
//        femaleColor = InactiveCardColor;
//      }
//    }
//  }
