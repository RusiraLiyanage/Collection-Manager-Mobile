import 'package:dio/dio.dart';
import 'package:project_code_blue/screens/OnsiteJobs/Controller/Feature/models/job_model.dart';
import 'package:project_code_blue/screens/OnsiteJobs/Controller/Feature/utils/utils.dart';

class JobsApi {
  final Dio dio;

  JobsApi({required this.dio});

  Future<BaseResponseModel<List<JobModel>>> getJobs() async {
    try {
      final response = await dio.get(ApiConstants.getJobsEndpoint);
      return BaseResponseModel<List<JobModel>>.fromJson(
        response.data,
        (data) => (data as List).map((job) => JobModel.fromJson(job)).toList(),
      );
    } on DioException catch (e) {
      String? errMsg;
      if (e.message != null) {
        errMsg = e.message!;
      }
      if (e.error != null && e.error! is String) {
        errMsg = e.error! as String;
      }
      return BaseResponseModel<List<JobModel>>(
        error: errMsg ?? e.toString(),
        message: errMsg,
        data: [],
      );
    }
  }
}
