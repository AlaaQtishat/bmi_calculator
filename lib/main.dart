import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0A0E21)),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        //note we didn't specify the text color because eby default when using dark mode, the text is white.
      ),
      debugShowCheckedModeBanner: false,
      // Set the home screen to be the InputPage widget
      home: InputPage(),
    );
  }
}
