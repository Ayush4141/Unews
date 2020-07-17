import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NewsModel with ChangeNotifier{
  final String id;
  final String headline;
  final String detail;
  final String detail2;
  final String imageUrl;
  final String date;
  final String type;

  NewsModel({
    @required this.id,
    @required this.headline,
    @required this.detail,
    @required this.detail2,
    @required this.imageUrl,
    @required this.date,
    @required this.type,
  });
}