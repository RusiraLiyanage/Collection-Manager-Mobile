import 'package:flutter/material.dart';

class NewJobAndroid extends StatefulWidget {
  final ScrollController scrollController;
  const NewJobAndroid({super.key, required this.scrollController});

  @override
  State<NewJobAndroid> createState() => _NewJobAndroidState();
}

class _NewJobAndroidState extends State<NewJobAndroid> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.scrollController,
      children: <Widget>[
        const SizedBox(height: 20), // Add some top padding
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 1.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 25,
                height: 25,
                child: Image.asset(
                  "assets/images/icons/X.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.black,
          thickness: 1.0,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "New Job",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF156CC9),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                child: Image.asset(
                  "assets/images/icons/newJobIcon.png",
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: Scrollbar(
          thumbVisibility: true,
          interactive: true,
          trackVisibility: true,
          controller: widget.scrollController,
          child: const SingleChildScrollView(
            child: Column(
              children: [
                Text("Here we go"),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
