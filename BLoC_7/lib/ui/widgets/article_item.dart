import 'package:BLoC_7/models/article_model.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  final TextStyle textStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  ArticleItem({this.article});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(article.id),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${article.title}.', style: textStyle),
                Text('${article.body}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
