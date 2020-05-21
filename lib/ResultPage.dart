import 'package:bmi_calculator/BottomButton.dart';
import 'package:bmi_calculator/ReusedableCard.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';

class ResultPage extends StatelessWidget {

  String bMIresult;
  String textResult;
  String interResult;

  ResultPage(this.bMIresult, this.textResult, this.interResult);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result:',
                style: LableTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusedableCard(
                InactiveCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      textResult,
                      style: LableResultTextStyle,
                    ),
                    Text(
                      bMIresult,
                      style: LableBMITextStyle,
                    ),
                    Text(
                      interResult,
                      style: LableBodyextStyle,
                      textAlign: TextAlign.center,
                    ),
                    BottomButton(() {
                      Navigator.pop(context);
                    }, 'Re-Calulate')
                  ],
                ),
                null),
          )
        ],
      ),
    );
  }
}
