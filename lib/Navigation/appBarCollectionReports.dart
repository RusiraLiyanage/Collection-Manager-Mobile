import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';

class AppBarGoBack2 extends StatelessWidget implements PreferredSizeWidget {
  const AppBarGoBack2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5),
        child: AppBar(
          backgroundColor: Color(0xFF00004C),
          // Fixed custom color
        ),
      ),
      body: Stack(
        children: [
          // Blurred Background
          Positioned.fill(
            child: ClipRRect(
              child: BackdropFilter(
                filter:
                    ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Blur effect
                child: Container(
                  color:
                      Colors.transparent, // Keep it transparent to apply blur
                ),
              ),
            ),
          ),
          AppBar(
            toolbarHeight: 68,
            backgroundColor: AppColors.primary.withOpacity(0.58),
            foregroundColor: Colors.transparent,
            title: Text(
              "Hi Rusira",
              style: TextStyle(
                fontSize: 21.5,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios, // Back icon
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {
                // Open the drawer back when pressed
                //Scaffold.of(context).openDrawer();
                Navigator.pop(context);
              },
            ),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(
                    Icons.account_circle_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(68);
}
