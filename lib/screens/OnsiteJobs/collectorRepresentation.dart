import 'package:flutter/material.dart';

class CollectorRepresentation extends StatefulWidget {
  final VoidCallback onDelete; // Callback to notify parent

  final List<String> collectorNames;

  final int collectorNumber;

  const CollectorRepresentation(
      {Key? key,
      required this.onDelete,
      required this.collectorNames,
      required this.collectorNumber})
      : super(key: key);

  @override
  State<CollectorRepresentation> createState() =>
      _CollectorRepresentationState();
}

class _CollectorRepresentationState extends State<CollectorRepresentation> {
  final GlobalKey<FormFieldState<String>> _collectorOneAssignmentKey =
      GlobalKey<FormFieldState<String>>();

  String? _selectedCollectorOneAssignment;

  final List<String> _collectorOneAssignment = [
    'Allocated',
    'Accepted',
    'Rejected'
  ];

  bool collectorSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFE6F7FA), // Light blue background
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              top: 15.0,
              right: 12.0,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    bottom: 5.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Collector ${widget.collectorNumber}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: widget
                            .onDelete, // Call the parent's method when tapped

                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.asset("assets/images/icons/delete.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 302,
                  child: DropdownButtonFormField<String>(
                    key: _collectorOneAssignmentKey,
                    icon: Image.asset(
                      "assets/images/icons/dropDownIcon.png", // Replace with your image path
                      width: 16, // Adjust the size
                      height: 16,
                    ),
                    elevation: 20,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2, // Default border width
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2, // Set the border color to grey
                          // Set the border color to grey
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Colors
                              .white, // Set the border color to grey when focused
                          width:
                              2, // Optional: Adjust the width for better visibility
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Colors
                              .red, // Set the border color to grey when focused
                          width:
                              2, // Optional: Adjust the width for better visibility
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Colors
                              .red, // Set the border color to grey when focused
                          width:
                              2, // Optional: Adjust the width for better visibility
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 5, // Adjust vertical padding
                        horizontal: 12, // Adjust horizontal padding
                      ),
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 12, // Adjust font size if needed
                      ), // Reserve space for error messages
                    ),
                    value: _selectedCollectorOneAssignment,
                    items: widget.collectorNames.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCollectorOneAssignment = value;
                        _collectorOneAssignmentKey.currentState!
                            .validate(); // Revalidate the field
                        collectorSelected = true;
                        /* if (_selectedCollectionOrganisation!.length < 0) {
                                                                        // Clear error state once a valid selection is made
                                                                        _formKeys[_currentStep].currentState?.validate();
                                                                      } */
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Please take an action' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      collectorSelected
                          ?
                          // Allocated Badge
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                    26, 140, 255, 1.0), // Blue background
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                "Allocated",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      SizedBox(width: 8), // Space between badge and text

                      // Date and Time
                      Text(
                        "08:30 am | 29 Apr 2024",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
