import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:project_code_blue/screens/CollectionReports/collectionReportPreview.dart';
import 'package:project_code_blue/screens/OnsiteJobs/NewCalloutJob/Main/manageCalloutJob.dart';
import 'package:project_code_blue/screens/OnsiteJobs/NewCalloutJob/Main/viewCalloutJob.dart';
import 'package:project_code_blue/screens/OnsiteJobs/NewOnsiteJob/Main/manageOnsiteJob.dart';
import 'package:project_code_blue/screens/OnsiteJobs/NewOnsiteJob/Main/viewOnsiteJob.dart';
import 'package:project_code_blue/screens/OnsiteJobs/widgets/cancelJobConfirmationModal.dart';
import 'package:project_code_blue/screens/OnsiteJobs/widgets/collectorsModal.dart';
import 'package:project_code_blue/screens/OnsiteJobs/widgets/deleteJobConfirmationModal.dart';
import 'package:project_code_blue/screens/OnsiteJobs/widgets/restoreJobConfirmationModal.dart';

class OnsiteJobCard extends StatelessWidget {
  const OnsiteJobCard({
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
              ? Expanded(
                  flex:
                      4, // Adjust the flex value to control space distribution
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Card(
                        margin: EdgeInsets.zero, // Remove default margin
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: value == "Draft"
                            ? Colors.yellow
                            : value == "Complete"
                                ? Color(0xFF005277).withOpacity(0.5)
                                : value == "Cancelled"
                                    ? Color(0xFFFF0A0A).withOpacity(0.5)
                                    : value == "Planned"
                                        ? Color(0xFF1A8CFF).withOpacity(0.7)
                                        : value == "In Progress"
                                            ? Color(0xFF5CD22B)
                                            : Colors.black,
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

  final Map<String, dynamic> job;

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
                          "assets/images/icons/onSiteJobsIcon.png",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Rail NSW",
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
                        if (job["jobStatus"] == "Draft") {
                          showAdaptiveActionSheet(
                            bottomSheetColor: Color(0xFFEEF5F6),
                            context: context,
                            actions: <BottomSheetAction>[
                              BottomSheetAction(
                                title: const Text(
                                  'Manage Job',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                onPressed: (_) {
                                  Navigator.pop(context);
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
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(
                                                    0), // Rounded top corners
                                              ),
                                            ),
                                            child:
                                                job["callout"]! == "Non Callout"
                                                    ? ManageOnsiteJob(
                                                        jobData: job,
                                                        scrollController:
                                                            scrollController)
                                                    : ManageCalloutJob(
                                                        jobData: job,
                                                        scrollController:
                                                            scrollController),
                                          );
                                        },
                                      );
                                    },
                                  );
                                  // Close the bottom sheet
                                },
                              ),
                              BottomSheetAction(
                                title: const Text(
                                  'Delete Job',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                onPressed: (_) {
                                  Navigator.pop(
                                      context); // First close the Bottom Sheet
                                  Future.delayed(Duration(milliseconds: 200),
                                      () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext context) =>
                                          const DeleteJobConfirmationModal(),
                                    );
                                  });
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
                              ),
                            ),
                          );
                        } else if (job["jobStatus"] == "In Progress") {
                          showAdaptiveActionSheet(
                            bottomSheetColor: Color(0xFFEEF5F6),
                            context: context,
                            actions: <BottomSheetAction>[
                              BottomSheetAction(
                                title: const Text(
                                  'View Details',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                onPressed: (_) {
                                  print(job["callout"]!);
                                  Navigator.pop(context); //
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
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(
                                                    0), // Rounded top corners
                                              ),
                                            ),
                                            child:
                                                job["callout"]! == "Non Callout"
                                                    ? ViewOnsiteJob(
                                                        jobData: job,
                                                        scrollController:
                                                            scrollController)
                                                    : ViewCalloutJob(
                                                        jobData: job,
                                                        scrollController:
                                                            scrollController),
                                          );
                                        },
                                      );
                                    },
                                  );
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
                              ),
                            ),
                          );
                        } else if (job["jobStatus"] == "Planned") {
                          showAdaptiveActionSheet(
                            bottomSheetColor: Color(0xFFEEF5F6),
                            context: context,
                            actions: <BottomSheetAction>[
                              BottomSheetAction(
                                title: const Text(
                                  'Manage Job',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                onPressed: (_) {
                                  Navigator.pop(
                                      context); // Close the bottom sheet
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
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(
                                                    0), // Rounded top corners
                                              ),
                                            ),
                                            child:
                                                job["callout"]! == "Non Callout"
                                                    ? ManageOnsiteJob(
                                                        jobData: job,
                                                        scrollController:
                                                            scrollController)
                                                    : ManageCalloutJob(
                                                        jobData: job,
                                                        scrollController:
                                                            scrollController),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                              BottomSheetAction(
                                title: const Text(
                                  'Cancel Job',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                onPressed: (_) {
                                  Navigator.pop(
                                      context); // Close bottom sheet first
                                  Future.delayed(
                                    Duration(milliseconds: 200),
                                    () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (BuildContext context) =>
                                            const CancelJobConfirmationModal(),
                                      );
                                    },
                                  );
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
                              ),
                            ),
                          );
                        } else if (job["jobStatus"] == "Complete") {
                          showAdaptiveActionSheet(
                            bottomSheetColor: Color(0xFFEEF5F6),
                            context: context,
                            actions: <BottomSheetAction>[
                              BottomSheetAction(
                                title: const Text(
                                  'View Details',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                onPressed: (_) {
                                  Navigator.pop(
                                      context); // Close the bottom sheet

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
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(
                                                    0), // Rounded top corners
                                              ),
                                            ),
                                            child:
                                                job["callout"]! == "Non Callout"
                                                    ? ViewOnsiteJob(
                                                        jobData: job,
                                                        scrollController:
                                                            scrollController)
                                                    : ViewCalloutJob(
                                                        jobData: job,
                                                        scrollController:
                                                            scrollController),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                              BottomSheetAction(
                                title: const Text(
                                  'View Collection Report',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                onPressed: (_) {
                                  Navigator.pop(
                                      context); // Close the bottom sheet
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CollectionReportPreview(
                                        reportID: job["reportID"]!,
                                        currentStatus: job["sentByStatus"]!,
                                      ),
                                    ),
                                  );
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
                              ),
                            ),
                          );
                        } else if (job["jobStatus"] == "Cancelled") {
                          showAdaptiveActionSheet(
                            bottomSheetColor: Color(0xFFEEF5F6),
                            context: context,
                            actions: <BottomSheetAction>[
                              BottomSheetAction(
                                title: const Text(
                                  'View Details',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                onPressed: (_) {
                                  Navigator.pop(
                                      context); // Close the bottom sheet
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
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(
                                                    0), // Rounded top corners
                                              ),
                                            ),
                                            child:
                                                job["callout"]! == "Non Callout"
                                                    ? ViewOnsiteJob(
                                                        jobData: job,
                                                        scrollController:
                                                            scrollController)
                                                    : ViewCalloutJob(
                                                        jobData: job,
                                                        scrollController:
                                                            scrollController),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                              BottomSheetAction(
                                title: const Text(
                                  'Restore Job',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                onPressed: (_) {
                                  Navigator.pop(
                                      context); // Close bottom sheet first
                                  Future.delayed(
                                    Duration(milliseconds: 200),
                                    () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (BuildContext context) =>
                                            const RestoreJobConfirmationModal(),
                                      );
                                    },
                                  );
                                },
                              ),
                              BottomSheetAction(
                                title: const Text(
                                  'Delete Job',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                onPressed: (_) {
                                  Navigator.pop(
                                      context); // Close bottom sheet first
                                  Future.delayed(
                                    Duration(milliseconds: 200),
                                    () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (BuildContext context) =>
                                            const DeleteJobConfirmationModal(),
                                      );
                                    },
                                  );
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
                              ),
                            ),
                          );
                        }
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
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: GestureDetector(
                        onTap: () => showDialog(
                          context: context,
                          barrierDismissible:
                              false, // Prevent closing on backdrop tap
                          builder: (context) => CollectorsModal(
                            collectors: job["collectors"],
                          ),
                        ),
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
                  job["bookingInfo"]["jobDetails"]["jobReference"]!,
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
