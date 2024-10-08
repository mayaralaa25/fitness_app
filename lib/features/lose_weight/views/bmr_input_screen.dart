import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/lose_weight/cubit/lose_weight_cubit.dart';
import 'package:final_project/features/lose_weight/cubit/lose_weight_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/utils/constant_var.dart';
import '../widgets/calculate_button.dart';
import '../widgets/gender_card_content.dart';
import '../widgets/reusable_card.dart';
import '../widgets/round_icon_button.dart';
import 'bmr_result_screen.dart';


class BMRInputScreen extends StatefulWidget {
  @override
  _BMRInputScreenState createState() => _BMRInputScreenState();
}

class _BMRInputScreenState extends State<BMRInputScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoseWeightCubit, LoseWeightStates>(
        listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('BMR CALCULATOR', style: TextStyle(color: Colors.white),),
         leading: InkWell(onTap: (){Navigator.pop(context);},
             child: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white,)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded( // male + female cards
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        LoseWeightCubit.get(context).isMale = true;
                        LoseWeightCubit.get(context).changeGender();
                      });
                    },
                    colour: LoseWeightCubit.get(context).isMale ? kChosenGenderColor : kReusableCardColor,
                    cardChild: GenderCardContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE'
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        LoseWeightCubit.get(context).isMale = false;
                        LoseWeightCubit.get(context).changeGender();
                      });
                    },
                    colour: LoseWeightCubit.get(context).isMale ? kReusableCardColor : kChosenGenderColor,
                    cardChild: GenderCardContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE'
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded( // height slider card
            child: ReusableCard(
              colour: kReusableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        LoseWeightCubit.get(context).height.toString(),
                        style: kLabelNumberStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith( // use context and get theme of nearest slider to modify
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Colors.deepOrange[500],
                      activeTrackColor: Colors.white,
                      overlayColor: Colorsapp.liteOrange.withOpacity(0.2),
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: LoseWeightCubit.get(context).height.toDouble(),
                      min: 60,
                      max: 230,
                      onChanged: (double newValue) {
                        setState(() {
                          LoseWeightCubit.get(context).height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded( // weight + age cards
            child: Row(
              children: [
                Expanded( // weight card
                  child: ReusableCard(
                    colour: kReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          LoseWeightCubit.get(context).weight.toString(),
                          style: kLabelNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (LoseWeightCubit.get(context).weight > 1)
                                    LoseWeightCubit.get(context).weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (LoseWeightCubit.get(context).weight < 1000)
                                    LoseWeightCubit.get(context).weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded( // age card
                  child: ReusableCard(
                    colour: kReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          LoseWeightCubit.get(context).age.toString(),
                          style: kLabelNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (LoseWeightCubit.get(context).age > 1)
                                    LoseWeightCubit.get(context).age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (LoseWeightCubit.get(context).age < 120)
                                    LoseWeightCubit.get(context).age++;
                                });
                              },
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
          CalculateButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              LoseWeightCubit.get(context).calculateBMI();
              //BMICalculator calc = BMICalculator(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BmrResultScreen(),)
              );
            },
          ),
        ],
      ),
    ),
    );
  }
}

