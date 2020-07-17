import 'package:flutter/material.dart';
import './newsmodel.dart';
import './newsList.dart';
import 'package:provider/provider.dart';

class AddNewsScreen extends StatefulWidget {

  static const routeName = '/add-news';


  @override
  _AddNewsScreenState createState() => _AddNewsScreenState();
}

class _AddNewsScreenState extends State<AddNewsScreen> {
  final _detailFocusNode = FocusNode();
  final _imageFocusNode = FocusNode();
  final _categoryFocusNode = FocusNode();
  final _detail2FocusNode = FocusNode();
  final _form = GlobalKey<FormState>();


  var _editednews = NewsModel(
    id: null,
    headline: null,
    detail: null,
    detail2: null,
    imageUrl: null,
    date: DateTime.now().toIso8601String().toString().substring(0,10),
    type: null,
  );

  var _initValues = {
    'headline': '',
    'detail': '',
    'detail2': '',
    'imageUrl': '',
    'date': DateTime.now().toIso8601String().toString().substring(0,10),
    'type': '',
  };

  var _isLoading = false;



  _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    Provider.of<NewsList>(context, listen: false).addProduct(_editednews);
    Navigator.of(context).pop();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add News'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          ),
        ],
      ),
      body: _isLoading
      ?Center(
        child: CircularProgressIndicator(),
      )
      :Padding(
        padding: const EdgeInsets.all(5),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _initValues['headline'],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'HeadLine'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_detailFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a HeadLine.';
                  }
                    return null;
                },
                onSaved: (value) {
                  _editednews = NewsModel(
                    headline: value,
                    detail: _editednews.detail,
                    detail2: _editednews.detail2,
                    imageUrl: _editednews.imageUrl,
                    date: _editednews.date,
                    id: _editednews.id,
                    type: _editednews.type,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['detail'],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Detail'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_detail2FocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a HeadLine.';
                  }
                    return null;
                },
                onSaved: (value) {
                  _editednews = NewsModel(
                    headline: _editednews.headline,
                    detail: value,
                    detail2: _editednews.detail2,
                    imageUrl: _editednews.imageUrl,
                    date: _editednews.date,
                    id: _editednews.id,
                    type: _editednews.type,
                  );
                },
              ),

              TextFormField(
                initialValue: _initValues['detail2'],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Detail2'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_categoryFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a HeadLine.';
                  }
                    return null;
                },
                onSaved: (value) {
                  _editednews = NewsModel(
                    headline: _editednews.headline,
                    detail: _editednews.detail,
                    detail2: value,
                    imageUrl: _editednews.imageUrl,
                    date: _editednews.date,
                    id: _editednews.id,
                    type: _editednews.type,
                  );
                },
              ),

              TextFormField(
                initialValue: _initValues['category'],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'category'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_imageFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a category.';
                  }
                    return null;
                },
                onSaved: (value) {
                  _editednews = NewsModel(
                    headline: _editednews.headline,
                    detail: _editednews.detail,
                    detail2: _editednews.detail2,
                    imageUrl: _editednews.imageUrl,
                    date: _editednews.date,
                    id: _editednews.id,
                    type: value,
                  );
                },
              ),
              
               TextFormField(
                initialValue: _initValues['imageUrl'],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'imageUrl'),
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) {
                  _saveForm();
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter an image URL.';
                  }
                  if (!value.startsWith('http') &&
                    !value.startsWith('https')) {
                      return 'Please enter a valid URL.';
                    }
                    if (!value.endsWith('.png') &&
                    !value.endsWith('.jpg') &&
                      !value.endsWith('.jpeg')) {
                        return 'Please enter a valid image URL.';
                      }
                    return null;
                  }, //validator
                    onSaved: (value) {
                      _editednews = NewsModel(
                        headline: _editednews.headline,
                        detail: _editednews.detail,
                        detail2: _editednews.detail2,
                        imageUrl: value,
                        date: _editednews.date,
                        id: _editednews.id,
                        type: _editednews.type,
                      );
                    },
             ),
            ],
            )
          ),
        ), 
    );
  }
}
