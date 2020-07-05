import 'package:BLoC_5/models/user_model.dart';
import 'package:BLoC_5/ui/pages/second_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserCard extends StatefulWidget {
  final User user;

  UserCard({
    this.user,
  });

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> with TickerProviderStateMixin {
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
              CachedNetworkImage(
                imageUrl: "${widget.user.avatar}",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SpinKitPulse(
                        //value: downloadProgress.progress,
                        color: Colors.red[300],
                        controller: AnimationController(
                            vsync: this,
                            value: downloadProgress.progress,
                            duration: const Duration(milliseconds: 1200))),
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageBuilder: (context, imageProvider) => Container(
                  width: 75.0,
                  height: 75.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('id: ${widget.user.id}'),
                  Text('Nama: ${widget.user.name}'),
                  Text('Email: ${widget.user.email}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
