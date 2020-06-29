import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'models/text_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.pink),
      ),
      home: BlocProvider<TextBloc>(
        create: (context) => TextBloc(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextBloc bloc = BlocProvider.of<TextBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC with flutter_bloc: ^4.0.1'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.pink,
            onPressed: () {
              bloc.add(TextEvent.to_pink);
            },
            child: Icon(Icons.refresh),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 40,
          ),
          FloatingActionButton(
            backgroundColor: Colors.teal,
            onPressed: () {
              bloc.add(TextEvent.to_teal);
            },
            child: Icon(Icons.replay),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<TextBloc, Text>(
              builder: (context, currenttext) => currenttext,
            ),
          ],
        ),
      ),
    );
  }
}
