import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

enum ColorEvent { to_teal, to_lightBlue }

class ColorBloc extends HydratedBloc<ColorEvent, Color> {
  @override
  Color get initialState => super.initialState ?? Colors.teal;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    yield (event == ColorEvent.to_teal) ? Colors.teal : Colors.lightBlue;
  }

  @override
  //ketika aplikasi dijalankan dia akan meload data terakhir yg berupa json
  Color fromJson(Map<String, dynamic> json) {
    try {
      return Color(json['color'] as int);
    } catch (_) {
      throw UnimplementedError();
    }
  }

  @override
  //ketika melakukan perubahan terhadap state akan disimpan lg dlm bentuk json(menyimpan color dalam bentun int)
  Map<String, int> toJson(Color state) {
    try {
      return {'color': state.value};
    } catch (_) {
      throw UnimplementedError();
    }
  }
}
