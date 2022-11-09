
import 'package:flutter/material.dart';

class AppTheme {

  static const Color primary = Color.fromARGB(255, 163, 107, 223);
  
  static const Color secondary = Color.fromARGB(255, 91, 60, 128);

  //  static const Color primarybottomNavigation = Color.fromARGB(255, 175, 120, 235);
  static const Color primarybottomNavigation = Color.fromARGB(255, 207, 174, 242);

  static const Color primary_botton = Color.fromARGB(255, 160, 116, 207);
  
   static const Color secondary_botton = Color.fromARGB(255, 75, 45, 112);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
        //color primario
        primaryColor: primary,

        //appbartheme
        appBarTheme: const AppBarTheme(
          color:  primary,
          elevation: 5
        ),


        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: secondary,
            elevation: 3
        ),

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: primarybottomNavigation,
          selectedItemColor: secondary_botton,
          unselectedItemColor: primary_botton
        )
         
        
        
      );
  
}