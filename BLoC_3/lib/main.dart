import 'package:BLoC_3/bloc/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<ColorBloc>(
        create: (context) => ColorBloc(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hydrated BLoC Example'),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, changeColor) => AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 200,
            height: 200,
            color: changeColor,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.teal,
            onPressed: () {
              BlocProvider.of<ColorBloc>(context).add(ColorEvent.to_teal);
            },
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              BlocProvider.of<ColorBloc>(context).add(ColorEvent.to_lightBlue);
            },
          ),
        ],
      ),
    );
  }
}
