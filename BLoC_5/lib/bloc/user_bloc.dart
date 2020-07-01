import 'package:BLoC_5/models/user_model.dart';
import 'package:bloc/bloc.dart';

class UserBloc extends Bloc<int, List<User>> {
  @override
  List<User> get initialState => [UninitializedUser()];

  @override
  Stream<List<User>> mapEventToState(int event) async* {
    try {
      List<User> user = await User.getUserFromAPI(event);
      yield user;
    } catch (e) {
      print(e);
    }
  }
}
