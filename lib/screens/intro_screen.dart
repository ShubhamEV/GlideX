import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static const String routeName = '/intro_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 160.7999267578125,
            height: 167.5999755859375,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(color: Color(0xFFFF6600)),
            child: Icon(Icons.fastfood, size: 80, color: Colors.white),
          ),
          Text(
            'Recipe Explorer',
            style: TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
              wordSpacing: 0,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          Text(
            'Explore a diverse collection of recipes, ingredients, and cooking instructions designed for every food lover',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
              wordSpacing: 0,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          SizedBox(width: 100, height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AuthScreen.routeName);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFF6600),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              elevation: 2,
              minimumSize: Size(120, 44),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.chevron_right, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFFFF2E5),
      extendBody: true,
    );
  }
}
