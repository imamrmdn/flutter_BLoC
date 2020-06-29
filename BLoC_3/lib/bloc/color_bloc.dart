import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent { to_teal, to_lightBlue }

class ColorBloc extends Bloc<ColorEvent, Color> {
  @override
  Color get initialState => Colors.teal;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    yield (event == ColorEvent.to_teal) ? Colors.teal : Colors.lightBlue;
  }
}
