import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './newsmodel.dart';
import './zztechdetailScreen.dart';

class TechItem extends StatefulWidget {
  @override
  _TechItemState createState() => _TechItemState();
}

class _TechItemState extends State<TechItem> {
 

  @override
  Widget build(BuildContext context) {
    final newsitem = Provider.of<NewsModel>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              TechDetailScreen.routeName,
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