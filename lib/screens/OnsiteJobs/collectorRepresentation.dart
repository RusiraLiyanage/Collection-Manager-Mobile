import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CollectorRepresentation extends StatefulWidget {
  final void Function(String, String) onCreate;

  final void Function() onClose;

  final List<String> collectorNames;

  const CollectorRepresentation({
    Key? key,
    required this.collectorNames,
    required this.onCreate,
    required this.onClose,
  }) : super(key: key);

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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFE6F7FA), // Light blue background
        borderRadius: BorderRadius.circular(6),
      ),
      child: Form(
        key: _formKey,
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
                            "Collector",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => widget.onClose(),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          ),
                        )
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
                          if (_formKey.currentState!.validate()) {
                            DateTime now = DateTime.now();
                            widget.onCreate(
                              _selectedCollectorOneAssignment!,
                              DateFormat('hh:mm a | dd MMM yyyy').format(now),
                            );
                          }
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please take an action' : null,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
