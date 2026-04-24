import 'package:flutter/material.dart';
import 'package:project_code_blue/screens/OnsiteJobs/Controller/Feature/utils/enums.dart';

abstract class BaseNotifier extends ChangeNotifier {
  UiState uiState = UiState.pending;
}
