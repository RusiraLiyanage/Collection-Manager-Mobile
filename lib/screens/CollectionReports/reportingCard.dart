import 'package:flutter/material.dart';

class ReportingCard extends StatelessWidget {
  final Map<String, String> report;
  const ReportingCard({
    super.key,
    required this.report,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /* showDialog(
          context: context,
          builder: (context) => EditNote(
            subject: report['subject']!,
            noteText: report['noteText']!,
          ),
        ); */
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        color: Colors.white, // Background color
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
                    report["title"]!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Processed Donors ${report["noOfDonors"]!}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  report["sentByStatus"] == "Send By Collector"
                      ? Row(
                          children: [
                            Icon(
                              Icons.mail,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${report["sentByStatus"]!}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : report["sentByStatus"] == "Successfully Sent"
                          ? Row(
                              children: [
                                Icon(
                                  Icons.mail,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${report["sentByStatus"]!}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          : report["sentByStatus"] == "Error Sending Report"
                              ? Row(
                                  children: [
                                    Icon(
                                      Icons.mail,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${report["sentByStatus"]!}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  height: 0,
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
                          /* showDialog(
                            context: context,
                            builder: (context) => EditNote(
                              subject: report['subject']!,
                              noteText: report['noteText']!,
                            ),
                          ); */
                        },
                        child: Row(
                          children: [
                            Text(
                              report["location"]!,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                "assets/images/icons/locationIcon2.png",
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //String filePath = attachment["filePath"]!;
                                // _launchPDF(filePath); // Launch the PDF
                              },
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Icon(
                                  Icons.file_open,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
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
