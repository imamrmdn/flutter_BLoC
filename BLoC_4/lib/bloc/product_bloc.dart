//import 'package:BLoC_4/dataSource/json_static.dart';
import 'package:BLoC_4/dataSource/json_static.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class Product {
  String judul;
  String jawaban;

  Product({
    this.judul = '',
    this.jawaban = '',
  });
}

class ProductBloc extends Bloc<int, List<Product>> {
  @override
  List<Product> get initialState => [];

  @override
  Stream<List<Product>> mapEventToState(int event) async* {
    final Random random = Random();
    var change = random.nextInt(6);
    var changes = random.nextInt(5);
    var changess = random.nextInt(4);
    List<Product> produk = [];
    produk
      ..add(
        Product(
          judul: DataSource.questionAnswers[change]['Judul'],
          jawaban: DataSource.questionAnswers[changess]['jawaban'],
        ),
      )
      ..add(
        Product(
          judul: DataSource.questionAnswers[changes]['Judul'],
          jawaban: DataSource.questionAnswers[changes]['jawaban'],
        ),
      )
      ..add(
        Product(
          judul: DataSource.questionAnswers[changess]['Judul'],
          jawaban: DataSource.questionAnswers[changess]['jawaban'],
        ),
      )
      ..add(
        Product(
          judul: DataSource.questionAnswers[changes]['Judul'],
          jawaban: DataSource.questionAnswers[change]['jawaban'],
        ),
      );

    yield produk;
  }
}
