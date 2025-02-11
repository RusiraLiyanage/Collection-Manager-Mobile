import 'package:flutter/material.dart';
import 'package:horizontal_stepper_flutter/horizontal_stepper_flutter.dart';
import 'package:project_code_blue/screens/OnsiteJobs/onSiteJobsNewCard.dart';

class NewJobAndroidEdited extends StatefulWidget {
  final ScrollController scrollController;
  const NewJobAndroidEdited({super.key, required this.scrollController});

  @override
  State<NewJobAndroidEdited> createState() => _NewJobAndroidEditedState();
}

class _NewJobAndroidEditedState extends State<NewJobAndroidEdited> {
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  int _currentStep = 0;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _donorsController = TextEditingController();
  final TextEditingController _jobReferenceController = TextEditingController();

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

  DateTime? _selectedJobDate;
  TimeOfDay? _selectedTime;

  // Declare the _selectedDuration variable
  Duration? _selectedDuration;
  int _selectedNoDonors = 0;

  int hours = 0;
  int minutes = 0;

  bool isMobileClinic = false;

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return Column(children: [
          const SizedBox(height: 8),
          Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 182,
                child: Card(
                  surfaceTintColor: Colors.white,
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 12.0,
                      bottom: 12.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Left-aligned title
                            Row(
                              children: [
                                Text(
                                  "Client",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 112,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFFE6F7FA), // Light blue background
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 12.0,
                                  top: 15.0,
                                  right: 12.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Collection\nOrganisation",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 206,
                                      child: DropdownButtonFormField<String>(
                                        icon: Image.asset(
                                          "assets/images/icons/dropDownIcon.png", // Replace with your image path
                                          width: 16, // Adjust the size
                                          height: 16,
                                        ),
                                        elevation: 20,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 2, // Default border width
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width:
                                                  2, // Set the border color to grey
                                              // Set the border color to grey
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors
                                                  .white, // Set the border color to grey when focused
                                              width:
                                                  2, // Optional: Adjust the width for better visibility
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors
                                                  .red, // Set the border color to grey when focused
                                              width:
                                                  2, // Optional: Adjust the width for better visibility
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: const BorderSide(
                                              color: Colors
                                                  .red, // Set the border color to grey when focused
                                              width:
                                                  2, // Optional: Adjust the width for better visibility
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical:
                                                5, // Adjust vertical padding
                                            horizontal:
                                                12, // Adjust horizontal padding
                                          ),
                                          errorStyle: TextStyle(
                                            color: Colors.red,
                                            fontSize:
                                                12, // Adjust font size if needed
                                          ), // Reserve space for error messages
                                        ),
                                        value: _selectedCollectionOrganisation,
                                        items: _collectionOrganisations
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedCollectionOrganisation =
                                                value;
                                            /* if (_selectedCollectionOrganisation!.length < 0) {
                                // Clear error state once a valid selection is made
                                _formKeys[_currentStep].currentState?.validate();
                              } */
                                          });
                                        },
                                        validator: (value) => value == null
                                            ? 'Please select a collection organisation'
                                            : null,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ]);
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
    return Column(
      children: [
        Container(
          color: Color(0xFFEDEEF0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 1.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 18.0,
                    ),
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
              ),
              const Divider(
                color: Colors.black,
                thickness: 1.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20), // Adjust as needed
                    bottomRight: Radius.circular(20), // Adjust as needed
                  ),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "New Job",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                      width: MediaQuery.of(context).size.width *
                          1, // 80% of screen width
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
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              /*  Material(
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
              ), */
            ],
          ),
        ), // Add some top padding
        Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          child: Material(
            color: Color(0xFFEDEEF0),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 3.0,
                bottom: 5.0,
                left: 0.0,
                right: 0.0,
              ),
              child: Column(
                children: [
                  Scrollbar(
                    thumbVisibility: true, // Show the scrollbar thumb
                    trackVisibility: true,
                    child: Form(
                      key: _formKeys[_currentStep],
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
      ],
    );
  }
}
