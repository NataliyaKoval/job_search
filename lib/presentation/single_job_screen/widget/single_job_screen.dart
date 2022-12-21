import 'package:flutter/material.dart';
import 'package:job_search/domain/models/job.dart';

class SingleJobScreen extends StatelessWidget {
  const SingleJobScreen({
    Key? key,
    required this.job,
  }) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(job.title),),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                job.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                job.city,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(job.description),
            ],
          ),
        ),
      ),
    );
  }
}
