import 'package:BLoC_5/models/user_model.dart';
import 'package:BLoC_5/ui/pages/second_page.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;

  UserCard({
    this.user,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondPage()));
      },
      child: Card(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 75.0,
                height: 75.0,
                padding: EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.avatar),
                  ),
                ),
              ),
              SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('id: ${user.id}'),
                  Text('Nama: ${user.name}'),
                  Text('Email: ${user.email}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
