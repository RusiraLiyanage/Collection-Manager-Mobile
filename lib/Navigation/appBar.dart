import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:project_code_blue/AppState/appState.dart';
import 'package:project_code_blue/ColorSchemas/AppColors.dart';
import 'package:project_code_blue/screens/Notifications/notifications.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Blurred Background
      Positioned.fill(
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Blur effect
            child: Container(
              color: Colors.transparent, // Keep it transparent to apply blur
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
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 0,
              child: IconButton(
                icon: Icon(
                  Icons.menu_sharp,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            );
          },
        ),
        elevation: 0.0,
        actions: <Widget>[
          Consumer<AppState>(
            builder: (context, appState, child) {
              return IconBadge(
                icon: Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.white,
                  weight: 50,
                  size: 28,
                ),
                itemCount: appState.noNotifications,
                badgeColor: Colors.redAccent.withOpacity(0.6),
                itemColor: Colors.white,
                maxCount: 99,
                hideZero: false,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notifications()),
                  );
                },
              );
            },
          ),
          IconButton(
              icon: Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {}),
        ],
      ),
    ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(68);
}
