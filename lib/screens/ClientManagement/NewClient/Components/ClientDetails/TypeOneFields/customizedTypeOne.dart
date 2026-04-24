import 'package:flutter/material.dart';

class CustomizedTypeOne extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormFieldState> fieldKey;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  const CustomizedTypeOne({
    required this.controller,
    required this.fieldKey,
    this.onChanged,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0.0),
      child: Container(
        height: 40,
        width: 206,
        child: Material(
          elevation: 4, // Adjust this value for more or less elevation
          shadowColor:
              Colors.black.withOpacity(0.5), // Optional: Adjust shadow color
          borderRadius: BorderRadius.circular(
              4), // Match with TextFormField's border radius
          child: TextFormField(
              key: fieldKey,
              controller: controller,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 12,
                ),
                errorStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
              keyboardType: TextInputType.text, // Ensures numeric input
              onChanged: onChanged,
              validator: validator),
        ),
      ),
    );
  }
}
