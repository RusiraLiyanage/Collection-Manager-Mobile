import 'package:flutter/material.dart';
import 'package:project_code_blue/screens/ClientManagement/NewClient/Notes/editNote.dart';
import 'package:project_code_blue/screens/ClientManagement/NewClient/Notes/newNote.dart';

class NoteCard extends StatelessWidget {
  final Map<String, String> note;
  const NoteCard({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /* showDialog(
          context: context,
          builder: (context) => EditNote(
            subject: note['subject']!,
            noteText: note['noteText']!,
          ),
        ); */
      },
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
                    note["title"]!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Created by ${note["creator"]!}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${note["uploadedAt"]!}",
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
                          showDialog(
                            context: context,
                            builder: (context) => EditNote(
                              subject: note['subject']!,
                              noteText: note['noteText']!,
                            ),
                          );
                        },
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Icon(
                            Icons.edit,
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
                              title: const Text('Delete Note'),
                              content:
                                  const Text('Do you wanna delete this note ?'),
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
      ),
    );
  }
}
