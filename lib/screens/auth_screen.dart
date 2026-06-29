import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../supabase_service/supabase_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const String routeName = '/auth_screen';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  dynamic? sign_in_email_ctr = null;

  dynamic? sign_in_pass_ctr = null;

  dynamic? sign_up_email_ctr = null;

  dynamic? sign_up_pass_ctr = null;

  late final TabController _tabController;

  late final TextEditingController _sign_in_email_ctrController;

  late final TextEditingController _sign_in_pass_ctrController;

  late final TextEditingController _sign_up_email_ctrController;

  late final TextEditingController _sign_up_pass_ctrController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _sign_in_email_ctrController = TextEditingController();
    _sign_in_email_ctrController.addListener(() {
      setState(() {
        sign_in_email_ctr = _sign_in_email_ctrController.text;
      });
    });
    _sign_in_pass_ctrController = TextEditingController();
    _sign_in_pass_ctrController.addListener(() {
      setState(() {
        sign_in_pass_ctr = _sign_in_pass_ctrController.text;
      });
    });
    _sign_up_email_ctrController = TextEditingController();
    _sign_up_email_ctrController.addListener(() {
      setState(() {
        sign_up_email_ctr = _sign_up_email_ctrController.text;
      });
    });
    _sign_up_pass_ctrController = TextEditingController();
    _sign_up_pass_ctrController.addListener(() {
      setState(() {
        sign_up_pass_ctr = _sign_up_pass_ctrController.text;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _sign_in_email_ctrController.dispose();
    _sign_in_pass_ctrController.dispose();
    _sign_up_email_ctrController.dispose();
    _sign_up_pass_ctrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Recipe Explorer',
            style: TextStyle(
              color: Color(0xFFFF6600),
              fontSize: 32,
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
              wordSpacing: 0,
              height: 1.5,
            ),
            softWrap: true,
          ),
          Text(
            'Welcome to Recipe Explorer',
            style: TextStyle(
              color: Color(0xFF1F1F1F),
              fontSize: 14,
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
              wordSpacing: 0,
              height: 1.5,
            ),
            softWrap: true,
          ),
          TabBar(
            tabs: [
              Tab(text: 'Sign In', iconMargin: EdgeInsets.zero),
              Tab(text: 'Sign Up', iconMargin: EdgeInsets.zero),
            ],
            controller: _tabController,
            indicatorColor: Color(0xFFFF6600),
            labelColor: Color(0xFFFF6600),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(width: 100, height: 10),
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Color(0xFF1F1F1F),
                          fontSize: 22,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0,
                          wordSpacing: 0,
                          height: 1.5,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: 100, height: 10),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter email',
                            filled: true,
                            fillColor: Color(0xFFF4F0F4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF2196F3)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF78767A)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          controller: _sign_in_email_ctrController,
                        ),
                      ),
                      SizedBox(width: 100, height: 10),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter password',
                            filled: true,
                            fillColor: Color(0xFFF4F0F4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF2196F3)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF78767A)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          obscureText: true,
                          controller: _sign_in_pass_ctrController,
                        ),
                      ),
                      SizedBox(width: 100, height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          // Supabase sign in
                          try {
                            await SupabaseService.signIn(
                              email: sign_in_email_ctr,
                              password: sign_in_pass_ctr,
                            );
                            Navigator.of(
                              context,
                            ).pushNamed(HomeScreen.routeName);
                          } catch (e) {}
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF6600),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          elevation: 2,
                          minimumSize: Size(120, 44),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(width: 100, height: 10),
                      Text(
                        'Create new Account',
                        style: TextStyle(
                          color: Color(0xFF1F1F1F),
                          fontSize: 26,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0,
                          wordSpacing: 0,
                          height: 1.5,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: 100, height: 10),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Email',
                            filled: true,
                            fillColor: Color(0xFFF4F0F4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF2196F3)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF78767A)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          controller: _sign_up_email_ctrController,
                        ),
                      ),
                      SizedBox(width: 100, height: 10),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            filled: true,
                            fillColor: Color(0xFFF4F0F4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF2196F3)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF78767A)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          obscureText: true,
                          controller: _sign_up_pass_ctrController,
                        ),
                      ),
                      SizedBox(width: 100, height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          // Supabase sign up
                          try {
                            await SupabaseService.signUp(
                              email: sign_up_email_ctr,
                              password: sign_up_pass_ctr,
                            );
                            Navigator.of(
                              context,
                            ).pushNamed(HomeScreen.routeName);
                          } catch (e) {}
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF6600),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          elevation: 2,
                          minimumSize: Size(120, 44),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFFFFBFF),
    );
  }
}
