import 'package:BLoC_6/bloc/color_bloc.dart';
import 'package:BLoC_6/bloc/number_bloc.dart';
import 'package:BLoC_6/ui/pages/draft_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) => BlocBuilder<NumberBloc, int>(
        builder: (context, number) => DraftPage(
          floatingButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                heroTag: '0',
                backgroundColor: color,
                onPressed: () {
                  BlocProvider.of<NumberBloc>(context).add(number - 1);
                },
                child: Icon(Icons.exposure_neg_1),
              ),
              SizedBox(width: 10),
              FloatingActionButton(
                heroTag: '1',
                backgroundColor: color,
                onPressed: () {
                  BlocProvider.of<NumberBloc>(context).add(number + 1);
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
          title: Text('Change Color & Number Page'),
          backgroundColor: color,
          bodyWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BlocBuilder<NumberBloc, int>(
                builder: (context, number) => Text(
                  '$number',
                  style: TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold, color: color),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    left(),
                    right(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget right(BuildContext context) {
    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) => Expanded(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: Colors.greenAccent,
                  onPressed: () {
                    BlocProvider.of<ColorBloc>(context)
                        .add(ColorEvent.to_greenAccent);
                  },
                  shape: (color == Colors.greenAccent)
                      ? CircleBorder(
                          side: BorderSide(color: Colors.black, width: 2))
                      : CircleBorder(),
                ),
                RaisedButton(
                  color: Colors.redAccent,
                  onPressed: () {
                    BlocProvider.of<ColorBloc>(context)
                        .add(ColorEvent.to_redAccent);
                  },
                  shape: (color == Colors.redAccent)
                      ? CircleBorder(
                          side: BorderSide(color: Colors.black, width: 2))
                      : CircleBorder(),
                ),
                RaisedButton(
                  color: Colors.teal,
                  onPressed: () {
                    BlocProvider.of<ColorBloc>(context).add(ColorEvent.to_teal);
                  },
                  shape: (color == Colors.teal)
                      ? CircleBorder(
                          side: BorderSide(color: Colors.black, width: 2))
                      : CircleBorder(),
                ),
                RaisedButton(
                  color: Colors.lightBlue,
                  onPressed: () {
                    BlocProvider.of<ColorBloc>(context)
                        .add(ColorEvent.to_lightBlue);
                  },
                  shape: (color == Colors.lightBlue)
                      ? CircleBorder(
                          side: BorderSide(color: Colors.black, width: 2))
                      : CircleBorder(),
                ),
                RaisedButton(
                  color: Colors.purple,
                  onPressed: () {
                    BlocProvider.of<ColorBloc>(context)
                        .add(ColorEvent.to_purple);
                  },
                  shape: (color == Colors.purple)
                      ? CircleBorder(
                          side: BorderSide(color: Colors.black, width: 2))
                      : CircleBorder(),
                ),
                RaisedButton(
                  color: Colors.indigoAccent,
                  onPressed: () {
                    BlocProvider.of<ColorBloc>(context)
                        .add(ColorEvent.to_indigoAccent);
                  },
                  shape: (color == Colors.indigoAccent)
                      ? CircleBorder(
                          side: BorderSide(color: Colors.black, width: 2))
                      : CircleBorder(),
                ),
                RaisedButton(
                  color: Colors.pink[200],
                  onPressed: () {
                    BlocProvider.of<ColorBloc>(context).add(ColorEvent.to_pink);
                  },
                  shape: (color == Colors.pink[200])
                      ? CircleBorder(
                          side: BorderSide(color: Colors.black, width: 2))
                      : CircleBorder(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget left() {
    return Text('Scroll to Pick Color :');
  }
}
