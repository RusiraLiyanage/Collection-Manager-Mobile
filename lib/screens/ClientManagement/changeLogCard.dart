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
    return Column(
      children: [
        Container(
          height: 110,
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
                        children: [],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 302,
                      child: TextFormField(
                        readOnly: true,
                        initialValue: updatedBy,
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
                              color: Color.fromRGBO(26, 140, 255, 1.0),
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
                        onChanged: (value) {},
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
                              "Updated At",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 8,
                          ),
                          // Space between badge and text

                          // Date and Time
                          Text(
                            updatedAt,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
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
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
