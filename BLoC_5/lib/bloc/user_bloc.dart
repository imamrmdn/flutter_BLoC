import 'package:BLoC_5/models/user_model.dart';
import 'package:bloc/bloc.dart';

class UserEvent {}

abstract class UserState {}

class UserUninitialized extends UserState {}

//ketika meload data
class UserLoaded extends UserState {
  List<User> users;

  UserLoaded({this.users});

  UserLoaded copyWithLoaded({List<User> user}) {
    return UserLoaded(
      users: user ?? this.users,
    );
  }
}

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => UserUninitialized();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    List<User> users;
    if (state is UserUninitialized) {
      users = await User.getUserFromAPI(2);
      yield UserLoaded(
        users: users,
      );
    } else {
      throw UnimplementedError();
    }
  }
}
