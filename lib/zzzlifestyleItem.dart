import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './newsmodel.dart';
import './zzzlifestyledetailscreen.dart';
import 'package:firebase_admob/firebase_admob.dart';

class LifestyleItem extends StatefulWidget {
  @override
  _LifestyleItemState createState() => _LifestyleItemState();
}

class _LifestyleItemState extends State<LifestyleItem> {

  static final MobileAdTargetingInfo targetInfo = new MobileAdTargetingInfo(
    testDevices: <String>["50E24FF87B5236257EBD19EAA18901DE"],
    keywords: <String>['wallpapers', 'walls', 'amoled'],
    childDirected: true,
  );

  InterstitialAd _interstitialAd;
  InterstitialAd _interstitialAd3;
  

  InterstitialAd createInterstitialAd() {
    return new InterstitialAd(
        adUnitId: "ca-app-pub-2319291998734234/3427790419",
        targetingInfo: targetInfo,
        listener: (MobileAdEvent event) {
          print("Interstitial event : $event");
        });
  }
  InterstitialAd createInterstitialAd3() {
    return new InterstitialAd(
        adUnitId: "ca-app-pub-2319291998734234/4271288167",
        targetingInfo: targetInfo,
        listener: (MobileAdEvent event) {
          print("Interstitial event : $event");
        });
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-2319291998734234~2262581232");
    _interstitialAd = createInterstitialAd()
      ..load()
      ..show();
  }

  void dispose() {
    _interstitialAd.dispose();
    _interstitialAd3.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final newsitem = Provider.of<NewsModel>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            _interstitialAd = createInterstitialAd3()
          ..load()
          ..show();
            Navigator.of(context).pushNamed(
              LifestyleDetailScreen.routeName,
              arguments: newsitem.id,);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.black12),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(6),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 80,
                    padding: EdgeInsets.only(left: 2 , right: 2 , top: 8 , bottom: 8,),
                    child: Text('${newsitem.headline}' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  ),
                  Container(
                    width: 200,
                    height: 82,
                    padding: EdgeInsets.only(left: 2, right: 2, top: 2, bottom: 10),
                    child: Text('${newsitem.detail}' , style: TextStyle(fontWeight: FontWeight.normal , color: Colors.grey),),
                  ),
              ],
              ),
              Container(
                padding: EdgeInsets.only(left: 0 , right: 0 , top : 12 , bottom: 0,),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(newsitem.imageUrl, width: 100 , height: 100 , fit: BoxFit.cover),
                ),
                ),
          ],
          ),
          ),
        )
        ),
    );
  }
}