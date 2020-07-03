import 'dart:convert';
import 'package:http/http.dart' as http;

class Article {
  String id, title, body;

  Article({
    this.id,
    this.title,
    this.body,
  });

  //factory method
  factory Article.createArticle(Map<String, dynamic> data) {
    return Article(
      id: data['id'],
      title: data['title'],
      body: data['body'],
    );
  }

  //function get to API
  static Future<List<Article>> connectToAPI(int start, int limit) async {
    String url =
        'https://jsonplaceholder.typicode.com/posts?_start=$start&_limit=$limit';

    var result = await http.get(url);
    var jsonObject = jsonDecode(result.body) as List;

    //merubah result.body atau jsonObject menjadi List<Article>
    var jsonObj = jsonObject
        .map<Article>((item) => Article(
            id: item['id'].toString(),
            title: item['title'],
            body: item['body']))
        .toList();

    return jsonObj;
  }
}
