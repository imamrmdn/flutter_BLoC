import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

enum ColorEvent {
  to_greenAccent,
  to_redAccent,
  to_teal,
  to_lightBlue,
  to_purple,
  to_indigoAccent,
  to_pink,
}

class ColorBloc extends HydratedBloc<ColorEvent, Color> {
  @override
  Color get initialState => super.initialState ?? Colors.redAccent;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    yield (event == ColorEvent.to_greenAccent)
        ? Colors.greenAccent
        : (event == ColorEvent.to_redAccent)
            ? Colors.redAccent
            : (event == ColorEvent.to_teal)
                ? Colors.teal
                : (event == ColorEvent.to_lightBlue)
                    ? Colors.lightBlue
                    : (event == ColorEvent.to_purple)
                        ? Colors.purple
                        : (event == ColorEvent.to_indigoAccent)
                            ? Colors.indigoAccent
                            : Colors.pink[200];
  }

  @override
  Color fromJson(Map<String, dynamic> json) {
    try {
      return Color(json['color'] as int);
    } catch (_) {
      throw UnimplementedError();
    }
  }

  @override
  Map<String, int> toJson(Color state) {
    try {
      return {'color': state.value};
    } catch (_) {
      throw UnimplementedError();
    }
  }
}
