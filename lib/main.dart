import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/CategoryModel.dart';
import 'package:news_app/providers/NewsModel.dart';
import 'package:news_app/screens/category_screen.dart';
import 'package:news_app/screens/news_detail.dart';
import 'package:news_app/screens/news_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryTypes(),
        ),
        ChangeNotifierProvider(
          create: (context) => News(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NewsOverViewScreen(),
        routes: {
          CategoriesScreen.routePage: (context) => CategoriesScreen(),
          NewsDetailScreen.routePage: (context) => NewsDetailScreen()
        },
      ),
    );
  }
}
