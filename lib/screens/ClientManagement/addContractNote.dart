import 'dart:ui';

import 'package:flutter/material.dart';

class AddContractNote extends StatefulWidget {
  const AddContractNote({super.key});

  @override
  State<AddContractNote> createState() => _AddContractNoteState();
}

class _AddContractNoteState extends State<AddContractNote> {
  final GlobalKey<FormFieldState<String>> _noteTextKey =
      GlobalKey<FormFieldState<String>>();

  final TextEditingController _noteTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _nextStep() {
    // Validate the current form
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Contract Note created successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      //Navigator.pop(context);
      return;
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blurred Background
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color:
                Colors.black.withOpacity(0.5), // Dark semi-transparent overlay
          ),
        ),

        // Modal Card
        Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.93,
              height: MediaQuery.of(context).size.height * 0.4,
              padding: EdgeInsets.only(
                right: 15,
                top: 11,
                bottom: 11,
                left: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Container()), // Pushes content to the center
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Image.asset(
                                  "assets/images/icons/newNote.png"),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Contract Note",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1C8CFF),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment
                                .centerRight, // Align close button to the right
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Icon(Icons.close, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xFF1C8CFF),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Note Text",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.black,
                      endIndent: 10,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Material(
                        elevation: 0,
                        shadowColor: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(
                            4), // Ensures consistent rounding
                        child: TextFormField(
                          key: _noteTextKey,
                          controller: _noteTextController,
                          maxLines: null,
                          minLines: 5,
                          decoration: InputDecoration(
                            hintText: '',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                  width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                  width: 2),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 12,
                            ),
                          ),
                          keyboardType: TextInputType.multiline,
                          onChanged: (value) {
                            setState(() {
                              _noteTextKey.currentState?.validate();
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter specific local site access instructions';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.red, // Color for the Back button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              minimumSize: Size(
                                  80, 30), // Sets a minimum width and height
                            ),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _nextStep,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.blue, // Color for the Next button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              minimumSize: Size(80, 30),
                            ),
                            child: const Text(
                              "Add Note",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
