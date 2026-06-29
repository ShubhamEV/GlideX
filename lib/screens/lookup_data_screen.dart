import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LookupDataScreen extends StatefulWidget {
  const LookupDataScreen({Key? key}) : super(key: key);

  static const String routeName = '/lookup_data_screen';

  @override
  _LookupDataScreenState createState() => _LookupDataScreenState();
}

class _LookupDataScreenState extends State<LookupDataScreen> {
  Map<String, dynamic>? args;

  dynamic? lookup_data = null;

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
        title: Text(args?['cat_name']?.toString() ?? ''),
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
            SizedBox(width: 100, height: 30),
            Image.network(
              args?['cat_image']?.toString() ?? '',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 100, height: 20),
            Text(
              lookup_data != null ? lookup_data.toString() : "",
              style: TextStyle(
                color: Color(0xFF1F1F1F),
                fontSize: 20,
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
                wordSpacing: 0,
                height: 1.5,
              ),
              softWrap: true,
            ),
            SizedBox(width: 100, height: 20),
            Text(
              lookup_data != null
                  ? lookup_data['strInstructions'].toString()
                  : "",
              style: TextStyle(
                color: Color(0xDD000000),
                fontSize: 1,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
                wordSpacing: 0,
                height: 1.5,
              ),
              softWrap: true,
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFFFFBFF),
    );
  }
}
