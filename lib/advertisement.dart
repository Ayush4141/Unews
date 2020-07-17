import 'package:flutter/material.dart';

class Advertisement extends StatelessWidget {
   static const routeName = '/advertisement-news';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: <Widget>[
          SizedBox(height: 120,),
          Container(
            child: Text('You can ad your advertisemnt at columns of the app in the form of an article'),
          ),
          SizedBox(height: 50,),
          Container(child: Text('Email : ashukla4141@gmail.com'),)
        ],
        ),
      )
      
    );
  }
}