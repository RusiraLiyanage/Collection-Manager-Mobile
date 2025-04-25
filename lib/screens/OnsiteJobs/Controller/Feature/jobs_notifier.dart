import 'package:project_code_blue/screens/OnsiteJobs/Controller/Feature/jobs_api.dart';
import 'package:project_code_blue/screens/OnsiteJobs/Controller/Feature/models/job_model.dart';
import 'package:project_code_blue/screens/OnsiteJobs/Controller/Feature/utils/utils.dart';

class JobsNotifier extends BaseNotifier {
  final JobsApi jobsApi;

  JobsNotifier({required this.jobsApi});

  List<JobModel> jobs = [];
  String? errorMessage;

  Future<void> init() async {
    await getJobs();
  }

  Future<List<JobModel>> getJobs() async {
    uiState = UiState.loading;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    final response = await jobsApi.getJobs();
    if (response.isSuccess()) {
      jobs = response.data ?? [];
      uiState = UiState.success;
      notifyListeners();
      return jobs;
    } else {
      errorMessage = response.error;
      uiState = UiState.error;
      notifyListeners();
      return [];
    }
  }
}
