import 'package:flutter/material.dart';

class AuthorizedRepresentatives extends StatefulWidget {
  final void Function() onClose;

  final void Function(String, String, String, String) onCreate;

  const AuthorizedRepresentatives({
    Key? key,
    required this.onClose,
    required this.onCreate,
  }) : super(key: key);

  @override
  State<AuthorizedRepresentatives> createState() =>
      CollectorRepresentationState();
}

class CollectorRepresentationState extends State<AuthorizedRepresentatives> {
  final GlobalKey<FormFieldState<String>> _authorizedRepresentativeKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _mobileKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _positionKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _emailKey =
      GlobalKey<FormFieldState<String>>();

  final TextEditingController _authorizedRepresentativeController =
      TextEditingController();

  final TextEditingController _mobile_Controller = TextEditingController();

  final TextEditingController _positionController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  bool collectorSelected = false;

  final _formKey = GlobalKey<FormState>();

  bool _hasSubmitted = false; // ✅ Added: Flag to track submission

  void _submitForm() {
    setState(() {
      _hasSubmitted = true; // ✅ Set flag to true before validation
    });

    if (_formKey.currentState!.validate()) {
      widget.onCreate(
          _authorizedRepresentativeController.text,
          _mobile_Controller.text,
          _positionController.text,
          _emailController.text);
    }
  }

  // ✅ Expose submitForm() for the parent to call
  bool submitForm() {
    setState(() {
      _hasSubmitted = true; // ✅ Set flag to true before validation
    });
    if (_formKey.currentState!.validate()) {
      widget.onCreate(
          _authorizedRepresentativeController.text,
          _mobile_Controller.text,
          _positionController.text,
          _emailController.text);
      return true; // ✅ Return true if form is valid
    }
    return false; // ✅ Return false if form is invalid
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFE6F7FA), // Light blue background
        borderRadius: BorderRadius.circular(6),
      ),
      child: Form(
        key: _formKey,
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
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      bottom: 5.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Representative",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => widget.onClose(),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Authorized Representative *",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
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
                            .withOpacity(0.5), // Optional: Adjust shadow color
                        borderRadius: BorderRadius.circular(
                            4), // Match with TextFormField's border radius
                        child: TextFormField(
                          key: _authorizedRepresentativeKey,
                          controller: _authorizedRepresentativeController,
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
                          keyboardType:
                              TextInputType.text, // Ensures numeric input
                          onChanged: (value) {
                            setState(() {
                              //_selectedJobReference = value;
                              // Update the number of donors and the text controller
                              _authorizedRepresentativeController.text =
                                  value; // Manually update the controller text
                              _authorizedRepresentativeKey.currentState!
                                  .validate();
                            });
                          },
                          validator: (value) {
                            if (!_hasSubmitted)
                              return null; // ✅ Only validate after submit
                            if (_authorizedRepresentativeController.text ==
                                "") {
                              return 'Please enter the authorized representative name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Mobile *",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
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
                            .withOpacity(0.5), // Optional: Adjust shadow color
                        borderRadius: BorderRadius.circular(
                            4), // Match with TextFormField's border radius
                        child: TextFormField(
                          key: _mobileKey,
                          controller: _mobile_Controller,
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
                          keyboardType:
                              TextInputType.phone, // Ensures numeric input
                          onChanged: (value) {
                            setState(() {
                              // Update the number of donors and the text controller
                              _mobile_Controller.text =
                                  value; // Manually update the controller text
                              _mobileKey.currentState!.validate();
                            });
                          },
                          validator: (value) {
                            if (!_hasSubmitted)
                              return null; // ✅ Only validate after submit

                            if (!RegExp(r'^[0-9]{10}$').hasMatch(value!)) {
                              return 'Please enter a valid mobile number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Position",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 0.0,
                      top: 5.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 0.0),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        child: Material(
                          elevation:
                              4, // Adjust this value for more or less elevation
                          shadowColor: Colors.black.withOpacity(
                              0.5), // Optional: Adjust shadow color
                          borderRadius: BorderRadius.circular(
                              4), // Match with TextFormField's border radius
                          child: TextFormField(
                            key: _positionKey,
                            controller: _positionController,
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
                            keyboardType:
                                TextInputType.text, // Ensures numeric input
                            onChanged: (value) {
                              setState(() {
                                //_selectedJobReference = value;
                                // Update the number of donors and the text controller
                                _positionController.text =
                                    value; // Manually update the controller text
                                _positionKey.currentState!.validate();
                              });
                            },
                            validator: (value) {
                              if (!_hasSubmitted)
                                return null; // ✅ Only validate after submit

                              if (_positionController.text == "") {
                                return 'Please enter a correct position';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email *",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      child: Material(
                        elevation:
                            4, // Adjust this value for more or less elevation
                        shadowColor: Colors.black
                            .withOpacity(0.5), // Optional: Adjust shadow color
                        borderRadius: BorderRadius.circular(
                            4), // Match with TextFormField's border radius
                        child: TextFormField(
                          key: _emailKey,
                          controller: _emailController,
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
                          keyboardType:
                              TextInputType.text, // Ensures numeric input
                          onChanged: (value) {
                            setState(() {
                              //_selectedJobReference = value;
                              // Update the number of donors and the text controller
                              _emailController.text =
                                  value; // Manually update the controller text
                              _emailKey.currentState!.validate();
                            });
                          },
                          validator: (value) {
                            if (!_hasSubmitted)
                              return null; // ✅ Only validate after submit

                            if (!RegExp(
                                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                .hasMatch(value!)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Color for the Next button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      minimumSize: Size(80, 30),
                    ),
                    child: const Text(
                      "Add Representative",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
