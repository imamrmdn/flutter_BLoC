import 'package:BLoC_8/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter BLoC with Bloc Extension'),
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, counterState) => Text(
              counterState.value.toString(),
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(Decrement());
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: '0',
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(Increment());
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
