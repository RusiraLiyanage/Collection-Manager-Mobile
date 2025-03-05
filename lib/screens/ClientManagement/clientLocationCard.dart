import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:project_code_blue/pages/collectorsModal.dart';
import 'package:project_code_blue/screens/OnsiteApprovals/onSiteApprovalModal.dart';

class ClientLocationCard extends StatelessWidget {
  final Map<String, String> location;
  const ClientLocationCard({
    super.key,
    required this.location,
  });

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
                Row(
                  children: [
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset("assets/images/icons/newLocation.png"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Left-aligned title
                            Row(
                              children: [
                                Text(
                                  "${location["locationName"]}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            // Right-aligned value
                          ],
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 1, vertical: 2),
                          child: Text(
                            location["locationAddress"]!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                                'Update Location',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              onPressed: (_) {
                                Navigator.pop(
                                    context); // Close the bottom sheet
                                /* showDialog(
                                  context: context,
                                  barrierDismissible:
                                      false, // Prevent closing on backdrop tap
                                  builder: (context) => OnsiteApprovalModal(),
                                ); */
                              },
                            ),
                            BottomSheetAction(
                              title: const Text(
                                'Clone Location',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: (_) {
                                Navigator.pop(context);
                              },
                            ),
                            BottomSheetAction(
                              title: const Text(
                                'Achieve Location',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: (_) {
                                Navigator.pop(context);
                              },
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
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),

            // Content Rows
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Site Contract',
                value: location["siteContract"]!),
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Email',
                value: location["email"]!),
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Mobile',
                value: location["mobile"]!,
                isBold: false),
          ],
        ),
      ),
    );
  }
}
