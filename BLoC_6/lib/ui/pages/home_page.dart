import 'package:BLoC_6/bloc/color_bloc.dart';
import 'package:BLoC_6/bloc/number_bloc.dart';
import 'package:BLoC_6/ui/pages/draft_page.dart';
import 'package:BLoC_6/ui/pages/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color colorWhite = Colors.white;
    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) => DraftPage(
        title: Text('Multi-BLoC in MultiPage'),
        backgroundColor: color,
        bodyWidget: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<NumberBloc, int>(
                builder: (context, number) => Text(
                  '$number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: color,
                  ),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                color: color,
                shape: StadiumBorder(),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.repeat,
                      color: colorWhite,
                    ),
                    Text(
                      'Click to change color',
                      style: TextStyle(color: colorWhite),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
