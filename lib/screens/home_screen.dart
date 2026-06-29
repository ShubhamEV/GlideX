import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'recipe_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<dynamic>? random_meal_data = null;

  List<dynamic>? categories_data = null;

  bool _fetchedOnceApi_1782657866748 = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Explorer'),
        backgroundColor: Color(0xFFFF6600),
        foregroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Column(
            children: [
              SizedBox(width: 100, height: 30),
              Text(
                'Recipe of The Day',
                style: TextStyle(
                  color: Color(0xFF1F1F1F),
                  fontSize: 26,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                  wordSpacing: 0,
                  height: 1.5,
                ),
                softWrap: true,
              ),
              Text(
                'Explore today\'s featured dish and start cooking.',
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
                textAlign: TextAlign.center,
                softWrap: true,
              ),
              SizedBox(
                width: 300,
                height: 320,
                child: ListView.builder(
                  itemCount: random_meal_data?.length ?? 0,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final item = random_meal_data![index];
                    final data = item;
                    return Container(
                      width: 153,
                      height: 250,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            data?['strMealThumb']?.toString() ?? '',
                            width: 200,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 100, height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'MEAL NAME',
                                style: TextStyle(
                                  color: Color(0xDD000000),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0,
                                  wordSpacing: 0,
                                  height: 1.5,
                                ),
                                softWrap: true,
                              ),
                              Text(
                                item['strMeal']?.toString() ?? '',
                                style: TextStyle(
                                  color: Color(0xDD000000),
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0,
                                  wordSpacing: 0,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'MEAL CATEGORY',
                                style: TextStyle(
                                  color: Color(0xDD000000),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0,
                                  wordSpacing: 0,
                                  height: 1.5,
                                ),
                                softWrap: true,
                              ),
                              Text(
                                item['strCategory']?.toString() ?? '',
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
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'MEAL COUNTRY',
                                style: TextStyle(
                                  color: Color(0xDD000000),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0,
                                  wordSpacing: 0,
                                  height: 1.5,
                                ),
                                softWrap: true,
                              ),
                              Text(
                                item['strCountry']?.toString() ?? '',
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
                            ],
                          ),
                          SizedBox(width: 100, height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                RecipeDetailsScreen.routeName,
                                arguments: {
                                  "image": item['strMealThumb'],
                                  "name": item['strMeal'],
                                  "instruction": item['strInstructions'],
                                },
                              );
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
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Cilck to View Recipe',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.chevron_right),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(width: 100, height: 15),
              Text(
                'Food Categories',
                style: TextStyle(
                  color: Color(0xDD000000),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                  wordSpacing: 0,
                  height: 1.5,
                ),
                softWrap: true,
              ),
              SizedBox(
                width: 300,
                height: 380,
                child: GridView.builder(
                  itemCount: categories_data?.length ?? 0,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final item =
                        categories_data != null &&
                            index < categories_data!.length
                        ? categories_data![index]
                        : null;
                    final data = item;
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          CategoriesDetailsScreeen.routeName,
                          arguments: {"category": item['strCategory']},
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 150,
                        padding: EdgeInsets.only(top: 12),
                        margin: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xFFD9D9D9),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Image.network(
                              data?['strCategoryThumb']?.toString() ?? '',
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 100, height: 10),
                            Text(
                              item['strCategory']?.toString() ?? '',
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
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(width: 100, height: 80),
              Text(
                'Profile Details',
                style: TextStyle(
                  color: Color(0xDD000000),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                  wordSpacing: 0,
                  height: 1.5,
                ),
                softWrap: true,
              ),
              SizedBox(width: 100, height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' Name',
                    style: TextStyle(
                      color: Color(0xDD000000),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0,
                      wordSpacing: 0,
                      height: 1.5,
                    ),
                    softWrap: true,
                  ),
                  Text(
                    'Dev Test ',
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
                ],
              ),
              SizedBox(width: 100, height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' Email',
                    style: TextStyle(
                      color: Color(0xDD000000),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0,
                      wordSpacing: 0,
                      height: 1.5,
                    ),
                    softWrap: true,
                  ),
                  Text(
                    'dev_test@glidex.tech ',
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
                ],
              ),
              SizedBox(width: 100, height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' Version',
                    style: TextStyle(
                      color: Color(0xDD000000),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0,
                      wordSpacing: 0,
                      height: 1.5,
                    ),
                    softWrap: true,
                  ),
                  Text(
                    '1.0 ',
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
                ],
              ),
              SizedBox(width: 100, height: 50),
              Text(
                'Built using GlideX',
                style: TextStyle(
                  color: Color(0xDD000000),
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0,
                  wordSpacing: 0,
                  height: 1.5,
                ),
                softWrap: true,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood, size: 24),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 24),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Color(0xFFFF6600),
        unselectedItemColor: Color(0xFF757575),
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
      backgroundColor: Color(0xFFFFFBFF),
    );
  }
}
