import 'package:flutter/material.dart';

class ChangeLogCard extends StatelessWidget {
  final String updatedBy;
  final String updatedAt;
  const ChangeLogCard({
    super.key,
    required this.updatedBy,
    required this.updatedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        color: const Color(0xFFCBF5FC), // Background color
        elevation: 0, // Remove shadow to match the flat design
        child: Padding(
          padding: const EdgeInsets.all(12), // Padding inside the card
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    updatedBy,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    updatedAt,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  /* Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          /*  String filePath = attachment["filePath"]!;
                          _launchPDF(filePath); // Launch the PDF */
                        },
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Icon(
                            Icons.file_open,
                            color: Color.fromRGBO(26, 140, 255, 1.0),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Delete Attachment'),
                              content: const Text(
                                  'Do you wanna delete this attachment ?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ), */
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
