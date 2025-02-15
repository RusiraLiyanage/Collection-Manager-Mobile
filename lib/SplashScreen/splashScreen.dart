import 'package:flutter/material.dart';
import 'package:project_code_blue/tabs/tabs_page.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Hide bottom navigation bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    // Navigate to TabsPage after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      // Restore bottom navigation bar when leaving splash screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TabsPage(
            selectedIndex: 0,
            navigationMethod: "app_startup",
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(5),
        child: AppBar(
          backgroundColor: const Color(0xFF00004C), // Fixed custom color
          elevation: 0, // Remove shadow for a cleaner look
        ),
      ),
      body: Container(
        color: const Color(0xFF2C7796), // Background color
        width: double.infinity, // Ensures the container takes full width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(), // Pushes content to the middle
            // Main Logo
            Center(
              child: Image.asset(
                'assets/images/icons/splash_icon_double.png',
                height: 120, // Adjust size as needed
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20), // Add spacing between logo and text
            const Spacer(), // Push the "Powered by" section to the bottom
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Image.asset(
                  'assets/images/icons/poweredBy_SA_splash.png',
                  height: 40, // Adjust size as needed
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
