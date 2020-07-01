//import 'package:BLoC_4/dataSource/json_static.dart';
import 'package:BLoC_4/dataSource/json_static.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    List<Product> produk = [];
    produk.add(
      Product(
        judul: DataSource.questionAnswers[5]['Judul'],
        jawaban: DataSource.questionAnswers[2]['jawaban'],
      ),
    );

    yield produk;
  }
}
