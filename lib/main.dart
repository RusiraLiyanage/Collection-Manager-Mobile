import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';
import 'package:project_code_blue/SplashScreen/splashScreen.dart';
import 'package:project_code_blue/screens/OnsiteJobs/Controller/Feature/jobs_api.dart';
import 'package:project_code_blue/screens/OnsiteJobs/Controller/Feature/jobs_notifier.dart';
import 'package:project_code_blue/screens/OnsiteJobs/Controller/Feature/utils/api/api_service.dart';
import 'package:provider/provider.dart';
import './AppState/appState.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized(); // Ensure plugins are initialized
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppState(),
        ),
        ChangeNotifierProvider(
          create: (_) => JobsNotifier(jobsApi: JobsApi(dio: ApiService().dio)),
        ),
      ],
      child: GlobalLoaderOverlay(
        overlayColor: Colors.black.withOpacity(0.30),
        useDefaultLoading: false,
        overlayWidgetBuilder: (_) {
          //ignored progress for the moment

          return Center(
              child: Padding(
            padding: const EdgeInsets.only(
              top: 145.0,
            ),
            child: SizedBox(
              width: 30, // Set your desired size
              height: 30,
              child: CupertinoActivityIndicator(
                radius: 20.0,
                color: AppColors.primary, // default is 10.0
              ),
            ),
          ));
        },
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, primaryColor: Colors.white),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
