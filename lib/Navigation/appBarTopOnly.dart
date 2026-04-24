import 'package:flutter/material.dart';

class AppBarTopOnly extends StatelessWidget {
  const AppBarTopOnly({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(5),
        child: AppBar(
          backgroundColor: Color(0xFF00004C),
          // Fixed custom color
        ),
      ),
    );
  }

  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(68);
}
