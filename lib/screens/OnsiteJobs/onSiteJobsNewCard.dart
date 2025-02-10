import 'package:flutter/material.dart';

class OnsiteJobsNewCard extends StatelessWidget {
  const OnsiteJobsNewCard({
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
          title == "Job Status"
              ? Padding(
                  padding: const EdgeInsets.only(right: 95.0),
                  child: IntrinsicWidth(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.yellow,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 3),
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight:
                                isBold ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Expanded(
                  flex:
                      4, // Adjust the flex value to control space distribution
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

  final Map<String, String> job;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      color: Colors.white,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left-aligned title
                Row(
                  children: [
                    Text(
                      "Rail NSW",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),

                // Right-aligned value
                Row(
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
            // Content Rows
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Authorized Rep',
                value: job["rep"]!),
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Date / Time',
                value: job["dateTime"]!),
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Location',
                value: job["location"]!,
                isBold: false),
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Service',
                value: job["service"]!),
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Callout Job',
                value: job["callout"]!),
            _buildInfoRow(
                iconPath: 'assets/images/icons/dafault_icon.png',
                title: 'Job Status',
                value: job["jobStatus"]!),
          ],
        ),
      ),
    );
  }
}
