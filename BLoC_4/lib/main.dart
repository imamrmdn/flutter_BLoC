import 'package:BLoC_4/bloc/product_bloc.dart';
import 'package:BLoC_4/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dataSource/json_static.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<ProductBloc>(
        create: (context) => ProductBloc(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dataS = (DataSource.questionAnswers);
    print(dataS);
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Builder + BLoC'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              BlocProvider.of<ProductBloc>(context)
                  .add(DataSource.questionAnswers.length);
            },
            child: Text('Get Data'),
          ),
          BlocBuilder<ProductBloc, List<Product>>(
            builder: (context, produk) => Expanded(
              child: ListView.builder(
                itemCount: produk.length,
                itemBuilder: (context, index) {
                  var productCard = ProductCard(
                    judul: produk[index].judul,
                    jawaban: produk[index].jawaban,
                  );
                  return (productCard) == null
                      ? CircularProgressIndicator()
                      : productCard;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
