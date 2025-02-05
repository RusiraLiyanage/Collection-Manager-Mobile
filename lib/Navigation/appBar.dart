import 'dart:ui';

import 'package:flutter/material.dart';

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
        backgroundColor: Color(0xFF2C7796).withOpacity(0.52),
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
    ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(68);
}
