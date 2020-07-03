import 'package:BLoC_7/bloc/article_bloc.dart';
import 'package:BLoC_7/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<ArticleBloc>(
        create: (context) =>
            ArticleBloc(ArticleUnintialized())..add(ArticleEvent()),
        child: HomePage(),
      ),
    );
  }
}
