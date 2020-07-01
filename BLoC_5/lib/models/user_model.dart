import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String email;
  String name;
  String avatar;

  User({
    this.id,
    this.email,
    this.name,
    this.avatar,
  });

  factory User.createUser(Map<String, dynamic> data) {
    return User(
      id: data['id'].toString(),
      name: data['nama'],
      email: data['first_name'] + ' ' + data['last_name'],
      avatar: data['avatar'],
    );
  }

  static Future<List<User>> getUserFromAPI(int page) async {
    String url = 'https://reqres.in/api/users?page=$page';

    var result = await http.get(url);
    var jsonObj = jsonDecode(result.body);

    List<dynamic> listUser = (jsonObj as Map<String, dynamic>)['data'];

    List<User> users = [];
    for (int i = 0; i < listUser.length; i++) {
      users.add(User.createUser(listUser[i]));
    }

    return users;
  }
}

//untuk digunakan di class bloc
class UninitializedUser extends User {
  //
}
