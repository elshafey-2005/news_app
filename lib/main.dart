import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uses_app/home_page.dart';
import 'package:uses_app/cubit/news_cubit.dart';
import 'package:uses_app/news_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => NewsCubit(NewsService())..fetchNews(),
        child: const HomePage(),
      ),
    );
  }
}
