import 'package:bmi/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; //a package to get icons from.
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../calculator_brain.dart ';
import 'package:bmi/components/round_icon_button.dart';
import 'package:bmi/components/bottom_button.dart';

// Enum for Gender selection, instead of us saying that 1 represents male and 2 represents female, we did this instead.
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender;
  // note here the gender is of type Gender(enum) which means it can only hold female or male.
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            //// The row that contains the two gender selection cards (Male and Female)
            child: Row(
              children: [
                Expanded(
                  //the male card.
                  //we're creating a new instance of ReusableCard and passing values for those parameters of the constructor.(colour, onPress, and cardChild.)
                  child: ReusableCard(
                    colour: gender == Gender.male
                        ? kActiveCardColour // If selected, set active color
                        : kInactiveCardColour, // If not selected, set inactive color
                    /* What is cardChild?
                     * Remember when creating a Container, it has a 'child' property?
                     * Or when using a Column/Row, they have 'children'?
                     * Since we created the ReusableCard widget from scratch, we need to specify a 'child'
                     * just like built-in widgets. Here, 'cardChild' is the content inside the card.
                     */
                    cardChild: IconContent(FontAwesomeIcons.mars, "MALE"),
                    onPress: () {
                      setState(() {
                        gender = Gender.male; // Set gender to male when tapped
                      });
                    },
                  ),
                ),
                Expanded(
                  //the female card.
                  child: ReusableCard(
                    colour: gender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(FontAwesomeIcons.venus, "FEMALE"),
                    onPress: () {
                      setState(() {
                        gender = Gender.female; // Update gender on tap
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          //I want the style to be the same as the style of the male,female cards.
                          style: kLabelTextStyle,
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          // the above is added so I be able to use the CrossAxisAlignment.baseline, without it the app crashes.
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              height
                                  .toString(), //did this because height is int and this expects a string.
                              style: kNumberTextStyle,
                            ),
                            Text("cm", style: kLabelTextStyle),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15.0,
                            ),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 26.0,
                            ),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
