import 'package:dio/dio.dart';
import 'package:job_search/data/entity/jobs_response_entity.dart';
import 'package:retrofit/retrofit.dart';

// flutter pub run build_runner build
part 'api_client.g.dart';

@RestApi(baseUrl: 'http://3.75.134.87/flutter/v1/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/jobs')
  Future<JobsResponseEntity> getJobs();
}