import 'dart:ui';

import 'package:flutter/material.dart';

class CollectorsModal extends StatelessWidget {
  const CollectorsModal({super.key});

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
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(16),
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
                      Text(
                        "Collectors",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF01B4D2),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  Divider(
                    color: Color(0xFF01B4D2),
                    thickness: 2,
                  ),
                  SizedBox(height: 8),
                  _collectorItem("George Poulos", "Allocated"),
                  _collectorItem("Michelle Kirkman", "Accepted"),
                  _collectorItem("Valerie McKenzie", "Accepted"),
                  _collectorItem("Zac Hepburn", "Accepted"),
                  _collectorItem("Gina Landini", "Rejected"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _collectorItem(String name, String value,
      {Color color = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: TextStyle(
                fontSize: 18,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          IntrinsicWidth(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: value == "Rejected"
                  ? Color(0xFFFF0A0A)
                  : value == "Accepted"
                      ? Color(0xFF5CD22B)
                      : value == "Allocated"
                          ? Color(0xFF1A8CFF)
                          : Colors.black,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
