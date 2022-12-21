import 'package:flutter/material.dart';
import 'package:job_search/presentation/jobs_screen/widget/jobs_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const JobsScreen(),
    );
  }
}
