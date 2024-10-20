import 'package:final_project/features/Auth/cubit/auth_cubit.dart';
import 'package:final_project/features/Auth/cubit/auth_states.dart';
import 'package:final_project/features/Auth/view/login_screen.dart';
import 'package:final_project/features/Home/widgets/custom_workout_card.dart';
import 'package:final_project/features/nutrition/views/nutrition_screen.dart';
import 'package:final_project/features/sleep/view/sleep_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colors.dart';
import '../../Steps/view/step_screen.dart';
import '../../workout/views/workout_screen.dart';
import '../../workout/widgets/favorite_screen.dart';
import '../widgets/custom_target_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        //Colorsapp.darkGrey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 15.0, left: 15, top: 60, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   "Home",
                        //   style: TextStyle(
                        //     color: Colorsapp.darkOrange,
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 34,
                        //   ),
                        // ),
                        Text(
                          "hello, ${AuthCubit.get(context).name ?? ""}",
                          style: TextStyle(
                            color: Colorsapp.darkOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((BuildContext context) =>
                                          FavoritesScreen())));
                            },
                            icon: Icon(
                              Icons.favorite,
                              size: 33,
                              color: Colorsapp.darkOrange,
                            )),
                        GestureDetector(
                            onTap: () {
                              AuthCubit.get(context).signOut().then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ));
                              });
                            },
                            child: Icon(
                              Icons.exit_to_app,
                              color: Colorsapp.liteGrey,
                              size: 33,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              CustomWorkoutCard(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.7,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.1,
                  children: [
                    CustomTargetCard(
                      title: "Nutrition",
                      image: "assets/images/salad.png",
                      route: NutritionScreen(),
                      context: context,
                      des: "Keep fit with healthy recipes",
                    ),
                    CustomTargetCard(
                      title: "Steps",
                      image: "assets/images/walk.png",
                      route: StepsScreen(),
                      context: context,
                      des: "Take 9800 steps per day",
                    ),
                    CustomTargetCard(
                      title: "Water",
                      image: "assets/images/water.png",
                      route: WorkoutScreen(),
                      context: context,
                      des: "Take 9800 steps per day",
                    ),
                    CustomTargetCard(
                      title: "Sleep",
                      image: "assets/images/sleep.png",
                      route: SleepScreen(),
                      context: context,
                      des: "Sleep 8 Hours per day",
                    ),
                    // CustomTargetCard(),
                    // CustomTargetCard(),
                    // CustomTargetCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
