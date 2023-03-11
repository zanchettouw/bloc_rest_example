import 'package:bloc_rest_example/blocs/user_bloc/user_blocs.dart';
import 'package:bloc_rest_example/presentation/user/user_list.dart';
import 'package:bloc_rest_example/repo/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(
            UserRepository(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('The BloC App'),
        ),
        body: const UserList(),
      ),
    );
  }
}
