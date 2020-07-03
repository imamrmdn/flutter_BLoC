import 'package:BLoC_7/models/article_model.dart';
import 'package:bloc/bloc.dart';

class ArticleEvent {}

abstract class ArticleState {}

//data pertama kali ditampilkan/initial data
class ArticleUnintialized extends ArticleState {}

//ketika sudah menload data
class ArticleLoaded extends ArticleState {
  List<Article> articles;
  bool hasReachedMax; //digunakan ketika data yg diload sudah max

  ArticleLoaded({
    this.articles,
    this.hasReachedMax,
  });

  //method utk copy ArticleLoaded dengan nilai/kembalianny ArticleLoaded dengan optional parameter
  ArticleLoaded copyWithLoaded({List<Article> articles, bool hasReachedMax}) {
    //mereturn ArticleLoaded yg baru
    return ArticleLoaded(
      //diisi dengan articles parameter kalau tidak null, kalau null diisi dengan List<Article> articles.
      articles: articles ?? this.articles,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc(ArticleState initialState) : super(initialState);

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    List<Article> articles;
    if (state is ArticleUnintialized) {
      articles = await Article.connectToAPI(0, 8);
      yield ArticleLoaded(
        articles: articles,
        hasReachedMax: false,
      );
    } else {
      //kalau belum pernah meload
      ArticleLoaded articleLoaded = state as ArticleLoaded;
      articles = await Article.connectToAPI(articleLoaded.articles.length, 8);

      //jika articles from api null/kosong
      yield (articles.isEmpty)
          //akan update hasReachedMax menjadi true
          ? articleLoaded.copyWithLoaded(hasReachedMax: true)
          //kalau articles from api tidak null/kosong
          : ArticleLoaded(
              articles: articleLoaded.articles + articles,
              hasReachedMax: false);
    }
    //throw UnimplementedError();
  }
}
