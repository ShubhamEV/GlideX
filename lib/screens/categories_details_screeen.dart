import 'package:flutter/material.dart';

class CategoriesDetailsScreeen extends StatefulWidget {
  const CategoriesDetailsScreeen({Key? key}) : super(key: key);

  static const String routeName = '/categories_details_screeen';

  @override
  _CategoriesDetailsScreeenState createState() =>
      _CategoriesDetailsScreeenState();
}

class _CategoriesDetailsScreeenState extends State<CategoriesDetailsScreeen> {
  List<dynamic>? cat_details_data = null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories Details'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 490,
              child: ListView.builder(
                itemCount: cat_details_data?.length ?? 0,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final item = cat_details_data![index];
                  final data = item;
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        LookupDataScreen.routeName,
                        arguments: {
                          "cat_id": item['idMeal'],
                          "cat_image": item['strMealThumb'],
                          "cat_name": item['strMeal'],
                        },
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 170,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFEBEBEB), width: 1),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            data?['strMealThumb']?.toString() ?? '',
                            width: 200,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 100, height: 20),
                          Text(
                            item['strMeal']?.toString() ?? '',
                            style: TextStyle(
                              color: Color(0xDD000000),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
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
      ),
      backgroundColor: Color(0xFFFFFBFF),
    );
  }
}
