import 'package:BLoC_5/bloc/user_bloc.dart';
import 'package:BLoC_5/ui/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM Architecture, ListView Builder + BLoC'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(15),
        child: Container(
          child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            if (state is UserUninitialized) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ));
            } else {
              UserLoaded userLoaded = state as UserLoaded;
              return ListView.builder(
                itemCount: userLoaded.users.length,
                itemBuilder: (context, index) => UserCard(
                  user: userLoaded.users[index],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
