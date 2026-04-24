import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class DrugTestDropdownFormField extends StatelessWidget {
  final GlobalKey<FormFieldState> fieldKey;
  final List<String> items;
  final String? selectedItem;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String hintText;

  const DrugTestDropdownFormField({
    super.key,
    required this.fieldKey,
    required this.items,
    required this.hintText,
    this.selectedItem,
    this.onChanged,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: Material(
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
        child: DropdownSearch<String>(
          key: fieldKey,
          items: items,
          selectedItem: selectedItem,
          popupProps: PopupProps.menu(
            showSearchBox: true,
            fit: FlexFit.tight,
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              ),
            ),
            menuProps: const MenuProps(
              backgroundColor: Colors.white,
              elevation: 4,
            ),
          ),
          dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            dropdownSearchDecoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.white, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.white, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.white, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
            ),
          ),
          validator: validator,
          onChanged: onChanged,
          onSaved: onSaved,
        ),
      ),
    );
  }
}
