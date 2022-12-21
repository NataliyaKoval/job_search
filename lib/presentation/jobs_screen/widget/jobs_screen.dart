import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_search/domain/models/job.dart';
import 'package:job_search/domain/repository/jobs_repository.dart';
import 'package:job_search/presentation/jobs_screen/bloc/jobs_screen_bloc.dart';
import 'package:job_search/presentation/jobs_screen/usecase/get_jobs_usecase.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobsScreenBloc(
        getJobsUsecase: GetJobsUsecase(
          repository: context.read<JobsRepository>(),
        ),
      )..add(GetAllJobs()),
      child: BlocBuilder<JobsScreenBloc, JobsScreenState>(
        builder: (BuildContext context, JobsScreenState state) {
          if (state is JobsScreenLoaded) {
            final List<Job> jobs = state.jobsList;
            return ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: jobs.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(jobs[index].title);
              },
            );
          } else if (state is JobsScreenError) {
            return const Text('JobsScreenError');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
