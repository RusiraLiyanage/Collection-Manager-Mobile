import 'package:flutter/material.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';
import 'package:project_code_blue/tabs/tabs_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF00004C), // your purple color
        elevation: 0, // No shadow
        automaticallyImplyLeading: false, // No back button
        toolbarHeight: 3, // Make it thin like your screenshot
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  3, // app bar height subtracted
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: AppColors.primary,
                    width: double.infinity,
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/images/collectionManagerLogo.png',
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // --- SIGN IN TITLE ---
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3C7D99), // Same blue shade
                    ),
                  ),
                  const SizedBox(height: 70),

                  // --- USERNAME FIELD ---
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                        prefixIcon:
                            Icon(Icons.person, color: AppColors.primary),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.primary, width: 1.5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.primary, width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // --- PASSWORD FIELD ---
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock, color: AppColors.primary),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.primary, width: 1.5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.primary, width: 2),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // --- FORGOT PASSWORD LINK ---
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 32.0, right: 32.0, top: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // --- LOGIN BUTTON ---
                  SizedBox(
                    width: 220,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TabsPage(
                              selectedIndex: 0,
                              navigationMethod: "app_startup",
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary
                            .withOpacity(0.8), // Light blue button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Image.asset("assets/images/icons/Powered by 2.png"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
