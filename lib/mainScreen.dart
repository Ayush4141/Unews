import 'dart:io';
import 'package:flutter/material.dart';
import 'package:news121/mainContent.dart';
import 'package:news121/newsItem.dart';
import 'package:news121/sports.dart';
import 'package:news121/zexams.dart';
import 'package:news121/zzzLifestyle.dart';
import 'package:provider/provider.dart';
import './newsList.dart';
import './addnewsscreen.dart';
import './zztech.dart';
import './appdrawer.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = '';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  static final MobileAdTargetingInfo targetInfo = new MobileAdTargetingInfo(
    testDevices: <String>["50E24FF87B5236257EBD19EAA18901DE"],
    keywords: <String>['wallpapers', 'walls', 'amoled'],
    childDirected: true,
  );

  InterstitialAd _interstitialAd;
  BannerAd _bannerAd;

  BannerAd createBannerAd() {
    return new BannerAd(
        adUnitId: "ca-app-pub-2319291998734234/2926400997",
        size: AdSize.banner,
        targetingInfo: targetInfo,
        listener: (MobileAdEvent event) {
          print("Banner event : $event");
        });
  }


  InterstitialAd createInterstitialAd() {
    return new InterstitialAd(
        adUnitId: "ca-app-pub-2319291998734234/3427790419",
        targetingInfo: targetInfo,
        listener: (MobileAdEvent event) {
          print("Interstitial event : $event");
        });
  }

  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-2319291998734234~2262581232");
        _bannerAd = createBannerAd()
      ..load()
      ..show();
  }

  void dispose() {
    _interstitialAd.dispose();
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      //Provider.of<NewsList>(context).fetchAndSetProducts().then((_) {
      //  setState(() {
      //    _isLoading = false;
      //  });

      //});
       Provider.of<NewsList>(context).fetchAndSetHome();
       Provider.of<NewsList>(context).fetchAndSetSports();
       Provider.of<NewsList>(context).fetchAndSetTech();
       Provider.of<NewsList>(context).fetchAndSetExams();
       Provider.of<NewsList>(context).fetchAndSetLifestyle();
    }
    _isInit = false;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController( 
      length: 5,
      child:Scaffold(
        backgroundColor: Color.fromRGBO(242, 242, 242, 2),
      appBar: AppBar(
        title: Text('U News', style: TextStyle(fontWeight: FontWeight.bold),),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: 'Home',
           ),
            Tab(
              text: 'Sports',
            ),
            Tab(
              text: 'Exams',
            ),
            Tab(
              text: 'Tech',
            ),
            Tab(
              text: 'Lifestyle',
              ),
          ],
        ),
//      actions: <Widget>[
//        IconButton(
//            icon: const Icon(Icons.add),
//            onPressed: () {
//              Navigator.of(context).pushNamed(AddNewsScreen.routeName);
//            },
//          ),
//      ],
      ),
      drawer: Appdrawer(),
      body: TabBarView(
        children: <Widget>[
          MainCntent(),
          Sports(),
          Exams(),
          Tech(),
          Lifestyle(),

        ],
      ),
    ),
    );
  }
}



//    return Scaffold(
//      body: DefaultTabController(
//        length: 5,
//        child: NestedScrollView(
//          headerSliverBuilder: (context, value) {
//            return [
//              SliverAppBar(
//                floating: true,
//                pinned: true,
//                title: Text('U News', style: TextStyle(fontWeight: FontWeight.bold),),
//                bottom: TabBar(
//                  tabs: [
//                    Tab( text: "Home"),
//                    Tab( text: "Sports"),
 //                   Tab( text: "Exams"),
//                    Tab( text: "Tech"),
//                    Tab( text: "Lifestyle"),
//                  ],
//                ),
//              ),
//            ];
//          },
//          body: TabBarView(
//            children: <Widget>[
//          MainCntent(),
//          Sports(),
//          Exams(),
//          Tech(),
//         Lifestyle(),
//
//        ],
              
//              Container(child: ListView.builder(
//                  itemCount: 100,
//                  itemBuilder: (context,index){
//                return Text("Item $index");
//              })),
//              Container(child: ListView.builder(
//                  itemCount: 100,
//                  itemBuilder: (context,index){
//                    return Text("Item $index");
//                  })),
//            ],
//          ),
//        ),
//      ),
//      drawer: Appdrawer(),
//    );
//  }


    