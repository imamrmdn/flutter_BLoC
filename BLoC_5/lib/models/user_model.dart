import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id, email, name, avatar;

  User({
    this.id,
    this.email,
    this.name,
    this.avatar,
  });

  factory User.createUser(Map<String, dynamic> data) {
    return User(
      id: data['id'].toString(),
      email: data['email'],
      name: data['first_name'] + ' ' + data['last_name'],
      avatar: data['avatar'],
    );
  }

  static Future<List<User>> getUserFromAPI(int page) async {
    String url = 'https://reqres.in/api/users?page=$page';

    var result = await http.get(url);
    var jsonObj = jsonDecode(result.body);

    List<dynamic> listUser = (jsonObj as Map<String, dynamic>)['data'];

    var userList = listUser
        .map<User>((item) => User(
            id: item['id'].toString(),
            name: item['first_name'] + ' ' + item['last_name'],
            email: item['email'],
            avatar: item['avatar']))
        .toList();

    return userList;
  }
}
