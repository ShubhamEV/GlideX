import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({Key? key}) : super(key: key);

  static const String routeName = '/recipe_details_screen';

  @override
  _RecipeDetailsScreenState createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  Map<String, dynamic>? args;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final routeArgs = ModalRoute.of(context)?.settings.arguments;
      if (routeArgs is Map<String, dynamic>) {
        setState(() {
          args = routeArgs;
        });
      } else if (routeArgs is Map) {
        setState(() {
          args = Map<String, dynamic>.from(routeArgs);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xFFFF6600),
        foregroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 100, height: 80),
            Image.network(
              args?['image']?.toString() ?? '',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 100, height: 10),
            Text(
              args?['name']?.toString() ?? '',
              style: TextStyle(
                color: Color(0xFF1F1F1F),
                fontSize: 22,
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
            SizedBox(width: 100, height: 15),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.zero,
              child: Text(
                args?['instruction']?.toString() ?? '',
                style: TextStyle(
                  color: Color(0xDD000000),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                  wordSpacing: 0,
                  height: 1.5,
                ),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFFFFBFF),
    );
  }
}
