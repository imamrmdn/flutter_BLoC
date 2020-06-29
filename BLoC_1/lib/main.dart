import 'package:BLoC_1/models/color_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ColorBloc bloc = ColorBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //backgroundColor: Colors.white,
          title: StreamBuilder(
        initialData: Colors.teal,
        stream: bloc.stateStream,
        builder: (context, snapshot) => Text(
          'BLoC Without Library',
          style: TextStyle(color: snapshot.data),
        ),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              initialData: Colors.teal,
              stream: bloc.stateStream,
              builder: (context, snapshot) => AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    bottomRight: const Radius.circular(20.0),
                  ),
                  color: snapshot.data,
                ),
                duration: Duration(milliseconds: 1),
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 3,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: Colors.teal,
                  onPressed: () {
                    bloc.eventSink.add(ColorEvent.to_teal);
                  },
                  child: Icon(Icons.ac_unit),
                ),
                SizedBox(width: 10.0),
                FloatingActionButton(
                  backgroundColor: Colors.red[200],
                  onPressed: () {
                    bloc.eventSink.add(ColorEvent.to_lightRed);
                  },
                  child: Icon(Icons.adjust),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
