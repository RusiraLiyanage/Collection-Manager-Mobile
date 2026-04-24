import 'package:flutter/material.dart';

class ExtraInfoFormField extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormFieldState> fieldKey;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  const ExtraInfoFormField({
    super.key,
    required this.fieldKey,
    required this.controller,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0.0),
      child: Container(
        height: 88,
        width: double.infinity,
        child: Material(
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(4),
          child: TextFormField(
            key: fieldKey,
            controller: controller,
            maxLines: null, // Makes the text field expandable
            minLines: 5,
            decoration: InputDecoration(
              hintText: '',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none, // Removes border outline
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 12,
              ),
            ),
            keyboardType: TextInputType.multiline,
            onChanged: onChanged,
            /*  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid donor selection process';
                                    }
                                    return null;
                                  }, */
          ),
        ),
      ),
    );
  }
}
