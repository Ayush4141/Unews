import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news121/newsmodel.dart';
import 'dart:convert';

class NewsList with ChangeNotifier {
  List <NewsModel> _items = [

    //NewsModel(id: 'One', headline: 'IGNOU postpones June term Exam Details Here', detail: 'IGNOU: June Exam: The Indira Gandhi National Open University has decided to postpone the June,2020 Term End Examinations, which were originally scheduled from June 1,2020 in the wake of the lockdown dut to Covid-19. ', imageUrl: 'https://www.jagranjosh.com/imported/images/E/Articles/jee-main-neet-exam-dates-to-be-announced.jpg', date: '',),
    //NewsModel(id: 'Two', headline: 'Fresh dates for JEE, NEET to be announced on May 5: HRD ministry', imageUrl: 'https://www.jagranjosh.com/imported/images/E/Articles/jee-main-neet-exam-dates-to-be-announced.jpg',
    // detail: 'NTA to Announce JEE Main, NEET Exam Dates 2020: The National Testing Agency is expected to announce the Examination dates for the JEE  Main and NEET 2020 examinations on May 5, 2020. As per media reports, the HRD Ministry is expected to announce the exam dates for the JEE Main 2020 and the NEET UG 2020 examinations on May 5, 2020. The national level entrance examinations were postponed due to the COVID-19 lockdown which was imposed on March 24, 2020. The examination dates will be available on the official websites - jeemain.nta.nic.in and ntaneet.nic.in through an official notification.', date: '',),
  ];

  List<NewsModel> get items {
    return [..._items];
  }


  NewsModel findById(String id) {
    return _items.firstWhere((newss) => newss.id == id);
  }
  NewsModel findByIdinHome(String id) {
    return home.firstWhere((newss) => newss.id == id);
  }

  NewsModel findByIdinSports(String id) {
    return sportss.firstWhere((newss) => newss.id == id);
  }

   NewsModel findByIdinExams(String id) {
    return exams.firstWhere((newss) => newss.id == id);
  }

  NewsModel findByIdinTech(String id) {
    return tech.firstWhere((newss) => newss.id == id);
  }

  NewsModel findByIdinLifestyle(String id) {
    return lifestyle.firstWhere((newss) => newss.id == id);
  }

  //Future<void> fetchAndSetProducts() async {
  //  const url = 'https://shop121-cef5b.firebaseio.com/News.json';
  //  try {
  //    final response = await http.get(url);
  //    final extractedData = json.decode(response.body) as Map<String, dynamic>;
  //    if (extractedData == null) {
  //      return;
  //    }
  //    final List<NewsModel> loadedProducts = [];
  //    extractedData.forEach((newsId, newsData) {
  //      loadedProducts.add(NewsModel(
  //        id: newsId,
  //        headline: newsData['headline'],
  //        detail: newsData['detail'],
  //        imageUrl: newsData['imageUrl'],
  //        date: newsData['date'],
  //        type: newsData['type'],
  //      ));
  //    });
  //    _items = loadedProducts;
  //    notifyListeners();
  //  } catch (error) {
  //    throw (error);
  //  }

  

  //}

  //8778

  List<NewsModel> home = [];

  Future<void> fetchAndSetHome() async {
    const url = 'https://shop121-cef5b.firebaseio.com/News/home.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<NewsModel> loadedProducts = [];
      extractedData.forEach((newsId, newsData) {
        loadedProducts.insert(0 ,NewsModel(
          id: newsId,
          headline: newsData['headline'],
          detail: newsData['detail'],
          detail2: newsData['detail2'],
          imageUrl: newsData['imageUrl'],
          date: newsData['date'],
          type: newsData['type'],
        ));
      });
      home = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  //765656

  List<NewsModel> sportss = [];

  Future<void> fetchAndSetSports() async {
    const url = 'https://shop121-cef5b.firebaseio.com/News/sports.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<NewsModel> loadedProducts = [];
      extractedData.forEach((newsId, newsData) {
        loadedProducts.insert(0,NewsModel(
          id: newsId,
          headline: newsData['headline'],
          detail: newsData['detail'],
          detail2: newsData['detail2'],
          imageUrl: newsData['imageUrl'],
          date: newsData['date'],
          type: newsData['type'],
        ));
      });
      sportss = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  //4

  List<NewsModel> exams = [];

  Future<void> fetchAndSetExams() async {
    const url = 'https://shop121-cef5b.firebaseio.com/News/exams.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<NewsModel> loadedProducts = [];
      extractedData.forEach((newsId, newsData) {
        loadedProducts.insert(0,NewsModel(
          id: newsId,
          headline: newsData['headline'],
          detail: newsData['detail'],
          detail2: newsData['detail2'],
          imageUrl: newsData['imageUrl'],
          date: newsData['date'],
          type: newsData['type'],
        ));
      });
      exams = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
//65

List<NewsModel> tech = [];

  Future<void> fetchAndSetTech() async {
    const url = 'https://shop121-cef5b.firebaseio.com/News/tech.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<NewsModel> loadedProducts = [];
      extractedData.forEach((newsId, newsData) {
        loadedProducts.insert(0,NewsModel(
          id: newsId,
          headline: newsData['headline'],
          detail: newsData['detail'],
          detail2: newsData['detail2'],
          imageUrl: newsData['imageUrl'],
          date: newsData['date'],
          type: newsData['type'],
        ));
      });
      tech = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
  // aa

  List<NewsModel> lifestyle = [];

  Future<void> fetchAndSetLifestyle() async {
    const url = 'https://shop121-cef5b.firebaseio.com/News/lifestyle.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<NewsModel> loadedProducts = [];
      extractedData.forEach((newsId, newsData) {
        loadedProducts.insert(0,NewsModel(
          id: newsId,
          headline: newsData['headline'],
          detail: newsData['detail'],
          detail2: newsData['detail2'],
          imageUrl: newsData['imageUrl'],
          date: newsData['date'],
          type: newsData['type'],
        ));
      });
      lifestyle = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  //   +


  Future<void> addProduct(NewsModel product) async {
    final url = 'https://shop121-cef5b.firebaseio.com/News/${product.type}.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'headline': product.headline,
          'detail': product.detail,
          'detail2': product.detail2,
          'imageUrl': product.imageUrl,
          'date': product.date,
          'type': product.type,
        }),
      );
      final newProduct = NewsModel(
        headline: product.headline,
        detail: product.detail,
        detail2: product.detail2,
        imageUrl: product.imageUrl,
        date: product.date,
        type: product.type,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

}