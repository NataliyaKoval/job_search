import 'package:flutter/material.dart';
import 'package:job_search/di/providers.dart';
import 'package:job_search/presentation/home_screen/widget/home_screen.dart';
import 'package:job_search/presentation/jobs_screen/widget/jobs_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Providers providers;

  @override
  void initState() {
    super.initState();
    providers = Providers();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers.providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
