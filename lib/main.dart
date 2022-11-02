import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/data_provider.dart';
import 'package:task/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataProvider(context),
        )
      ],
      child: MaterialApp(
        title: 'My APP',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
