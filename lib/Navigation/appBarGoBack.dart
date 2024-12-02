import 'package:flutter/material.dart';

class AppBarGoBack extends StatelessWidget implements PreferredSizeWidget {
  const AppBarGoBack({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 68,
      backgroundColor: Color(0xFF2C7796),
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
          // Close the drawer (if open) and navigate back
          final scaffoldState = Scaffold.maybeOf(context);
          if (scaffoldState?.isDrawerOpen ?? false) {
            scaffoldState?.closeDrawer(); // Close the drawer if it's open
          }
          // Navigate back when pressed
          Navigator.of(context).pop();
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
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(68);
}
