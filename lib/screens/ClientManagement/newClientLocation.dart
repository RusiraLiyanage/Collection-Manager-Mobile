import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_code_blue/screens/ClientManagement/authorizedRepresentatives.dart';
import 'package:project_code_blue/screens/ClientManagement/newSiteContact.dart';
import 'package:project_code_blue/screens/ClientManagement/siteContact.dart';

class NewClientLocation extends StatefulWidget {
  const NewClientLocation({super.key});

  @override
  State<NewClientLocation> createState() => _NewClientLocationState();
}

class _NewClientLocationState extends State<NewClientLocation> {
  final TextEditingController _textController = TextEditingController();

  bool addSiteContactOpened = false;

  List<SiteContact> contacts = List.empty(growable: true);

  void addSiteContact(String contactName, String contact) {
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

  void deleteSiteContact(String id) {
    setState(() {
      contacts.removeWhere((contact) => contact.id == id);
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Image.asset(
                            "assets/images/icons/onSiteApprovalVector.png"),
                      ),
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
                  Divider(
                    color: Color(0xFF1C8CFF),
                  ),
                  Expanded(
                    child: Scrollbar(
                      thickness: 3,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
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
                            _buildTextField(
                                "Site Name", "BHP", double.infinity),
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
                            GestureDetector(
                              onTap: () {
                                print("On tapped");
                                setState(() {
                                  addSiteContactOpened = true;
                                });
                              },
                              child: Align(
                                alignment: Alignment.topRight,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Image.asset(
                                      "assets/images/icons/addButton.png"),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            ListView.builder(
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
                                        borderRadius: BorderRadius.circular(6),
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
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          "Site Contact ${(index + 1)}",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          deleteSiteContact(contact
                                                              .id); // Delete by ID
                                                        },
                                                        child: FittedBox(
                                                          fit: BoxFit.contain,
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
                                                      shadowColor: Colors.black
                                                          .withOpacity(
                                                              0.5), // Optional: Adjust shadow color
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4), // Match with TextFormField's border radius
                                                      child: TextFormField(
                                                        readOnly: true,
                                                        initialValue:
                                                            contact.contactName,
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
                                                              color:
                                                                  Colors.white,
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
                                                              color:
                                                                  Colors.white,
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
                                                              color:
                                                                  Colors.white,
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
                                                              color: Colors.red,
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
                                                              color: Colors.red,
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
                                                      shadowColor: Colors.black
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
                                                              color:
                                                                  Colors.white,
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
                                                              color:
                                                                  Colors.white,
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
                                                              color:
                                                                  Colors.white,
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
                                                              color: Colors.red,
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
                                                              color: Colors.red,
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
                                                            color: Colors.red,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        keyboardType: TextInputType
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
                            SizedBox(
                              height: 10,
                            ),
                            addSiteContactOpened == true
                                ? NewSiteContact(
                                    numberOfRepresentatives: 2,
                                    representativeNumber: 1,
                                    onDelete: addSiteContact,
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                          ],
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

  Widget _buildTextField(String label, String value, double width) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
        right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
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
            width: width,
            child: Material(
              elevation: 4,
              shadowColor: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(4),
              child: TextFormField(
                readOnly: true,
                initialValue: value,
                style: TextStyle(fontSize: 13, color: Colors.black),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        color: Color(0xFF01B4D2),
                        width: 2), // New focused border color
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignatureField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 100,
          width: 161,
          decoration: BoxDecoration(
            color: Color(0xFFE6F7FA),
            borderRadius: BorderRadius.circular(19),
          ),
          child: Padding(
            padding: EdgeInsets.all(9.0),
            child: Material(
              elevation: 4,
              shadowColor: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Icon(Icons.edit,
                      color: Colors.grey,
                      size: 30), // Placeholder for signature
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
