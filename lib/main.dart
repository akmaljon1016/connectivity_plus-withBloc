import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/internet_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => InternetBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:Scaffold(
        appBar: AppBar(
          title: Text("Flutter"),
        ),
        body: Container(
          child: BlocListener<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is OnConnectedState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.connectionType.name.toString())));
              } else if (state is OnNotConnectedState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Not Connected")));
              }
            },
            child: Container(),
          ),
        ),
      ) ,
    );
  }
}
