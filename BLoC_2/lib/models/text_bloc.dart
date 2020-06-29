import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

enum TextEvent { to_pink, to_teal }

class TextBloc extends Bloc<TextEvent, Text> {
  Text _textData;

  @override
  Text get initialState => Text('Learn BLoC');

  @override
  Stream<Text> mapEventToState(TextEvent event) async* {
    _textData = (event == TextEvent.to_pink)
        ? Text('Learn BLoC PINK')
        : Text('Data Berhasil Berubah');

    yield _textData;
  }
}
