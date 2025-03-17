import 'package:flutter/material.dart';
import 'package:project_code_blue/pages/collectorsModal.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:project_code_blue/screens/OnsiteApprovals/onSiteApprovalModal.dart';

class OnsiteApprovalsNewCard extends StatelessWidget {
  final Map<String, String> approval;

  const OnsiteApprovalsNewCard({
    super.key,
    required this.approval,
  });

  Widget _buildTimeRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.blue.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required String iconPath,
    required String title,
    required String value,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left-aligned title
          Expanded(
            flex: 3, // Adjust the flex value to control space distribution
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          // Right-aligned value

          Expanded(
            flex: 4, // Adjust the flex value to control space distribution
            child: Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12.0,
          bottom: 12.0,
          left: 18.0,
          right: 25.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left-aligned title
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset(
                          "assets/images/icons/onSiteApprovalsIcon.png",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      approval["organization"]!,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // Right-aligned value
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showAdaptiveActionSheet(
                          bottomSheetColor: Color(0xFFEEF5F6),
                          context: context,
                          actions: <BottomSheetAction>[
                            BottomSheetAction(
                              title: const Text(
                                'Onsite Approval',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              onPressed: (_) {
                                Navigator.pop(
                                    context); // Close the bottom sheet
                                showDialog(
                                  context: context,
                                  barrierDismissible:
                                      false, // Prevent closing on backdrop tap
                                  builder: (context) => OnsiteApprovalModal(),
                                );
                              },
                            ),
                            BottomSheetAction(
                              title: const Text(
                                'Job Details',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: (_) {},
                            ),
                          ],
                          cancelAction: CancelAction(
                              title: const Text(
                            'Close',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )),
                        );
                      },
                      child: FittedBox(
                        child: Image.asset(
                          "assets/images/icons/threeDots.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        barrierDismissible:
                            false, // Prevent closing on backdrop tap
                        builder: (context) => CollectorsModal(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: FittedBox(
                          child: Image.asset(
                            "assets/images/icons/eye_icon.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 2),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.blue,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  "12345678",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Date',
                value: approval["date"]!),
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Approver',
                value: approval["approver"]!),
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Location',
                value: approval["location"]!),
            SizedBox(
              height: 10,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 3,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTimeRow(
                                  "Start Time", approval["startTime"]!),
                              _buildTimeRow("End Time", approval["endTime"]!),
                              SizedBox(
                                height: 10,
                              ),
                              _buildTimeRow(
                                  "Total Time", approval["totalTime"]!,
                                  isBold: true),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              "assets/images/icons/theClock.png", // Ensure the path is correct
                              width: 40,
                              height: 40,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
