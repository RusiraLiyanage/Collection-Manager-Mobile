import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_code_blue/screens/ClientManagement/changeLogCard.dart';

class EditNote extends StatefulWidget {
  final String subject;
  final String noteText;

  const EditNote({super.key, required this.subject, required this.noteText});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final _formKey = GlobalKey<FormState>();

  final GlobalKey<FormFieldState<String>> _subjectKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _noteTextKey =
      GlobalKey<FormFieldState<String>>();

  final TextEditingController _subjectController = TextEditingController();

  final TextEditingController _noteTextController = TextEditingController();

  bool editableNote = false;

  bool changeLogOpened = false;

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> changeLog = [
    {
      "changedBy": "Rusira Rusira",
      "editedAt": "03:10 PM | 11 Mar 2025",
    },
    {
      "changedBy": "Rusira Rusira",
      "editedAt": "03:10 PM | 11 Mar 2025",
    },
    {
      "changedBy": "Rusira Rusira",
      "editedAt": "03:10 PM | 11 Mar 2025",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _subjectController.text = widget.subject;
    _noteTextController.text = widget.noteText;
  }

  void _nextStep() {
    // Validate the current form
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Note created successfully!'),
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

  void _editNote() {
    // Validate the current form
    setState(() {
      editableNote = true;
    });
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
              height: MediaQuery.of(context).size.height * 0.8,
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Center(
                              child: Row(
                                mainAxisSize: MainAxisSize
                                    .min, // Ensures the row takes minimal space
                                children: [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Image.asset(
                                        "assets/images/icons/newNote.png"),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Note",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1C8CFF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          !editableNote
                              ? ElevatedButton(
                                  onPressed: _editNote,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF01B4D2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    minimumSize: Size(80, 30),
                                  ),
                                  child: const Text(
                                    "Edit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: null, // Disables the button
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade400,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    minimumSize: Size(80, 30),
                                  ),
                                  child: const Text(
                                    "Edit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                          SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Delete Note'),
                                  content: const Text(
                                      'Do you wanna delete the note ?'),
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
                              // Navigator.pop(context);
                            },
                            child:
                                Icon(Icons.delete_outline, color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: Color(0xFF1C8CFF),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Scrollbar(
                      thickness: 3,
                      thumbVisibility: true,
                      controller: _scrollController,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Subject",
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
                                padding: const EdgeInsets.only(
                                  bottom: 8.0,
                                  right: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: double.infinity,
                                      child: Material(
                                        elevation: 4,
                                        shadowColor:
                                            Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(4),
                                        child: TextFormField(
                                          key: _subjectKey,
                                          controller: _subjectController,
                                          readOnly: !editableNote,
                                          decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 2,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 2,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 2,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 2,
                                              ),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 12,
                                            ),
                                            errorStyle: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 12,
                                            ),
                                          ),
                                          keyboardType: TextInputType
                                              .text, // Ensures numeric input
                                          onChanged: (value) {
                                            setState(() {
                                              //_selectedJobReference = value;
                                              // Update the number of donors and the text controller
                                              _subjectController.text =
                                                  value; // Manually update the controller text
                                              _subjectKey.currentState!
                                                  .validate();
                                            });
                                          },
                                          validator: (value) {
                                            if (_subjectController.text == "") {
                                              return 'Please enter a valid subject name';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
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
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Material(
                                        elevation: 0,
                                        shadowColor:
                                            Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(
                                            4), // Ensures consistent rounding
                                        child: TextFormField(
                                          key: _noteTextKey,
                                          controller: _noteTextController,
                                          readOnly: !editableNote,
                                          maxLines: null,
                                          minLines: 5,
                                          decoration: InputDecoration(
                                            hintText: '',
                                            fillColor: Colors.white,
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  width: 2),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  width: 2),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide(
                                                  color: Colors.red, width: 2),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              vertical: 15,
                                              horizontal: 12,
                                            ),
                                          ),
                                          keyboardType: TextInputType.multiline,
                                          onChanged: (value) {
                                            setState(() {
                                              _noteTextKey.currentState
                                                  ?.validate();
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors
                                                  .red, // Color for the Back button
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 5),
                                              minimumSize: Size(80,
                                                  30), // Sets a minimum width and height
                                            ),
                                            child: const Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          editableNote
                                              ? ElevatedButton(
                                                  onPressed: _nextStep,
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: Colors
                                                        .blue, // Color for the Next button
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                    minimumSize: Size(80, 30),
                                                  ),
                                                  child: const Text(
                                                    "Save Note",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                )
                                              : ElevatedButton(
                                                  onPressed: null,
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.grey
                                                        .shade400, // Color for the Next button
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                    minimumSize: Size(80, 30),
                                                  ),
                                                  child: const Text(
                                                    "Save Note",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    changeLogOpened
                                        ? Align(
                                            alignment: Alignment.topLeft,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  changeLogOpened = false;
                                                });
                                              },
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Image.asset(
                                                    "assets/images/icons/changeLogOpened.png"),
                                              ),
                                            ),
                                          )
                                        : Align(
                                            alignment: Alignment.topLeft,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  changeLogOpened = true;
                                                });
                                              },
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Image.asset(
                                                    "assets/images/icons/changeLogClosed.png"),
                                              ),
                                            ),
                                          ),
                                    changeLogOpened
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Divider(
                                                thickness: 2,
                                                color: Colors.black,
                                                endIndent: 10,
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Updated By",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: changeLog.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final changeLogItem =
                                                        changeLog[index];

                                                    return ChangeLogCard(
                                                        updatedBy:
                                                            changeLogItem[
                                                                'changedBy']!,
                                                        updatedAt:
                                                            changeLogItem[
                                                                'editedAt']!);
                                                  }),
                                            ],
                                          )
                                        : SizedBox(
                                            height: 0,
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}
