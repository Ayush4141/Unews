import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './newsList.dart';
import './zexamitem.dart';
class Exams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsdata = Provider.of<NewsList>(context);
    final news = newsdata.exams;
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: news.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: news[i],
        child: ExamsItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 2/1,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
    );
  }
}