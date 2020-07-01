//import 'package:BLoC_5/models/user_model.dart';
import 'package:BLoC_5/bloc/user_bloc.dart';
import 'package:BLoC_5/models/user_model.dart';
import 'package:BLoC_5/ui/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(1);
  }

  @override
  Widget build(BuildContext context) {
    User user = User();
    print(user.name);
    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM Architecture'),
      ),
      body: BlocBuilder<UserBloc, List<User>>(
        builder: (context, listUser) => ListView.builder(
            itemCount: listUser.length,
            itemBuilder: (context, index) => (listUser is UninitializedUser)
                ? Container()
                : UserCard(user: user)),
      ),
    );
  }
}
