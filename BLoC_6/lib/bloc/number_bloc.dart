import 'package:hydrated_bloc/hydrated_bloc.dart';

class NumberBloc extends HydratedBloc<int, int> {
  @override
  int get initialState => super.initialState ?? 0;

  @override
  Stream<int> mapEventToState(int event) async* {
    yield event;
  }

  @override
  int fromJson(Map<String, dynamic> json) {
    try {
      return json['number'];
    } catch (_) {
      throw UnimplementedError();
    }
  }

  @override
  Map<String, int> toJson(int state) {
    try {
      return {'number': state};
    } catch (_) {
      throw UnimplementedError();
    }
  }
}
