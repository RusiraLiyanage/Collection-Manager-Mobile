import 'dart:ui';

import 'package:flutter/material.dart';

class OnsiteApprovalModal extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blurred Background
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color:
                Colors.black.withOpacity(0.3), // Dark semi-transparent overlay
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
                right: 3,
                top: 11,
                bottom: 11,
                left: 16,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Image.asset(
                            "assets/images/icons/onSiteApprovalVector.png"),
                      ),
                      Text(
                        "Onsite Approval",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF01B4D2),
                        ),
                      ),
                      Row(
                        children: [
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Image.asset(
                                "assets/images/icons/printIcon.png"),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.black),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: Color(0xFF01B4D2),
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
                              "CLIENT (Requesting Authority)",
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
                            _buildTextField("Name of Organisation", "BHP"),
                            _buildTextField("Location", "Wollongong"),
                            _buildTextField(
                                "Authorised Representative", "Francis Hooper"),
                            _buildTextField("Authorised Representative Email",
                                "FrancisHooper@rail.nsw.gov.au"),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "COLLECTION",
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8.0,
                                    right: 0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date",
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
                                        width: 150,
                                        child: Material(
                                          elevation: 4,
                                          shadowColor:
                                              Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: TextFormField(
                                            readOnly: true,
                                            initialValue: "Mon, 17 Jun 2024",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Color(0xFF01B4D2),
                                                    width:
                                                        2), // New focused border color
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8.0,
                                    right: 15,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Requested Number of Donors",
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
                                        width: 68,
                                        child: Material(
                                          elevation: 4,
                                          shadowColor:
                                              Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: TextFormField(
                                            readOnly: true,
                                            initialValue: "20",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Color(0xFF01B4D2),
                                                    width:
                                                        2), // New focused border color
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8.0,
                                    right: 15,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Total processed donors",
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
                                        width: 68,
                                        child: Material(
                                          elevation: 4,
                                          shadowColor:
                                              Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: TextFormField(
                                            readOnly: true,
                                            initialValue: "23",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Color(0xFF01B4D2),
                                                    width:
                                                        2), // New focused border color
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8.0,
                                    right: 15,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Start Time",
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
                                        width: 80,
                                        child: Material(
                                          elevation: 4,
                                          shadowColor:
                                              Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: TextFormField(
                                            readOnly: true,
                                            initialValue: "9:00 am",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Color(0xFF01B4D2),
                                                    width:
                                                        2), // New focused border color
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8.0,
                                    right: 15,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "End Time",
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
                                        width: 80,
                                        child: Material(
                                          elevation: 4,
                                          shadowColor:
                                              Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: TextFormField(
                                            readOnly: true,
                                            initialValue: "4:00 pm",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Color(0xFF01B4D2),
                                                    width:
                                                        2), // New focused border color
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8.0,
                                    right: 15,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Time",
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
                                        width: 80,
                                        child: Material(
                                          elevation: 4,
                                          shadowColor:
                                              Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: TextFormField(
                                            readOnly: true,
                                            initialValue: "07 h 0m",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Color(0xFF01B4D2),
                                                    width:
                                                        2), // New focused border color
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "SITE CONTACT",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 10.0,
                                  ),
                                  child: Text(
                                    "Mon 7th Sep 2024 16:01",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Color(
                                        0xFF7F8E9D,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 2,
                              color: Colors.black,
                              endIndent: 10,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Aligns everything to the top
                              children: [
                                SizedBox(
                                  height: 150, // Match the signature height
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween, // Distributes fields evenly
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Name Section
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Name",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF7F8E9D),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                            height: 40,
                                            width: 150,
                                            child: Material(
                                              elevation: 4,
                                              shadowColor:
                                                  Colors.black.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              child: TextFormField(
                                                readOnly: true,
                                                initialValue: "Bob Wills",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    borderSide: BorderSide(
                                                        color: Colors.white,
                                                        width: 2),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    borderSide: BorderSide(
                                                        color: Colors.white,
                                                        width: 2),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF01B4D2),
                                                        width: 2),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 5,
                                                          horizontal: 12),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Mobile Section
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Mobile",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF7F8E9D),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                            height: 40,
                                            width: 150,
                                            child: Material(
                                              elevation: 4,
                                              shadowColor:
                                                  Colors.black.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              child: TextFormField(
                                                readOnly: true,
                                                initialValue: "0452 629 871",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    borderSide: BorderSide(
                                                        color: Colors.white,
                                                        width: 2),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    borderSide: BorderSide(
                                                        color: Colors.white,
                                                        width: 2),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF01B4D2),
                                                        width: 2),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 5,
                                                          horizontal: 12),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Signature",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF7F8E9D),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 135,
                                      width: 190,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE6F7FA),
                                        borderRadius: BorderRadius.circular(19),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(9.0),
                                        child: Material(
                                          elevation: 4,
                                          shadowColor:
                                              Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Center(
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Image.asset(
                                                    "assets/images/icons/siteContactSignature.png"),
                                              ), // Placeholder for signature
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "-35.464523, 110.433333",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              color: Color(
                                                0xFF7F8E9D,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // Signature Section
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "COLLECTOR",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 2,
                              color: Colors.black,
                              endIndent: 10,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name of Collector",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF7F8E9D),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      height: 40,
                                      width: 170,
                                      child: Material(
                                        elevation: 4,
                                        shadowColor:
                                            Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(4),
                                        child: TextFormField(
                                          readOnly: true,
                                          initialValue: "Adam Smith",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black),
                                          decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 2),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 2),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: BorderSide(
                                                  color: Color(0xFF01B4D2),
                                                  width: 2),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Signature",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF7F8E9D),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 135,
                                      width: 170,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE6F7FA),
                                        borderRadius: BorderRadius.circular(19),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(9.0),
                                        child: Material(
                                          elevation: 4,
                                          shadowColor:
                                              Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Center(
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Image.asset(
                                                    "assets/images/icons/collectorSignature.png"),
                                              ), // Placeholder for signature
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 25.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Clocked On",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF7F8E9D),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        height: 40,
                                        width: 140,
                                        child: Material(
                                          elevation: 4,
                                          shadowColor:
                                              Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: TextFormField(
                                            readOnly: true,
                                            initialValue: "17/06/24, 09:00",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Color(0xFF01B4D2),
                                                    width: 2),
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Clocked Off",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF7F8E9D),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        height: 40,
                                        width: 140,
                                        child: Material(
                                          elevation: 4,
                                          shadowColor:
                                              Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: TextFormField(
                                            readOnly: true,
                                            initialValue: "17/06/24, 16:30",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Color(0xFF01B4D2),
                                                    width: 2),
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        height: 80,
                                        width: 150,
                                        child: Material(
                                          elevation: 4,
                                          shadowColor:
                                              Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: TextFormField(
                                            minLines: 5,
                                            maxLines: 5,
                                            readOnly: true,
                                            initialValue:
                                                "I left the site at 16:30",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                borderSide: BorderSide(
                                                    color: Color(0xFF01B4D2),
                                                    width: 2),
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 12),
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Icon(
                                                  Icons.note, // Note icon
                                                  color: Colors.grey,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10),
                            //_buildSignatureField("Signature"),
                            SizedBox(height: 10),
                            //_buildSignatureField("Clocked On"),
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

  Widget _buildTextField(String label, String value) {
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
            width: 250,
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
}
