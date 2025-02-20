import 'package:flutter/material.dart';
import 'package:horizontal_stepper_flutter/horizontal_stepper_flutter.dart';
import 'package:project_code_blue/screens/OnsiteJobs/onSiteJobsNewCard.dart';

enum TestsType {
  alcoholOnly,
  alcoholAndDrug,
  DrugOnly,
}

class NewCalloutJob extends StatefulWidget {
  final ScrollController scrollController;

  const NewCalloutJob({super.key, required this.scrollController});

  @override
  State<NewCalloutJob> createState() => _NewCalloutJobState();
}

class _NewCalloutJobState extends State<NewCalloutJob> {
  TestsType? _testsType = TestsType.alcoholOnly;
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
  ];

  int _currentStep = 0;

  final TextEditingController _donorsController = TextEditingController();
  final TextEditingController _jobReferenceController = TextEditingController();
  final TextEditingController _typeOfServiceController =
      TextEditingController();

  final TextEditingController _clientNameController = TextEditingController();

  final TextEditingController _clientReferenceController =
      TextEditingController();

  final TextEditingController _calloutInstructionsController =
      TextEditingController();

  // Dropdown values
  String? _selectedCollectionOrganisation;
  String? _selectedSite;
  String? _selectedCollectorOneAssignment;
  String? _selectedCollectorTwoAssignment;
  String? _selectedServiceOffice;

  String? _selectedJobReference;
  String? _selectedTypeOfService;

  final GlobalKey<FormFieldState<String>> _collectionOrgKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _serviceOfficeKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _jobDateKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _startTimeKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _jobDurationKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _numberOfDonorsKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _typeOfServiceKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _jobReferenceKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _siteKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _collectorOneAssignmentKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _collectorTwoAssignmentKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _clientReferenceKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _clientNameKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _calloutInstructionsKey =
      GlobalKey<FormFieldState<String>>();

  // Dropdown options
  final List<String> _collectionOrganisations = ['Org 1', 'Org 2', 'Org 3'];
  final List<String> _sites = ['Site 1', 'Site 2', 'Site 3'];
  final List<String> _collectorOneAssignment = [
    'Allocated',
    'Accepted',
    'Rejected'
  ];
  final List<String> _collectorTwoAssignment = [
    'Allocated',
    'Accepted',
    'Rejected'
  ];
  final List<String> _serviceOffices = ['Clinic 1', 'Clinic 2', 'Clinic 3'];

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
              height: 180,
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
                      /* Row(
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
                      ), */
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 125,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              const Color(0xFFE6F7FA), // Light blue background
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
                                      key: _collectionOrgKey,
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
                                        focusedErrorBorder: OutlineInputBorder(
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
                                          _collectionOrgKey.currentState!
                                              .validate(); // Revalidate the field
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
                            ),
                            SizedBox(
                              height: 5,
                            ),
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
                                    "Service Office\n(Clinc)",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 206,
                                    child: DropdownButtonFormField<String>(
                                      key: _serviceOfficeKey,
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
                                        focusedErrorBorder: OutlineInputBorder(
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
                                      value: _selectedServiceOffice,
                                      items:
                                          _serviceOffices.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedServiceOffice = value;
                                          _serviceOfficeKey.currentState!
                                              .validate();
                                          /* if (_selectedCollectionOrganisation!.length < 0) {
                                // Clear error state once a valid selection is made
                                _formKeys[_currentStep].currentState?.validate();
                              } */
                                        });
                                      },
                                      validator: (value) => value == null
                                          ? 'Please select a Service Office'
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
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 190,
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
                        height: 6,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Client Name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 206,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _clientNameKey,
                                        controller: _clientNameController,
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
                                            _clientNameController.text =
                                                value; // Manually update the controller text
                                            _clientNameKey.currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_clientNameController.text ==
                                              "") {
                                            return 'Please enter the client name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Client Reference",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 206,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _clientReferenceKey,
                                        controller: _clientReferenceController,
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
                                            _clientReferenceController.text =
                                                value; // Manually update the controller text
                                            _clientReferenceKey.currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_clientReferenceController.text ==
                                              "") {
                                            return 'Please enter the client reference';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
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
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 450,
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
                                "Job Details",
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
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Job Date *",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 206,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _jobDateKey,
                                        readOnly:
                                            true, // Prevent direct text input
                                        controller: TextEditingController(
                                          text: _selectedJobDate != null
                                              ? '${_selectedJobDate!.day}/${_selectedJobDate!.month}/${_selectedJobDate!.year}' // Format the selected date
                                              : '',
                                        ),

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
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.all(
                                                8.0), // Adjust the padding as needed
                                            child: Image.asset(
                                              "assets/images/icons/icon_calendar.png", // Replace with your image path
                                              width:
                                                  32, // Adjust the width of the image
                                              height:
                                                  32, // Adjust the height of the image
                                            ),
                                          ),
                                        ),
                                        onTap: () async {
                                          // Show date picker dialog
                                          final selectedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(
                                                2000), // Earliest date the user can pick
                                            lastDate: DateTime(
                                                2100), // Latest date the user can pick
                                          );

                                          if (selectedDate != null) {
                                            setState(() {
                                              _selectedJobDate = selectedDate;
                                              _jobDateKey.currentState!
                                                  .validate();
                                            });
                                          }
                                        },
                                        validator: (value) =>
                                            _selectedJobDate == null
                                                ? 'Please select a job date'
                                                : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Start Time",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 206,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _startTimeKey,
                                        readOnly:
                                            true, // Prevent direct text input
                                        controller: TextEditingController(
                                          text: _selectedTime != null
                                              ? '${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}' // Format the selected time
                                              : '',
                                        ),
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
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.all(
                                                8.0), // Adjust the padding as needed
                                            child: Image.asset(
                                              "assets/images/icons/icon_calendar.png", // Replace with your image path
                                              width:
                                                  32, // Adjust the width of the image
                                              height:
                                                  32, // Adjust the height of the image
                                            ),
                                          ),
                                        ),
                                        onTap: () async {
                                          // Show time picker dialog
                                          final selectedTime =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                          );

                                          if (selectedTime != null) {
                                            setState(() {
                                              _selectedTime = selectedTime;
                                              _startTimeKey.currentState!
                                                  .validate();
                                            });
                                          }
                                        },
                                        validator: (value) =>
                                            _selectedTime == null
                                                ? 'Please select a start time'
                                                : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Duration",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 206,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _jobDurationKey,
                                        readOnly:
                                            true, // Prevent direct text input
                                        controller: TextEditingController(
                                          text: _selectedDuration != null
                                              ? '${_selectedDuration!.inHours}:${(_selectedDuration!.inMinutes % 60).toString().padLeft(2, '0')}' // Format the selected duration
                                              : '',
                                        ),
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
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.all(
                                                8.0), // Adjust the padding as needed
                                            child: Image.asset(
                                              "assets/images/icons/icon_calendar.png", // Replace with your image path
                                              width:
                                                  32, // Adjust the width of the image
                                              height:
                                                  32, // Adjust the height of the image
                                            ),
                                          ),
                                        ),
                                        onTap: () async {
                                          // Show duration selection dialog
                                          final selectedDuration =
                                              await showDialog<Duration>(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                  'Select Duration',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors
                                                        .blueAccent, // Title text color
                                                  ),
                                                ),
                                                content: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Hours:',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16,
                                                              color: Colors
                                                                      .grey[
                                                                  700], // Text color
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 8),
                                                          DropdownButton<int>(
                                                            value: hours,
                                                            items:
                                                                List.generate(
                                                                    24,
                                                                    (index) {
                                                              return DropdownMenuItem<
                                                                  int>(
                                                                value: index,
                                                                child: Text(
                                                                    '$index'),
                                                              );
                                                            }),
                                                            onChanged: (value) {
                                                              if (value !=
                                                                  null) {
                                                                setState(() {
                                                                  hours = value;
                                                                });
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Minutes:',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16,
                                                              color: Colors
                                                                      .grey[
                                                                  700], // Text color
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 8),
                                                          DropdownButton<int>(
                                                            value: minutes,
                                                            items:
                                                                List.generate(
                                                                    60,
                                                                    (index) {
                                                              return DropdownMenuItem<
                                                                  int>(
                                                                value: index,
                                                                child: Text(
                                                                    '$index'),
                                                              );
                                                            }),
                                                            onChanged: (value) {
                                                              if (value !=
                                                                  null) {
                                                                setState(() {
                                                                  minutes =
                                                                      value;
                                                                });
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16), // Rounded corners
                                                ),
                                                backgroundColor: Colors
                                                    .white, // Dialog background color
                                                actionsPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 16),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop(
                                                          Duration(
                                                              hours: hours,
                                                              minutes:
                                                                  minutes));
                                                    },
                                                    style: TextButton.styleFrom(
                                                      foregroundColor:
                                                          Colors.white,
                                                      backgroundColor: Colors
                                                          .blueAccent, // Button background color
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                8), // Button border radius
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'OK',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    style: TextButton.styleFrom(
                                                      foregroundColor: Colors
                                                          .blueAccent, // Button text color
                                                    ),
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );

                                          if (selectedDuration != null) {
                                            setState(() {
                                              _selectedDuration =
                                                  selectedDuration;
                                              _jobDurationKey.currentState!
                                                  .validate();
                                            });
                                          }
                                        },
                                        validator: (value) =>
                                            _selectedDuration == null
                                                ? 'Please select a duration'
                                                : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Number of\ndonors",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 206,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _numberOfDonorsKey,
                                        controller: _donorsController,
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
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.all(
                                                8.0), // Adjust the padding as needed
                                            child: Image.asset(
                                              "assets/images/icons/icon_calendar.png", // Replace with your image path
                                              width:
                                                  32, // Adjust the width of the image
                                              height:
                                                  32, // Adjust the height of the image
                                            ),
                                          ),
                                        ),
                                        keyboardType: TextInputType
                                            .number, // Ensures numeric input
                                        onChanged: (value) {
                                          setState(() {
                                            // Update the number of donors and the text controller
                                            _selectedNoDonors =
                                                int.tryParse(value)!;
                                            _donorsController.text =
                                                value; // Manually update the controller text
                                            _numberOfDonorsKey.currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          print(_donorsController.text);
                                          if (_donorsController.text == "") {
                                            return 'Please enter a valid number of donors';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Job Reference",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 206,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _jobReferenceKey,
                                        controller: _jobReferenceController,
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
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.all(
                                                8.0), // Adjust the padding as needed
                                            child: Image.asset(
                                              "assets/images/icons/icon_calendar.png", // Replace with your image path
                                              width:
                                                  32, // Adjust the width of the image
                                              height:
                                                  32, // Adjust the height of the image
                                            ),
                                          ),
                                        ),
                                        keyboardType: TextInputType
                                            .text, // Ensures numeric input
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedJobReference = value;
                                            // Update the number of donors and the text controller
                                            _jobReferenceController.text =
                                                value; // Manually update the controller text
                                            _jobReferenceKey.currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_jobReferenceController.text ==
                                              "") {
                                            return 'Please enter a valid job referenace';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Type of\nService",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 206,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _typeOfServiceKey,
                                        controller: _typeOfServiceController,
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
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.all(
                                                8.0), // Adjust the padding as needed
                                            child: Image.asset(
                                              "assets/images/icons/icon_calendar.png", // Replace with your image path
                                              width:
                                                  32, // Adjust the width of the image
                                              height:
                                                  32, // Adjust the height of the image
                                            ),
                                          ),
                                        ),
                                        keyboardType: TextInputType
                                            .text, // Ensures numeric input
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedTypeOfService = value;
                                            // Update the number of donors and the text controller
                                            _typeOfServiceController.text =
                                                value; // Manually update the controller text
                                            _typeOfServiceKey.currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_typeOfServiceController.text ==
                                              "") {
                                            return 'Please enter a valid type of service';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 150,
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
                                "Location",
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
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Site",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 40,
                                    width: 206,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: DropdownButtonFormField<String>(
                                        key: _siteKey,
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
                                        value: _selectedSite,
                                        items: _sites.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedSite = value;
                                            _siteKey.currentState!
                                                .validate(); // Revalidate the field
                                            /* if (_selectedCollectionOrganisation!.length < 0) {
                                // Clear error state once a valid selection is made
                                _formKeys[_currentStep].currentState?.validate();
                              } */
                                          });
                                        },
                                        validator: (value) => value == null
                                            ? 'Please select a site'
                                            : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 310,
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
                                "Callout Instructions",
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
                      Column(
                        children: [
                          Container(
                            height: 230,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(
                                  0xFFE6F7FA), // Light blue background
                              borderRadius: BorderRadius.circular(19),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 9.0, left: 9.0, top: 9.0, bottom: 9.0),
                              child: Container(
                                height: 230,
                                width: double.infinity,
                                child: Material(
                                  elevation: 4,
                                  shadowColor: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15),
                                  child: TextFormField(
                                    key: _calloutInstructionsKey,
                                    controller: _calloutInstructionsController,
                                    maxLines:
                                        null, // Makes the text field expandable
                                    minLines: 8,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide
                                            .none, // Removes border outline
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                          color: Colors
                                              .white, // Set the border color to grey when focused
                                          width:
                                              2, // Optional: Adjust the width for better visibility
                                        ),
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
                                        _calloutInstructionsController.text =
                                            value;
                                        _calloutInstructionsKey.currentState
                                            ?.validate();
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a valid donor selection process';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 450,
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
                                  "Assign Collectors",
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
                          height: 6,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 0.0,
                                top: 15.0,
                                right: 0.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: const Text(
                                      "Number of Collectors",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Color(0xFF94A3B8),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 61,
                                    height: 26,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .transparent, // No background color
                                      border: Border.all(
                                        color: Color(
                                            0x8C808080), // Border color with 55% opacity
                                        width:
                                            1.5, // Adjust thickness as needed
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          2), // Optional: rounded corners
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("2"),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromRGBO(
                                          26, 140, 255, 1.0), // Blue color
                                      foregroundColor:
                                          Colors.white, // Text color
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 1), // Adjust padding
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            6), // Slightly rounded edges
                                      ),
                                      textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight
                                            .w500, // Medium weight text
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Add Collector",
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 130,
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
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                            bottom: 5.0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Collector 1",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              FittedBox(
                                                fit: BoxFit.contain,
                                                child: Image.asset(
                                                    "assets/images/icons/delete.png"),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 302,
                                          child:
                                              DropdownButtonFormField<String>(
                                            key: _collectorOneAssignmentKey,
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
                                                  width:
                                                      2, // Default border width
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
                                            value:
                                                _selectedCollectorOneAssignment,
                                            items: _collectorOneAssignment
                                                .map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedCollectorOneAssignment =
                                                    value;
                                                _collectorOneAssignmentKey
                                                    .currentState!
                                                    .validate(); // Revalidate the field
                                                /* if (_selectedCollectionOrganisation!.length < 0) {
                                                                        // Clear error state once a valid selection is made
                                                                        _formKeys[_currentStep].currentState?.validate();
                                                                      } */
                                              });
                                            },
                                            validator: (value) => value == null
                                                ? 'Please take an action'
                                                : null,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              // Allocated Badge
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      26,
                                                      140,
                                                      255,
                                                      1.0), // Blue background
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Text(
                                                  "Allocated",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  width:
                                                      8), // Space between badge and text

                                              // Date and Time
                                              Text(
                                                "08:30 am | 29 Apr 2024",
                                                style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              height: 130,
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
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                            bottom: 5.0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Collector 2",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              FittedBox(
                                                fit: BoxFit.contain,
                                                child: Image.asset(
                                                    "assets/images/icons/delete.png"),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 302,
                                          child:
                                              DropdownButtonFormField<String>(
                                            key: _collectorTwoAssignmentKey,
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
                                                  width:
                                                      2, // Default border width
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
                                            value:
                                                _selectedCollectorTwoAssignment,
                                            items: _collectorTwoAssignment
                                                .map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedCollectorTwoAssignment =
                                                    value;
                                                _collectorTwoAssignmentKey
                                                    .currentState!
                                                    .validate(); // Revalidate the field
                                                /* if (_selectedCollectionOrganisation!.length < 0) {
                                                                        // Clear error state once a valid selection is made
                                                                        _formKeys[_currentStep].currentState?.validate();
                                                                      } */
                                              });
                                            },
                                            validator: (value) => value == null
                                                ? 'Please take an action'
                                                : null,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              // Allocated Badge
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      26,
                                                      140,
                                                      255,
                                                      1.0), // Blue background
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Text(
                                                  "Allocated",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  width:
                                                      8), // Space between badge and text

                                              // Date and Time
                                              Text(
                                                "08:30 am | 29 Apr 2024",
                                                style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Color for the Back button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    minimumSize:
                        Size(80, 30), // Sets a minimum width and height
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: _nextStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Color for the Next button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    minimumSize: Size(80, 30),
                  ),
                  child: const Text(
                    "Create Callout Job",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ]);
      case 2:
      default:
        return const SizedBox.shrink();
    }
  }

  void _nextStep() {
    final formState = _formKeys[_currentStep].currentState;

    // Validate the current form
    if (formState != null && !formState.validate()) {
      // If validation fails, return or show a message (optional)
      // Scroll to the top if validation fails
      widget.scrollController.animateTo(
        0, // Scroll to top
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
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
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      trackVisibility: false,
      thumbVisibility: true,
      child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: widget.scrollController,
          children: [
            Column(
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
                            bottomRight:
                                Radius.circular(20), // Adjust as needed
                          ),
                        ),
                        child: Column(
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "New Callout Job",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    child: Image.asset(
                                      "assets/images/icons/newCalloutIcon.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ), // Add some top padding
                Material(
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
