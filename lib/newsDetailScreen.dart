import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './newsList.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

class NewsDetailScreen extends StatefulWidget {
  static const routeName = '/news-detail';

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {

  static const _adUnitID = "ca-app-pub-2319291998734234/4142762828";
  final _nativeAdController = NativeAdmobController();
  void inItState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final newsId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<NewsList>(context,listen: false,).findByIdinHome(newsId);

    return Scaffold(
      appBar: AppBar(title : Text('U News'),),
      //appBar: AppBar(title: Text(loadedProduct.headline),),
      body: SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                child: Text(loadedProduct.headline, style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25), textAlign: TextAlign.start,),
              ),
              SizedBox(height: 25),
              Image.network(loadedProduct.imageUrl),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Text('Published on ${loadedProduct.date}' , style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.start,),
              ),
              SizedBox(height: 25,),
              Container(
                padding: EdgeInsets.only(left: 18 , right: 14),
                child: Text(loadedProduct.detail , style: TextStyle(fontSize: 16, letterSpacing: 1.0, height: 1.4),),
              ),
              SizedBox(height: 20,),
              Container(
                  height: 80,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 0.0, top: 0, left: 10 , right: 10),
                  child: NativeAdmob(
                    // Your ad unit id
                    adUnitID: "ca-app-pub-3940256099942544/2247696110",
                    controller: _nativeAdController,
                    type: NativeAdmobType.banner,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                padding: EdgeInsets.only(left: 18, right: 14),
                child: Text(loadedProduct.detail2 , style: TextStyle(fontSize: 16, letterSpacing: 1.0, height: 1.4),),
              ),
              SizedBox(height: 20),
              Container(
                  height: 10,
//                  decoration : BoxDecoration( color: Colors.red)
                  ),
              Container(
                  height: 300,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 20.0, left: 10, right: 10),
                  child: NativeAdmob(
                    // Your ad unit id
                    adUnitID: "ca-app-pub-3940256099942544/2247696110",
                    controller: _nativeAdController,
                    type: NativeAdmobType.full,
                  ),
                ),
                SizedBox(height: 25,),
                Container(
                  height: 10,
 //                 decoration : BoxDecoration( color: Colors.red)
                  ),
//                Container(
//                  height: 300,
//                  padding: EdgeInsets.all(10),
//                  margin: EdgeInsets.only(bottom: 20.0),
//                  child: NativeAdmob(
//                    // Your ad unit id
//                    adUnitID: "ca-app-pub-3940256099942544/2247696110",
//                    controller: _nativeAdController,
//                    type: NativeAdmobType.full,
//                  ),
//                ),
                SizedBox(height: 5),
            ]
          ),
      ),
    );
  }
}