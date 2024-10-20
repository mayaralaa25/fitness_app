import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/body_calc/views/body_calc_screen.dart';
import 'package:flutter/material.dart';
import '../../features/Home/view/home_screen.dart';
import '../../features/profile/presentation/views/profile_view.dart';

class FloatingNavBar extends StatefulWidget {
  const FloatingNavBar({super.key});

  @override
  State<FloatingNavBar> createState() => _FloatingNavBarState();
}

class _FloatingNavBarState extends State<FloatingNavBar> {
//   int _selectedIndex = 0;
//   static List<IconData> iconpages = [
//     Icons.home,
//     Icons.timer,
//     Icons.person,
//   ];
// List of screens or widgets for each navigation item
  List<Widget> pages = [
    const HomeScreen(),
    const BodyCalcScreen(),
    const ProfileView(),
  ];
  int mycurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 1,
                offset:const Offset(0, 20) 
              ),
            ],
          ),
          height: 70, 
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: BottomNavigationBar(
             elevation: 1,
              selectedFontSize: 12,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              //backgroundColor: const Color.fromARGB(80, 0, 0, 0),
              ///Changes here: just these 2 lines
              backgroundColor:
              //Colors.white,
              Colors.black.withOpacity(.5),
              unselectedItemColor: Colorsapp.liteGrey,
              ///*********************************
              selectedItemColor: Colorsapp.liteOrange,
              //unselectedItemColor: Colors.white,
                currentIndex: mycurrentIndex,
                onTap: (index) {
                  setState(() {
                    mycurrentIndex = index;
                  });
                },
                items:const [
                  BottomNavigationBarItem(icon: Icon(Icons.home,),label: "home"),
                  BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined,),label: "home"),
                  BottomNavigationBarItem(icon: Icon(Icons.person,),label: "home"),
                ]),
          ),
        ),
      ),
    body:pages[mycurrentIndex],
    );
  }
}

 


 