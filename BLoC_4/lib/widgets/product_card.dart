import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String judul;
  final String jawaban;
  const ProductCard({
    Key key,
    this.judul = '',
    this.jawaban = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(judul),
                SizedBox(height: 10.0),
                Text(
                  jawaban,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 5),
            ],
          ),
        ),
      ],
    );
  }
}
