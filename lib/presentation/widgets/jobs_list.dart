import 'package:flutter/material.dart';
import 'package:job_search/domain/models/job.dart';
import 'package:job_search/presentation/widgets/job_card.dart';

class JobsList extends StatelessWidget {
  const JobsList({
    super.key,
    required this.jobs,
  });

  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (BuildContext context, int index) {
        return JobCard(job: jobs[index],);
      },
    );
  }
}
