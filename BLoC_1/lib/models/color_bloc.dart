import 'dart:async';
import 'package:flutter/material.dart';

//untuk membuat jenis jenis Color Event
enum ColorEvent { to_teal, to_lightRed }

//buat class BLoC nya
class ColorBloc {
  //variabel menyimpan statenya dalam hal ini adalah warna
  Color _color = Colors.teal;

  //color event
  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  //color state
  StreamController<Color> _stateController =
      StreamController<Color>.broadcast();
  StreamSink<Color> get _stateSink => _stateController.sink;
  Stream<Color> get stateStream => _stateController.stream.asBroadcastStream();

  //method mapEventToState
  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.to_teal) {
      _color = Colors.teal;
    } else {
      _color = Colors.red[200];
    }

    _stateSink.add(_color);
  }

  ColorBloc() {
    //untuk memasangkan stream nya event ke mapEventToState
    _eventController.stream.listen(_mapEventToState);
  }

  //fungsi untuk membereskan stream" diatas, ketika kita membuat stream controller
  //itu akan memakan memori jadi kalau kita sudah tidak pakai lagi, misal si BLoC ini sudah selesai
  //si Color BLoC ini harus di dispose, kalau tidak kan terus memakan memori
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
