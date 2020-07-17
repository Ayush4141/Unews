import 'package:flutter/material.dart';
import 'package:news121/addnewsscreen.dart';
import 'package:news121/newsList.dart';
import 'package:news121/sportsnewsdetailScreen.dart';
import 'package:news121/zexamdetailscreen.dart';
import 'package:news121/zzzlifestyledetailscreen.dart';
import 'package:provider/provider.dart';
import './mainScreen.dart';
import './newsDetailScreen.dart';
import './addnewsscreen.dart';
import './zztechdetailScreen.dart';
import './advertisement.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_admob/firebase_admob.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: NewsList(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.white,
          fontFamily: 'Lato',
        ),
        home: MainScreen(),
        routes: {
          NewsDetailScreen.routeName: (ctx) => NewsDetailScreen(),
          SportsDetailScreen.routeName:(ctx) => SportsDetailScreen(),
          AddNewsScreen.routeName: (ctx) => AddNewsScreen(),
          ExamsDetailScreen.routeName: (ctx) => ExamsDetailScreen(),
          TechDetailScreen.routeName: (ctx) => TechDetailScreen(),
          LifestyleDetailScreen.routeName: (ctx) => LifestyleDetailScreen(),
          Advertisement.routeName: (ctx) => Advertisement(),
        },
      ),
    );
  }
}