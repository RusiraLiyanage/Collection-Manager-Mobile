import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class AttachmentCard extends StatelessWidget {
  final Map<String, String> attachment;
  const AttachmentCard({super.key, required this.attachment});

  Future<void> _launchPDF(String filePath) async {
    // Check if permission is granted
    PermissionStatus status = await Permission.storage.request();

    if (status.isGranted) {
      // Ensure the file path is properly encoded and prefixed with 'file://'
      String encodedFilePath = Uri.encodeFull(filePath);
      Uri uri = Uri.parse('file://$encodedFilePath');

      if (await canLaunch(uri.toString())) {
        await launch(uri.toString());
      } else {
        print("Could not open the file.");
      }
    } else {
      print("Storage permission is not granted.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  attachment["attachmentName"]!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${attachment["uploadedAt"]!}",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        String filePath = attachment["filePath"]!;
                        _launchPDF(filePath); // Launch the PDF
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
                            backgroundColor: Colors.white,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
