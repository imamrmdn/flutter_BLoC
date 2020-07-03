import 'package:BLoC_7/bloc/article_bloc.dart';
import 'package:BLoC_7/ui/widgets/article_item.dart';
import 'package:BLoC_7/ui/widgets/shimmer_load.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController controller = ScrollController();

  void onScroll() {
    double maxScroll = controller.position.maxScrollExtent;
    double currentScroll = controller.position.pixels;

    if (currentScroll == maxScroll) {
      BlocProvider.of<ArticleBloc>(context).add(ArticleEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    controller.addListener(onScroll);
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite List / Pagination with BLoC'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: Container(
          child: BlocBuilder<ArticleBloc, ArticleState>(
            builder: (context, state) {
              if (state is ArticleUnintialized) {
                return ShimmerLoad();
              } else {
                ArticleLoaded articleLoaded = state as ArticleLoaded;
                return ListView.builder(
                  controller: controller,
                  itemCount: (articleLoaded.hasReachedMax)
                      ? articleLoaded.articles.length
                      : articleLoaded.articles.length + 1,
                  itemBuilder: (context, index) =>
                      (index < articleLoaded.articles.length)
                          ? ArticleItem(
                              article: articleLoaded.articles[index],
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
