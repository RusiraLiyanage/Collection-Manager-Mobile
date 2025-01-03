import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps/flutter_steps.dart';

class NewJob extends StatelessWidget {
  const NewJob({super.key});

  @override
  Widget build(BuildContext context) {
    List<Steps> basicSteps = [
      ...List.generate(
        3,
        (i) => Steps(
          title: 'Step ${i + 1}',
          subtitle: 'Subtitle',
          isActive: i < 1 ? true : false,
          leading: i < 0
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0), // Add space
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green,
                    size: 32,
                  ),
                )
              : null,
        ),
      )
    ];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        top: 10.0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: FittedBox(
                            child: Image.asset(
                              width: 25,
                              height: 25,
                              "assets/images/icons/X.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1.0,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New Job",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF156CC9),
                            ),
                          ),
                          SizedBox(width: 10),
                          FittedBox(
                            child: Image.asset(
                              "assets/images/icons/newJobIcon.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          /* FlutterSteps(
            inactiveColor: Colors.grey,
            steps: basicSteps,
            activeColor: Colors.blue,
            titleFontSize: 12,
            showSubtitle: false,
            stepLineRadius: 500,
            activeStepLineColor: Colors.blue,
          ), */
          // Form or Content
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
