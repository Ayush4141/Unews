import 'package:flutter/material.dart';
import 'package:news121/advertisement.dart';

class Appdrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Toofan News App' , style: TextStyle(fontWeight: FontWeight.bold),),
            automaticallyImplyLeading: false,
          ),
          Divider(),
//          ListTile(
//            leading: Icon(Icons.shop),
//            title: Text('Place Your Advertisement'),
//            onTap: () {
//            Navigator.of(context).pushNamed(
//              Advertisement.routeName);
//            },
//          ),
//          Divider(),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Contact'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.developer_board),
            title: Text('Developer Info'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
