import 'package:flutter/material.dart';
import 'package:project_code_blue/screens/ClientManagement/NewClient/SiteContract/addContractNote.dart';

class ContractCard extends StatelessWidget {
  final Map<String, String> contract;
  final Color backgroundColor;
  final ScrollController scrollController;
  const ContractCard(
      {super.key,
      required this.contract,
      required this.backgroundColor,
      required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      color: backgroundColor, // Background color
      elevation: 0, // Remove shadow to match the flat design
      child: Padding(
        padding: const EdgeInsets.all(12), // Padding inside the card
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Prevent extra spacing
                children: [
                  Text(
                    contract["contractName"]!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${contract["uploadedAt"]!}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Uploaded by, ${contract["uploadedBy"]!}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  /* SizedBox(
                    width: double.infinity,
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.black,
                    ),
                  ), */
                  const SizedBox(height: 3),
                  Text(
                    "Contract Note",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  contract["noteAdded"]! == "false"
                      ? RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            children: [
                              const TextSpan(text: "Tap on the "),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.red,
                                  size: 16, // Adjust size to match text
                                ),
                              ),
                              const TextSpan(
                                  text: " icon to add a contract note"),
                            ],
                          ),
                          softWrap: true,
                        )
                      : Text(
                          contract["contractNote"]!,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Launch PDF logic
                      },
                      child: const Icon(
                        Icons.file_open,
                        color: Color.fromRGBO(26, 140, 255, 1.0),
                      ),
                    ),
                    const SizedBox(width: 8), // Space between icons
                    GestureDetector(
                      onTap: () {
                        // Contract Note logic
                        showModalBottomSheet<void>(
                          isScrollControlled:
                              true, // Allows controlling the height
                          isDismissible: false,
                          enableDrag: false,
                          context: context,
                          builder: (BuildContext context) {
                            return DraggableScrollableSheet(
                              expand: false,
                              initialChildSize:
                                  1, // Initial height of the sheet (93% of the screen)
                              minChildSize:
                                  1, // Allow shrinking to 50% of the screen
                              maxChildSize:
                                  1, // Prevent expansion above 93% of the screen
                              builder: (BuildContext context,
                                  ScrollController scrollController) {
                                return Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Color(
                                        0xFFEDEEF0), // Background color of the bottom sheet
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(
                                          0), // Rounded top corners
                                    ),
                                  ),
                                  child: AddContractNote(
                                    scrollController: scrollController,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: const Icon(
                        Icons.edit,
                        color: Colors.red,
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
