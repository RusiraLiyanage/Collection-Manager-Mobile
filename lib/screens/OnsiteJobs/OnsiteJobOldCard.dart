import 'package:flutter/material.dart';

class OnsiteJobOldCard extends StatelessWidget {
  const OnsiteJobOldCard({
    super.key,
    required this.job,
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
                  color: Color(0xFF01B4D2),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),

          // Center-aligned icon
          Expanded(
            flex: 1, // Adjust the flex value to control space distribution
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(iconPath, height: 24),
            ),
          ),

          // Right-aligned value
          Expanded(
            flex: 4, // Adjust the flex value to control space distribution
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final Map<String, String> job;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left-aligned title
                Expanded(
                  flex:
                      3, // Adjust the flex value to control space distribution
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        FittedBox(
                          child: Image.asset(
                            "assets/images/icons/threeDots.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: FittedBox(
                            child: Image.asset(
                              "assets/images/icons/eye_icon.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Center-aligned icon
                Expanded(
                  flex:
                      5, // Adjust the flex value to control space distribution
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Text("Job Status"),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: const Text(
                            'Draft',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Right-aligned value
                Expanded(
                  flex:
                      3, // Adjust the flex value to control space distribution
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FittedBox(
                          child: Image.asset(
                            'assets/images/icons/document_icon.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width:
                              1, // Space between document icon and the number
                        ),
                        Text(
                          job["jobNumber"]!,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            // Content Rows
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Date / Time',
                value: job["dateTime"]!),
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Client',
                value: job["client"]!),
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Authorized Rep',
                value: job["rep"]!,
                isBold: false),
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'location',
                value: job["location"]!),
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Service',
                value: job["service"]!),
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Callout Job',
                value: job["callout"]!),
          ],
        ),
      ),
    );
  }
}
