import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_code_blue/screens/ClientManagement/newSiteContact.dart';
import 'package:project_code_blue/screens/ClientManagement/siteContact.dart';

class NewClientLocation extends StatefulWidget {
  const NewClientLocation({super.key});

  @override
  State<NewClientLocation> createState() => _NewClientLocationState();
}

class _NewClientLocationState extends State<NewClientLocation> {
  final GlobalKey<FormFieldState<String>> _addressLineOneKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _addressLineTwoKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _siteKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _localSiteAccessKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _stateKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _postCodeKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _citySuburbKey =
      GlobalKey<FormFieldState<String>>();

  final TextEditingController _addressLineOneController =
      TextEditingController();

  final TextEditingController _localSiteAccessController =
      TextEditingController();

  final TextEditingController _postCodeController = TextEditingController();

  final TextEditingController _stateController = TextEditingController();

  final TextEditingController _addressLineTwoController =
      TextEditingController();

  final TextEditingController _citySuburbController = TextEditingController();

  final TextEditingController _siteController = TextEditingController();

  bool addSiteContactOpened = false;

  List<SiteContact> contacts = List.empty(growable: true);

  final _formKey = GlobalKey<FormState>();

  final ScrollController _scrollController = ScrollController();

  // ✅ GlobalKey to access NewSiteContact state
  final GlobalKey<NewSiteContactState> _newSiteContactKey =
      GlobalKey<NewSiteContactState>();

  void addSiteContact(String contactName, String contact) {
    print("yes called");
    setState(() {
      contacts.add(
        SiteContact(
          id: DateTime.now().millisecondsSinceEpoch.toString(), // Unique ID
          contactName: contactName,
          contact: contact,
        ),
      );
      addSiteContactOpened = false;
    });
  }

  void closeSiteContact() {
    setState(() {
      addSiteContactOpened = false;
    });
  }

  void deleteSiteContact(String id) {
    setState(() {
      contacts.removeWhere((contact) => contact.id == id);
    });
  }

  void _nextStep() {
    // _newSiteContactKey.currentState?.submitForm();
    bool isValid = _newSiteContactKey.currentState?.submitForm() ?? false;
    // Validate the current form
    if (_formKey.currentState!.validate() && isValid) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Form submitted successfully!'),
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
      return;
    } else {
      _scrollController.animateTo(
        0, // Scrolls to the top
        duration: Duration(milliseconds: 500), // Smooth animation
        curve: Curves.easeInOut,
      );
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
                          child: Container()), // Pushes content to the center
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Image.asset(
                                "assets/images/icons/newLocation.png"),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "New Client Location",
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
                  Divider(color: Color(0xFF1C8CFF)),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Site Name",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
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
                                    Text(
                                      "Site Name",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Color(
                                          0xFF7F8E9D,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 40,
                                      width: double.infinity,
                                      child: Material(
                                        elevation: 4,
                                        shadowColor:
                                            Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(4),
                                        child: TextFormField(
                                          key: _siteKey,
                                          controller: _siteController,
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
                                              _siteController.text =
                                                  value; // Manually update the controller text
                                              _siteKey.currentState!.validate();
                                            });
                                          },
                                          validator: (value) {
                                            if (_siteController.text == "") {
                                              return 'Please enter a valid site name';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              /* _buildTextField("Location", "Wollongong"),
                              _buildTextField(
                                  "Authorised Representative", "Francis Hooper"),
                              _buildTextField("Authorised Representative Email",
                                  "FrancisHooper@rail.nsw.gov.au"), */
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Site Contacts",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
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
                                child: GestureDetector(
                                  onTap: () {
                                    print("On tapped");
                                    setState(() {
                                      addSiteContactOpened = true;
                                    });
                                  },
                                  child: addSiteContactOpened == false
                                      ? Align(
                                          alignment: Alignment.topRight,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Image.asset(
                                                "assets/images/icons/addButton.png"),
                                          ),
                                        )
                                      : Align(
                                          alignment: Alignment.topRight,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Image.asset(
                                                "assets/images/icons/addDisabled.png"),
                                          ),
                                        ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  key: ValueKey(contacts
                                      .length), // Ensures the list updates correctly
                                  scrollDirection: Axis.vertical,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: contacts.length,
                                  itemBuilder: (context, index) {
                                    final contact = contacts[index];
                                    return Column(
                                      key: ValueKey(contact
                                          .id), // Ensure each contact has a unique key
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: const Color(
                                                0xFFE6F7FA), // Light blue background
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
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
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 8.0,
                                                        bottom: 5.0,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              "Site Contact ${(index + 1)}",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              deleteSiteContact(
                                                                  contact
                                                                      .id); // Delete by ID
                                                            },
                                                            child: FittedBox(
                                                              fit: BoxFit
                                                                  .contain,
                                                              child: Image.asset(
                                                                  "assets/images/icons/delete.png"),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 8.0,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: const Text(
                                                          "Site Contact Name",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        right: 0.0,
                                                        top: 5,
                                                      ),
                                                      child: Container(
                                                        height: 40,
                                                        width: double.infinity,
                                                        child: Material(
                                                          elevation:
                                                              4, // Adjust this value for more or less elevation
                                                          shadowColor: Colors
                                                              .black
                                                              .withOpacity(
                                                                  0.5), // Optional: Adjust shadow color
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4), // Match with TextFormField's border radius
                                                          child: TextFormField(
                                                            readOnly: true,
                                                            initialValue: contact
                                                                .contactName,
                                                            decoration:
                                                                InputDecoration(
                                                              fillColor:
                                                                  Colors.white,
                                                              filled: true,
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .red,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .red,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                vertical: 5,
                                                                horizontal: 12,
                                                              ),
                                                              errorStyle:
                                                                  const TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text, // Ensures numeric input
                                                            onChanged: (value) {
                                                              setState(() {
                                                                //_selectedJobReference = value;
                                                                // Update the number of donors and the text controller
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 8.0,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: const Text(
                                                          "Mobile *",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        right: 0.0,
                                                        top: 5.0,
                                                      ),
                                                      child: Container(
                                                        height: 40,
                                                        width: double.infinity,
                                                        child: Material(
                                                          elevation:
                                                              4, // Adjust this value for more or less elevation
                                                          shadowColor: Colors
                                                              .black
                                                              .withOpacity(
                                                                  0.5), // Optional: Adjust shadow color
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4), // Match with TextFormField's border radius
                                                          child: TextFormField(
                                                            readOnly: true,
                                                            initialValue:
                                                                contact.contact,
                                                            decoration:
                                                                InputDecoration(
                                                              fillColor:
                                                                  Colors.white,
                                                              filled: true,
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .red,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .red,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                vertical: 5,
                                                                horizontal: 12,
                                                              ),
                                                              errorStyle:
                                                                  const TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .phone, // Ensures numeric input
                                                            onChanged: (value) {
                                                              setState(() {
                                                                // Update the number of donors and the text controller
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
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
                                  },
                                ),
                              ),
                              addSiteContactOpened == true
                                  ? NewSiteContact(
                                      key: _newSiteContactKey,
                                      onCreate: addSiteContact,
                                      onClose: closeSiteContact,
                                    )
                                  : SizedBox(
                                      height: 0,
                                    ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Site Address",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
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
                                    Text(
                                      "Address Line 1",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Color(
                                          0xFF7F8E9D,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 40,
                                      width: double.infinity,
                                      child: Material(
                                        elevation: 4,
                                        shadowColor:
                                            Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(4),
                                        child: TextFormField(
                                          key: _addressLineOneKey,
                                          controller: _addressLineOneController,
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
                                              _addressLineOneController.text =
                                                  value; // Manually update the controller text
                                              _addressLineOneKey.currentState!
                                                  .validate();
                                            });
                                          },
                                          validator: (value) {
                                            if (_addressLineOneController
                                                    .text ==
                                                "") {
                                              return 'Please enter a address line 1';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              /* _buildTextField("Location", "Wollongong"),
                              _buildTextField(
                                  "Authorised Representative", "Francis Hooper"),
                              _buildTextField("Authorised Representative Email",
                                  "FrancisHooper@rail.nsw.gov.au"), */
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8.0,
                                  right: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Address Line 2",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Color(
                                          0xFF7F8E9D,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 40,
                                      width: double.infinity,
                                      child: Material(
                                        elevation: 4,
                                        shadowColor:
                                            Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(4),
                                        child: TextFormField(
                                          key: _addressLineTwoKey,
                                          controller: _addressLineTwoController,
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
                                              _addressLineTwoController.text =
                                                  value; // Manually update the controller text
                                              _addressLineTwoKey.currentState!
                                                  .validate();
                                            });
                                          },
                                          validator: (value) {
                                            if (_addressLineTwoController
                                                    .text ==
                                                "") {
                                              return 'Please enter a address line 2';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8.0,
                                  right: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "City/ Suburb",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Color(
                                          0xFF7F8E9D,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 166,
                                      child: Material(
                                        elevation: 4,
                                        shadowColor:
                                            Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(4),
                                        child: TextFormField(
                                          key: _citySuburbKey,
                                          controller: _citySuburbController,
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
                                              _citySuburbController.text =
                                                  value; // Manually update the controller text
                                              _citySuburbKey.currentState!
                                                  .validate();
                                            });
                                          },
                                          validator: (value) {
                                            if (_citySuburbController.text ==
                                                "") {
                                              return 'Please enter a valid city/suburb';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8.0,
                                  right: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "State",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Color(
                                          0xFF7F8E9D,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 69,
                                      child: Material(
                                        elevation: 4,
                                        shadowColor:
                                            Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(4),
                                        child: TextFormField(
                                          key: _stateKey,
                                          controller: _stateController,
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
                                              _stateController.text =
                                                  value; // Manually update the controller text
                                              _stateKey.currentState!
                                                  .validate();
                                            });
                                          },
                                          validator: (value) {
                                            if (_stateController.text == "") {
                                              return 'Please enter a valid state';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8.0,
                                  right: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Postcode",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Color(
                                          0xFF7F8E9D,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 85,
                                      child: Material(
                                        elevation: 4,
                                        shadowColor:
                                            Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(4),
                                        child: TextFormField(
                                          key: _postCodeKey,
                                          controller: _postCodeController,
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
                                              _postCodeController.text =
                                                  value; // Manually update the controller text
                                              _postCodeKey.currentState!
                                                  .validate();
                                            });
                                          },
                                          validator: (value) {
                                            if (_postCodeController.text ==
                                                "") {
                                              return 'Please enter a valid post code';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Specific Local Site Access Information",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
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
                                  elevation: 4,
                                  shadowColor: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(
                                      4), // Ensures consistent rounding
                                  child: TextFormField(
                                    key: _localSiteAccessKey,
                                    controller: _localSiteAccessController,
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
                                        _localSiteAccessKey.currentState
                                            ?.validate();
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
                                height: 20,
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
                                      onPressed: () => Navigator.pop(context),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .red, // Color for the Back button
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        minimumSize: Size(80,
                                            30), // Sets a minimum width and height
                                      ),
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: _nextStep,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .blue, // Color for the Next button
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        minimumSize: Size(80, 30),
                                      ),
                                      child: const Text(
                                        "Add Location",
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}
