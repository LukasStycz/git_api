import 'package:flutter/material.dart';
import 'package:git_api/git_api_cubit/git_api_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_api/pages/home_page.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => GitApiCubit(),
       child: const HomePage(),
      ),
    );
  }
}
