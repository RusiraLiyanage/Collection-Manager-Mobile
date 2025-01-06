import 'package:flutter/material.dart';
import 'package:horizontal_stepper_flutter/horizontal_stepper_flutter.dart';

class NewJobAndroid extends StatefulWidget {
  final ScrollController scrollController;
  const NewJobAndroid({super.key, required this.scrollController});

  @override
  State<NewJobAndroid> createState() => _NewJobAndroidState();
}

class _NewJobAndroidState extends State<NewJobAndroid> {
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  int _currentStep = 0;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Dropdown values
  String? _selectedCollectionOrganisation;
  String? _selectedServiceOffice;

  // Dropdown options
  final List<String> _collectionOrganisations = ['Org 1', 'Org 2', 'Org 3'];
  final List<String> _serviceOffices = ['Clinic 1', 'Clinic 2', 'Clinic 3'];

  String? _selectedClientName;
  String? _selectedClientReference;

  final List<String> _clientNames = ['Client A', 'Client B', 'Client C'];
  final List<String> _clientReferences = [
    'Reference X',
    'Reference Y',
    'Reference Z'
  ];

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF00B4D1)
                    .withOpacity(0.4), // Light blue background
                borderRadius: BorderRadius.circular(19),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Collection Organisation Dropdown
                  const Text(
                    "Collection Organisation",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 35,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            width: 2, // Default border width
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2, // Set the border color to grey
                            // Set the border color to grey
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            color: Color(
                                0xFF007AFF), // Set the border color to grey when focused
                            width:
                                2, // Optional: Adjust the width for better visibility
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            color: Colors
                                .red, // Set the border color to grey when focused
                            width:
                                2, // Optional: Adjust the width for better visibility
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            color: Colors
                                .red, // Set the border color to grey when focused
                            width:
                                2, // Optional: Adjust the width for better visibility
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, // Adjust vertical padding
                          horizontal: 12, // Adjust horizontal padding
                        ),
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 12, // Adjust font size if needed
                        ), // Reserve space for error messages
                      ),
                      value: _selectedCollectionOrganisation,
                      items: _collectionOrganisations.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCollectionOrganisation = value;
                          if (_collectionOrganisations
                              .contains(_selectedCollectionOrganisation)) {
                            // Clear error state once a valid selection is made
                            _formKeys[_currentStep].currentState?.validate();
                          }
                        });
                      },
                      validator: (value) => value == null
                          ? 'Please select a collection organisation'
                          : null,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Service Office Dropdown
                  const Text.rich(
                    TextSpan(
                      text: "Service Office ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      children: [
                        TextSpan(
                          text: "(Clinic)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 35,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            width: 2, // Default border width
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2 // Set the border color to grey
                              ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            color: Color(
                                0xFF007AFF), // Set the border color to grey when focused
                            width:
                                2, // Optional: Adjust the width for better visibility
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 2, // Adjust vertical padding
                          horizontal: 12, // Adjust horizontal padding
                        ),
                      ),
                      value: _selectedServiceOffice,
                      items: _serviceOffices.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedServiceOffice = value;
                          if (_serviceOffices
                              .contains(_selectedServiceOffice)) {
                            _formKeys[_currentStep].currentState?.validate();
                          }
                        });
                      },
                      validator: (value) => value == null
                          ? 'Please select a service office'
                          : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Client',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Underline
                  Container(
                    height: 2,
                    width: double.infinity,
                    color:
                        const Color(0xFF00B4D1), // Light blue underline color
                  ),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Client Name',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Flexible(
                            child: Container(
                              height: 35,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                      width: 2, // Default border width
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 2 // Set the border color to grey
                                        ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                      color: Color(
                                          0xFF007AFF), // Set the border color to grey when focused
                                      width:
                                          2, // Optional: Adjust the width for better visibility
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 2, // Adjust vertical padding
                                    horizontal: 12, // Adjust horizontal padding
                                  ),
                                ),
                                value: _selectedClientName,
                                items: _clientNames.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedClientName = value;
                                    if (_clientNames
                                        .contains(_selectedClientName)) {
                                      _formKeys[_currentStep]
                                          .currentState
                                          ?.validate();
                                    }
                                  });
                                },
                                validator: (value) => value == null
                                    ? 'Please select a client name'
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            'Client Reference',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Flexible(
                            // Replace Expanded with Flexible to prevent overflow
                            child: Container(
                              height: 35,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                      width: 2, // Default border width
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 2 // Set the border color to grey
                                        ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                      color: Color(
                                          0xFF007AFF), // Set the border color to grey when focused
                                      width:
                                          2, // Optional: Adjust the width for better visibility
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 2, // Adjust vertical padding
                                    horizontal: 12, // Adjust horizontal padding
                                  ),
                                ),
                                value: _selectedClientReference,
                                items: _clientReferences.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedClientReference = value;
                                    if (_clientReferences
                                        .contains(_selectedClientReference)) {
                                      _formKeys[_currentStep]
                                          .currentState
                                          ?.validate();
                                    }
                                  });
                                },
                                validator: (value) => value == null
                                    ? 'Please select a client reference'
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )

                  // Client Reference Field
                ],
              ),
            )
          ],
        );
      case 1:
        return TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(labelText: 'Email'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
        );
      case 2:
        return const Center(child: Text('Ready to submit!'));
      default:
        return const SizedBox.shrink();
    }
  }

  void _nextStep() {
    final formState = _formKeys[_currentStep].currentState;

    // Validate the current form
    if (formState != null && !formState.validate()) {
      // If validation fails, return or show a message (optional)
      return;
    }

    // Move to the next step if validation passes
    if (_currentStep < _formKeys.length - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      // Handle form submission
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Form submitted successfully!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.scrollController,
      children: <Widget>[
        const SizedBox(height: 20), // Add some top padding
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 1.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 25,
                height: 25,
                child: Image.asset(
                  "assets/images/icons/X.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.black,
          thickness: 1.0,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "New Job",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF156CC9),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                child: Image.asset(
                  "assets/images/icons/newJobIcon.png",
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1, // 80% of screen width
          child: Transform.scale(
            scale: 0.79,
            child: FlutterHorizontalStepper(
              steps: const ["Step-1", "Step-2", "Step-3"],
              radius: 45,
              currentStep: _currentStep + 1,
              child: const [
                Text("1"),
                Text("2"),
                Text("3"),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Material(
          child: Container(
            color: const Color(0xFF7F8E9D),
            width: double.infinity,
            height: 30.0,
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Text(
                    "1",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                VerticalDivider(
                  color: Colors.white, // Color of the divider
                  thickness: 1.0, // Thickness of the divider
                  width: 40.0, // Space taken by the divider horizontally
                  // Space taken by the divider horizontally
                  indent: 0.0, // Top padding
                  endIndent: 0.0, // Bottom padding
                ),
                Padding(
                  padding: EdgeInsets.only(left: 1.0),
                  child: Text(
                    "Step 1",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Material(
          color: Colors.white,
          child: Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 3.0,
                  bottom: 5.0,
                  left: 10.0,
                  right: 10.0,
                ),
                child: Column(
                  children: [
                    Form(
                      key: _formKeys[_currentStep],
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: _buildStepContent(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (_currentStep > 0)
                          TextButton(
                            onPressed: _prevStep,
                            child: const Text('Back'),
                          ),
                        ElevatedButton(
                          onPressed: _nextStep,
                          child: Text(_currentStep == _formKeys.length - 1
                              ? 'Submit'
                              : 'Next'),
                        ),
                      ],
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
