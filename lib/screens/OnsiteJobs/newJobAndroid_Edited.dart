import 'package:flutter/material.dart';
import 'package:horizontal_stepper_flutter/horizontal_stepper_flutter.dart';
import 'package:project_code_blue/screens/OnsiteJobs/onSiteJobsNewCard.dart';

enum TestsType {
  alcoholOnly,
  alcoholAndDrug,
  DrugOnly,
}

class NewJobAndroidEdited extends StatefulWidget {
  final ScrollController scrollController;

  const NewJobAndroidEdited({super.key, required this.scrollController});

  @override
  State<NewJobAndroidEdited> createState() => _NewJobAndroidEditedState();
}

class _NewJobAndroidEditedState extends State<NewJobAndroidEdited> {
  TestsType? _testsType = TestsType.alcoholOnly;
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
  final TextEditingController _typeOfServiceController =
      TextEditingController();
  final TextEditingController _siteController = TextEditingController();
  final TextEditingController _siteContact_1_Controller =
      TextEditingController();
  final TextEditingController _siteContact_2_Controller =
      TextEditingController();
  final TextEditingController _mobile_Controller = TextEditingController();

  final TextEditingController _category1_Controller = TextEditingController();

  final TextEditingController _category2Controller = TextEditingController();

  final TextEditingController _category1LimitGController =
      TextEditingController();

  final TextEditingController _category1SetLimitOutTimeController =
      TextEditingController();

  final TextEditingController _category2LimitGController =
      TextEditingController();

  final TextEditingController _category2SetLimitOutTimeController =
      TextEditingController();

  final TextEditingController _siteContact_3_Controller =
      TextEditingController();

  final TextEditingController _category3SetLimitOutTimeController =
      TextEditingController();

  final TextEditingController _category3LimitGController =
      TextEditingController();

  final TextEditingController _primaryDrugTestController =
      TextEditingController();

  final TextEditingController _primaryDrugTestPreferredDeviceController =
      TextEditingController();

  final TextEditingController _secondaryDrugTestController =
      TextEditingController();

  final TextEditingController _secondaryDrugTestPreferredDeviceController =
      TextEditingController();

  final TextEditingController _thirteryDrugTestController =
      TextEditingController();

  final TextEditingController _thirteryDrugTestPreferredDeviceController =
      TextEditingController();

  final TextEditingController _additionalTestsController =
      TextEditingController();

  final TextEditingController _additioanlTestInstructionsController =
      TextEditingController();

  final TextEditingController _donorSelectionProcessController =
      TextEditingController();

  final TextEditingController _screeningAndTestingProcessController =
      TextEditingController();

  final TextEditingController _testConfirmationInstructionsController =
      TextEditingController();

  final TextEditingController _globalSiteAccessInstructionsController =
      TextEditingController();

  final TextEditingController _specificLocalSiteAccessInstructionsController =
      TextEditingController();

  final TextEditingController _specialInstructionsController =
      TextEditingController();

  final TextEditingController _authorizedRepresentativeController =
      TextEditingController();

  final TextEditingController _authorizedRepresentativeMobileNumberController =
      TextEditingController();

  final TextEditingController _positionController = TextEditingController();

  final TextEditingController _authorizedRepresentativeEmailController =
      TextEditingController();

  final TextEditingController _clientNameController = TextEditingController();

  final TextEditingController _clientReferenceController =
      TextEditingController();

  // Dropdown values
  String? _selectedCollectionOrganisation;
  String? _selectedCollectorOneAssignment;
  String? _selectedCollectorTwoAssignment;
  String? _selectedServiceOffice;

  String? _selectedClientName;
  String? _selectedClientReference;
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

  final GlobalKey<FormFieldState<String>> _siteContact1Key =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _siteContact2Key =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _mobileKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category1Key =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category1Limit210L =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category1SitoutTimeKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category2Key =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category2Limit210L =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category2SitoutTimeKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category3Key =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category3Limit210L =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _category3SitoutTimeKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _primaryTestSpecificationsKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _selectPreferedPrimaryDeviceKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _secondaryDrugTestKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _selectPreferedSecondaryDeviceKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _thirtoryDrugTestKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _selectPreferedThirtoryDeviceKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _additionalTestsKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _additioanlTestInstructionsKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _donorSelectionProcessKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _screeningAndTestingProcessKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _testConfirmationInstructionsKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _globalSiteAccessInstructionsKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>>
      _specificLocalSiteAccessInstructionsKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _specialInstructionsKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _authorizedRepresentativeKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>>
      _authorizedRepresentativeMobileNumberKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _positionKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _authorizedRepresentativeEmailKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _collectorOneAssignmentKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _collectorTwoAssignmentKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _clientNameKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _clientReferenceKey =
      GlobalKey<FormFieldState<String>>();

  // Dropdown options
  final List<String> _collectionOrganisations = ['Org 1', 'Org 2', 'Org 3'];
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
                      /*  Row(
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
              height: 490,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left-aligned title
                          Row(
                            children: [
                              Text(
                                "In Clinc",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Transform.scale(
                                scale: 0.7,
                                child: Switch(
                                  activeColor: Colors.white,
                                  activeTrackColor: Colors.black,
                                  value: isMobileClinic,
                                  onChanged: (value) {
                                    setState(() {
                                      isMobileClinic = value;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "Mobile Clinc",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
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
                                      child: TextFormField(
                                        key: _siteKey,
                                        controller: _siteController,
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
                                            // Update the number of donors and the text controller
                                            _siteController.text =
                                                value; // Manually update the controller text
                                            _siteKey.currentState!.validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_siteController.text == "") {
                                            return 'Please enter a valid site name';
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
                                  "Site Contact 1",
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
                                        key: _siteContact1Key,
                                        controller: _siteContact_1_Controller,
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
                                            // Update the number of donors and the text controller
                                            _siteContact_1_Controller.text =
                                                value; // Manually update the controller text
                                            _siteContact1Key.currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_siteContact_1_Controller.text ==
                                              "") {
                                            return 'Please enter a valid site contact name';
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
                                  "Site Contact 2",
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
                                        key: _siteContact2Key,
                                        controller: _siteContact_2_Controller,
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
                                            // Update the number of donors and the text controller
                                            _siteContact_2_Controller.text =
                                                value; // Manually update the controller text
                                            _siteContact2Key.currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_siteContact_2_Controller.text ==
                                              "") {
                                            return 'Please enter a valid site contact name 2';
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
                                  "Mobile",
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
                                        key: _mobileKey,
                                        controller: _mobile_Controller,
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
                                            .phone, // Ensures numeric input
                                        onChanged: (value) {
                                          setState(() {
                                            // Update the number of donors and the text controller
                                            _mobile_Controller.text =
                                                value; // Manually update the controller text
                                            _mobileKey.currentState!.validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (!RegExp(r'^[0-9]{10}$')
                                              .hasMatch(value!)) {
                                            return 'Please enter a valid mobile number';
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
              height: _testsType == TestsType.alcoholAndDrug
                  ? 1520
                  : _testsType == TestsType.alcoholOnly
                      ? 870
                      : _testsType == TestsType.DrugOnly
                          ? 890
                          : 0,
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
                                "Tests and Devices",
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
                            height: 160,
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
                                    left: 24.0,
                                    top: 4.0,
                                    bottom: 2.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Radio<TestsType>(
                                        value: TestsType.alcoholOnly,
                                        groupValue: _testsType,
                                        onChanged: (TestsType? value) {
                                          setState(() {
                                            _testsType = value;
                                          });
                                        },
                                      ),
                                      const Text(
                                        'Alcohol Test Only',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 0), // Adjust the gap
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 24.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Radio<TestsType>(
                                        value: TestsType.alcoholAndDrug,
                                        groupValue: _testsType,
                                        onChanged: (TestsType? value) {
                                          setState(() {
                                            _testsType = value;
                                          });
                                        },
                                      ),
                                      const Text(
                                        'Alcohol and Drug Test',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 0), // Adjust the gap
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 24.0,
                                    bottom: 8.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Radio<TestsType>(
                                        value: TestsType.DrugOnly,
                                        groupValue: _testsType,
                                        onChanged: (TestsType? value) {
                                          setState(() {
                                            _testsType = value;
                                          });
                                        },
                                      ),
                                      const Text(
                                        'Drug Test Only',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _testsType == TestsType.alcoholOnly
                              ? Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Left-aligned title
                                          Row(
                                            children: [
                                              Text(
                                                "Breath Alcohol Test Limits",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 0.0,
                                          top: 15.0,
                                          right: 0.0,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: const Text(
                                                "Category 1",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 40,
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
                                                    key: _category1Key,
                                                    controller:
                                                        _category1_Controller,
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.white,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.white,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.white,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
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
                                                                .circular(4),
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
                                                        // Update the number of donors and the text controller
                                                        _category1_Controller
                                                                .text =
                                                            value; // Manually update the controller text
                                                        _category1Key
                                                            .currentState!
                                                            .validate();
                                                      });
                                                    },
                                                    validator: (value) {
                                                      if (_category1_Controller
                                                              .text ==
                                                          "") {
                                                        return 'Please enter a valid category 1 name';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        "Limit (g/210L)",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 0.0),
                                                      child: Container(
                                                        width: 160,
                                                        height: 40,
                                                        child: Material(
                                                          elevation:
                                                              4, // Adjust this value for more or less elevation
                                                          shadowColor: Colors
                                                              .black
                                                              .withOpacity(
                                                                  0.5), // Optional: Adjust shadow color
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4), // Match with TextFormField's border radius
                                                          child: TextFormField(
                                                            key:
                                                                _category1Limit210L,
                                                            controller:
                                                                _category1LimitGController,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text, // Ensures numeric input
                                                            onChanged: (value) {
                                                              setState(() {
                                                                // Update the number of donors and the text controller
                                                                _category1LimitGController
                                                                        .text =
                                                                    value; // Manually update the controller text
                                                                _category1Limit210L
                                                                    .currentState!
                                                                    .validate();
                                                              });
                                                            },
                                                            validator: (value) {
                                                              if (_category1LimitGController
                                                                      .text ==
                                                                  "") {
                                                                return 'Please enter a valid limit';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        "Sit Out Time (minutes)",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 0.0),
                                                      child: Container(
                                                        width: 160,
                                                        height: 40,
                                                        child: Material(
                                                          elevation:
                                                              4, // Adjust this value for more or less elevation
                                                          shadowColor: Colors
                                                              .black
                                                              .withOpacity(
                                                                  0.5), // Optional: Adjust shadow color
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4), // Match with TextFormField's border radius
                                                          child: TextFormField(
                                                            key:
                                                                _category1SitoutTimeKey,
                                                            controller:
                                                                _category1SetLimitOutTimeController,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text, // Ensures numeric input
                                                            onChanged: (value) {
                                                              setState(() {
                                                                // Update the number of donors and the text controller
                                                                _category1SetLimitOutTimeController
                                                                        .text =
                                                                    value; // Manually update the controller text
                                                                _category1SitoutTimeKey
                                                                    .currentState!
                                                                    .validate();
                                                              });
                                                            },
                                                            validator: (value) {
                                                              if (_category1SetLimitOutTimeController
                                                                      .text ==
                                                                  "") {
                                                                return 'Please enter a valid set out time';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: List.generate(
                                                60, // Adjust the number of dashes
                                                (index) => Container(
                                                  width:
                                                      4, // Width of each dash
                                                  height:
                                                      2, // Height of each dash (thickness)
                                                  color: Colors
                                                      .black, // Color of the dash
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
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
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: const Text(
                                                "Category 2",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 40,
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
                                                    key: _category2Key,
                                                    controller:
                                                        _category2Controller,
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.white,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.white,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.white,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
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
                                                                .circular(4),
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
                                                        _category2Key
                                                            .currentState!
                                                            .validate();
                                                        // Update the number of donors and the text controller
                                                        _category2Controller
                                                                .text =
                                                            value; // Manually update the controller text
                                                      });
                                                    },
                                                    validator: (value) {
                                                      if (_category2Controller
                                                              .text ==
                                                          "") {
                                                        return 'Please enter a valid category 2 name';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        "Limit (g/210L)",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 0.0),
                                                      child: Container(
                                                        width: 160,
                                                        height: 40,
                                                        child: Material(
                                                          elevation:
                                                              4, // Adjust this value for more or less elevation
                                                          shadowColor: Colors
                                                              .black
                                                              .withOpacity(
                                                                  0.5), // Optional: Adjust shadow color
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4), // Match with TextFormField's border radius
                                                          child: TextFormField(
                                                            key:
                                                                _category2Limit210L,
                                                            controller:
                                                                _category2LimitGController,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text, // Ensures numeric input
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _category2Limit210L
                                                                    .currentState!
                                                                    .validate();
                                                                // Update the number of donors and the text controller
                                                                _category2LimitGController
                                                                        .text =
                                                                    value; // Manually update the controller text
                                                              });
                                                            },
                                                            validator: (value) {
                                                              if (_category2LimitGController
                                                                      .text ==
                                                                  "") {
                                                                return 'Please enter a valid limit';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        "Sit Out Time (minutes)",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 0.0),
                                                      child: Container(
                                                        width: 160,
                                                        height: 40,
                                                        child: Material(
                                                          elevation:
                                                              4, // Adjust this value for more or less elevation
                                                          shadowColor: Colors
                                                              .black
                                                              .withOpacity(
                                                                  0.5), // Optional: Adjust shadow color
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4), // Match with TextFormField's border radius
                                                          child: TextFormField(
                                                            key:
                                                                _category2SitoutTimeKey,
                                                            controller:
                                                                _category2SetLimitOutTimeController,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text, // Ensures numeric input
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _category2SitoutTimeKey
                                                                    .currentState!
                                                                    .validate();
                                                                // Update the number of donors and the text controller
                                                                _category2SetLimitOutTimeController
                                                                        .text =
                                                                    value; // Manually update the controller text
                                                              });
                                                            },
                                                            validator: (value) {
                                                              if (_category2SetLimitOutTimeController
                                                                      .text ==
                                                                  "") {
                                                                return 'Please enter a valid sit out time';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: List.generate(
                                                60, // Adjust the number of dashes
                                                (index) => Container(
                                                  width:
                                                      4, // Width of each dash
                                                  height:
                                                      2, // Height of each dash (thickness)
                                                  color: Colors
                                                      .black, // Color of the dash
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
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
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: const Text(
                                                "Category 3",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 40,
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
                                                    key: _category3Key,
                                                    controller:
                                                        _siteContact_3_Controller,
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.white,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.white,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.white,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
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
                                                                .circular(4),
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
                                                        // Update the number of donors and the text controller
                                                        _siteContact_3_Controller
                                                                .text =
                                                            value; // Manually update the controller text
                                                        _category3Key
                                                            .currentState!
                                                            .validate();
                                                      });
                                                    },
                                                    validator: (value) {
                                                      if (_siteContact_3_Controller
                                                              .text ==
                                                          "") {
                                                        return 'Please enter a valid category name';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        "Limit (g/210L)",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 0.0),
                                                      child: Container(
                                                        width: 160,
                                                        height: 40,
                                                        child: Material(
                                                          elevation:
                                                              4, // Adjust this value for more or less elevation
                                                          shadowColor: Colors
                                                              .black
                                                              .withOpacity(
                                                                  0.5), // Optional: Adjust shadow color
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4), // Match with TextFormField's border radius
                                                          child: TextFormField(
                                                            key:
                                                                _category3Limit210L,
                                                            controller:
                                                                _category3LimitGController,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text, // Ensures numeric input
                                                            onChanged: (value) {
                                                              setState(() {
                                                                // Update the number of donors and the text controller
                                                                _category3LimitGController
                                                                        .text =
                                                                    value; // Manually update the controller text
                                                                _category3Limit210L
                                                                    .currentState!
                                                                    .validate();
                                                              });
                                                            },
                                                            validator: (value) {
                                                              if (_category3LimitGController
                                                                      .text ==
                                                                  "") {
                                                                return 'Please enter a valid limit';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        "Sit Out Time (minutes)",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 0.0),
                                                      child: Container(
                                                        width: 160,
                                                        height: 40,
                                                        child: Material(
                                                          elevation:
                                                              4, // Adjust this value for more or less elevation
                                                          shadowColor: Colors
                                                              .black
                                                              .withOpacity(
                                                                  0.5), // Optional: Adjust shadow color
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4), // Match with TextFormField's border radius
                                                          child: TextFormField(
                                                            key:
                                                                _category3SitoutTimeKey,
                                                            controller:
                                                                _category3SetLimitOutTimeController,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text, // Ensures numeric input
                                                            onChanged: (value) {
                                                              setState(() {
                                                                // Update the number of donors and the text controller
                                                                _category3SetLimitOutTimeController
                                                                        .text =
                                                                    value; // Manually update the controller text

                                                                _category3SitoutTimeKey
                                                                    .currentState!
                                                                    .validate();
                                                              });
                                                            },
                                                            validator: (value) {
                                                              if (_category3SetLimitOutTimeController
                                                                      .text ==
                                                                  "") {
                                                                return 'Please enter a valid site out time';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: List.generate(
                                                60, // Adjust the number of dashes
                                                (index) => Container(
                                                  width:
                                                      4, // Width of each dash
                                                  height:
                                                      2, // Height of each dash (thickness)
                                                  color: Colors
                                                      .black, // Color of the dash
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                )
                              : _testsType == TestsType.alcoholAndDrug
                                  ? Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              // Left-aligned title
                                              Row(
                                                children: [
                                                  Text(
                                                    "Breath Alcohol Test Limits",
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 0.0,
                                              top: 15.0,
                                              right: 0.0,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: const Text(
                                                    "Category 1",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 40,
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
                                                        key: _category1Key,
                                                        controller:
                                                            _category1_Controller,
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
                                                            _category1Key
                                                                .currentState!
                                                                .validate();
                                                            // Update the number of donors and the text controller
                                                            _category1_Controller
                                                                    .text =
                                                                value; // Manually update the controller text
                                                          });
                                                        },
                                                        validator: (value) {
                                                          if (_category1_Controller
                                                                  .text ==
                                                              "") {
                                                            return 'Please enter a valid category';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "Limit (g/210L)",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 0.0),
                                                          child: Container(
                                                            width: 160,
                                                            height: 40,
                                                            child: Material(
                                                              elevation:
                                                                  4, // Adjust this value for more or less elevation
                                                              shadowColor: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.5), // Optional: Adjust shadow color
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4), // Match with TextFormField's border radius
                                                              child:
                                                                  TextFormField(
                                                                key:
                                                                    _category1Limit210L,
                                                                controller:
                                                                    _category1LimitGController,
                                                                decoration:
                                                                    InputDecoration(
                                                                  fillColor:
                                                                      Colors
                                                                          .white,
                                                                  filled: true,
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .red,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .red,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        12,
                                                                  ),
                                                                  errorStyle:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text, // Ensures numeric input
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    _category1Limit210L
                                                                        .currentState!
                                                                        .validate();
                                                                    // Update the number of donors and the text controller
                                                                    _category1LimitGController
                                                                            .text =
                                                                        value; // Manually update the controller text
                                                                  });
                                                                },
                                                                validator:
                                                                    (value) {
                                                                  if (_category1LimitGController
                                                                          .text ==
                                                                      "") {
                                                                    return 'Please enter a valid limit';
                                                                  }
                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "Sit Out Time (minutes)",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 0.0),
                                                          child: Container(
                                                            width: 160,
                                                            height: 40,
                                                            child: Material(
                                                              elevation:
                                                                  4, // Adjust this value for more or less elevation
                                                              shadowColor: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.5), // Optional: Adjust shadow color
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4), // Match with TextFormField's border radius
                                                              child:
                                                                  TextFormField(
                                                                key:
                                                                    _category1SitoutTimeKey,
                                                                controller:
                                                                    _category1SetLimitOutTimeController,
                                                                decoration:
                                                                    InputDecoration(
                                                                  fillColor:
                                                                      Colors
                                                                          .white,
                                                                  filled: true,
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .red,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .red,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        12,
                                                                  ),
                                                                  errorStyle:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text, // Ensures numeric input
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    _category1SitoutTimeKey
                                                                        .currentState!
                                                                        .validate();
                                                                    // Update the number of donors and the text controller
                                                                    _category1SetLimitOutTimeController
                                                                            .text =
                                                                        value; // Manually update the controller text
                                                                  });
                                                                },
                                                                validator:
                                                                    (value) {
                                                                  if (_category1SetLimitOutTimeController
                                                                          .text ==
                                                                      "") {
                                                                    return 'Please enter a valid set limit out time';
                                                                  }
                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: List.generate(
                                                    60, // Adjust the number of dashes
                                                    (index) => Container(
                                                      width:
                                                          4, // Width of each dash
                                                      height:
                                                          2, // Height of each dash (thickness)
                                                      color: Colors
                                                          .black, // Color of the dash
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
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
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: const Text(
                                                    "Category 2",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 40,
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
                                                        key: _category2Key,
                                                        controller:
                                                            _category2Controller,
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
                                                            _category2Key
                                                                .currentState!
                                                                .validate();
                                                            // Update the number of donors and the text controller
                                                            _category2Controller
                                                                    .text =
                                                                value; // Manually update the controller text
                                                          });
                                                        },
                                                        validator: (value) {
                                                          if (_category2Controller
                                                                  .text ==
                                                              "") {
                                                            return 'Please enter a valid category';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "Limit (g/210L)",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 0.0),
                                                          child: Container(
                                                            width: 160,
                                                            height: 40,
                                                            child: Material(
                                                              elevation:
                                                                  4, // Adjust this value for more or less elevation
                                                              shadowColor: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.5), // Optional: Adjust shadow color
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4), // Match with TextFormField's border radius
                                                              child:
                                                                  TextFormField(
                                                                key:
                                                                    _category2Limit210L,
                                                                controller:
                                                                    _category2LimitGController,
                                                                decoration:
                                                                    InputDecoration(
                                                                  fillColor:
                                                                      Colors
                                                                          .white,
                                                                  filled: true,
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .red,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .red,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        12,
                                                                  ),
                                                                  errorStyle:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text, // Ensures numeric input
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    _category2Limit210L
                                                                        .currentState!
                                                                        .validate();
                                                                    // Update the number of donors and the text controller
                                                                    _category2LimitGController
                                                                            .text =
                                                                        value; // Manually update the controller text
                                                                  });
                                                                },
                                                                validator:
                                                                    (value) {
                                                                  if (_category2LimitGController
                                                                          .text ==
                                                                      "") {
                                                                    return 'Please enter a valid limit';
                                                                  }
                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "Sit Out Time (minutes)",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 0.0),
                                                          child: Container(
                                                            width: 160,
                                                            height: 40,
                                                            child: Material(
                                                              elevation:
                                                                  4, // Adjust this value for more or less elevation
                                                              shadowColor: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.5), // Optional: Adjust shadow color
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4), // Match with TextFormField's border radius
                                                              child:
                                                                  TextFormField(
                                                                key:
                                                                    _category2SitoutTimeKey,
                                                                controller:
                                                                    _category2SetLimitOutTimeController,
                                                                decoration:
                                                                    InputDecoration(
                                                                  fillColor:
                                                                      Colors
                                                                          .white,
                                                                  filled: true,
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .red,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .red,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        12,
                                                                  ),
                                                                  errorStyle:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text, // Ensures numeric input
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    _category2SitoutTimeKey
                                                                        .currentState!
                                                                        .validate();
                                                                    // Update the number of donors and the text controller
                                                                    _category2SetLimitOutTimeController
                                                                            .text =
                                                                        value; // Manually update the controller text
                                                                  });
                                                                },
                                                                validator:
                                                                    (value) {
                                                                  if (_category2SetLimitOutTimeController
                                                                          .text ==
                                                                      "") {
                                                                    return 'Please enter a valid sit out time';
                                                                  }
                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: List.generate(
                                                    60, // Adjust the number of dashes
                                                    (index) => Container(
                                                      width:
                                                          4, // Width of each dash
                                                      height:
                                                          2, // Height of each dash (thickness)
                                                      color: Colors
                                                          .black, // Color of the dash
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
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
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: const Text(
                                                    "Category 3",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 40,
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
                                                        key: _category3Key,
                                                        controller:
                                                            _siteContact_3_Controller,
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
                                                            _category3Key
                                                                .currentState!
                                                                .validate();

                                                            // Update the number of donors and the text controller
                                                            _siteContact_3_Controller
                                                                    .text =
                                                                value; // Manually update the controller text
                                                          });
                                                        },
                                                        validator: (value) {
                                                          if (_siteContact_3_Controller
                                                                  .text ==
                                                              "") {
                                                            return 'Please enter a valid category name';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "Limit (g/210L)",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 0.0),
                                                          child: Container(
                                                            width: 160,
                                                            height: 40,
                                                            child: Material(
                                                              elevation:
                                                                  4, // Adjust this value for more or less elevation
                                                              shadowColor: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.5), // Optional: Adjust shadow color
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4), // Match with TextFormField's border radius
                                                              child:
                                                                  TextFormField(
                                                                key:
                                                                    _category3Limit210L,
                                                                controller:
                                                                    _category3LimitGController,
                                                                decoration:
                                                                    InputDecoration(
                                                                  fillColor:
                                                                      Colors
                                                                          .white,
                                                                  filled: true,
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .red,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .red,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        12,
                                                                  ),
                                                                  errorStyle:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text, // Ensures numeric input
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    _category3Limit210L
                                                                        .currentState!
                                                                        .validate();
                                                                    // Update the number of donors and the text controller
                                                                    _category3LimitGController
                                                                            .text =
                                                                        value; // Manually update the controller text
                                                                  });
                                                                },
                                                                validator:
                                                                    (value) {
                                                                  if (_category3LimitGController
                                                                          .text ==
                                                                      "") {
                                                                    return 'Please enter a valid limit';
                                                                  }
                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "Sit Out Time (minutes)",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 0.0),
                                                          child: Container(
                                                            width: 160,
                                                            height: 40,
                                                            child: Material(
                                                              elevation:
                                                                  4, // Adjust this value for more or less elevation
                                                              shadowColor: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.5), // Optional: Adjust shadow color
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4), // Match with TextFormField's border radius
                                                              child:
                                                                  TextFormField(
                                                                key:
                                                                    _category3SitoutTimeKey,
                                                                controller:
                                                                    _category3SetLimitOutTimeController,
                                                                decoration:
                                                                    InputDecoration(
                                                                  fillColor:
                                                                      Colors
                                                                          .white,
                                                                  filled: true,
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .red,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .red,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        12,
                                                                  ),
                                                                  errorStyle:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text, // Ensures numeric input
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    _category3SitoutTimeKey
                                                                        .currentState!
                                                                        .validate();
                                                                    // Update the number of donors and the text controller
                                                                    _category3SetLimitOutTimeController
                                                                            .text ==
                                                                        value; // Manually update the controller text
                                                                  });
                                                                },
                                                                validator:
                                                                    (value) {
                                                                  if (_category3SetLimitOutTimeController
                                                                          .text ==
                                                                      "") {
                                                                    return 'Please enter a valid sit out time limit';
                                                                  }
                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: List.generate(
                                                    60, // Adjust the number of dashes
                                                    (index) => Container(
                                                      width:
                                                          4, // Width of each dash
                                                      height:
                                                          2, // Height of each dash (thickness)
                                                      color: Colors
                                                          .black, // Color of the dash
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              // Left-aligned title
                                              Row(
                                                children: [
                                                  Text(
                                                    "Drug Test Specifications",
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 0.0,
                                              top: 15.0,
                                              right: 0.0,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: const Text(
                                                    "Primary Drug Test",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 40,
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
                                                        key:
                                                            _primaryTestSpecificationsKey,
                                                        controller:
                                                            _primaryDrugTestController,
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
                                                            // Update the number of donors and the text controller
                                                            _primaryDrugTestController
                                                                    .text =
                                                                value; // Manually update the controller text
                                                            _primaryTestSpecificationsKey
                                                                .currentState!
                                                                .validate();
                                                          });
                                                        },
                                                        validator: (value) {
                                                          if (_primaryDrugTestController
                                                                  .text ==
                                                              "") {
                                                            return 'Please enter the primary drug test name';
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
                                            height: 15,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 0.0,
                                              top: 15.0,
                                              right: 0.0,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: const Text(
                                                    "Select Preferred Device",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 40,
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
                                                        key:
                                                            _selectPreferedPrimaryDeviceKey,
                                                        controller:
                                                            _primaryDrugTestPreferredDeviceController,
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
                                                            // Update the number of donors and the text controller
                                                            _primaryDrugTestPreferredDeviceController
                                                                    .text =
                                                                value; // Manually update the controller text
                                                            _selectPreferedPrimaryDeviceKey
                                                                .currentState!
                                                                .validate();
                                                          });
                                                        },
                                                        validator: (value) {
                                                          if (_primaryDrugTestPreferredDeviceController
                                                                  .text ==
                                                              "") {
                                                            return 'Please enter the prefered Device name';
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
                                            height: 25,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              60, // Adjust the number of dashes
                                              (index) => Container(
                                                width: 4, // Width of each dash
                                                height:
                                                    2, // Height of each dash (thickness)
                                                color: Colors
                                                    .black, // Color of the dash
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 0.0,
                                              top: 15.0,
                                              right: 0.0,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: const Text(
                                                    "Secondary Drug Test",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 40,
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
                                                        key:
                                                            _secondaryDrugTestKey,
                                                        controller:
                                                            _secondaryDrugTestController,
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
                                                            // Update the number of donors and the text controller
                                                            _secondaryDrugTestController
                                                                    .text =
                                                                value; // Manually update the controller text
                                                            _secondaryDrugTestKey
                                                                .currentState!
                                                                .validate();
                                                          });
                                                        },
                                                        validator: (value) {
                                                          if (_secondaryDrugTestController
                                                                  .text ==
                                                              "") {
                                                            return 'Please enter a valid drug test name';
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
                                            height: 15,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 0.0,
                                              top: 15.0,
                                              right: 0.0,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: const Text(
                                                    "Select Preferred Device",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 40,
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
                                                        key:
                                                            _selectPreferedSecondaryDeviceKey,
                                                        controller:
                                                            _secondaryDrugTestPreferredDeviceController,
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
                                                            // Update the number of donors and the text controller
                                                            _secondaryDrugTestPreferredDeviceController
                                                                    .text =
                                                                value; // Manually update the controller text
                                                            _selectPreferedSecondaryDeviceKey
                                                                .currentState!
                                                                .validate();
                                                          });
                                                        },
                                                        validator: (value) {
                                                          if (_secondaryDrugTestPreferredDeviceController
                                                                  .text ==
                                                              "") {
                                                            return 'Please enter a valid device name';
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
                                            height: 25,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              60, // Adjust the number of dashes
                                              (index) => Container(
                                                width: 4, // Width of each dash
                                                height:
                                                    2, // Height of each dash (thickness)
                                                color: Colors
                                                    .black, // Color of the dash
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 0.0,
                                              top: 15.0,
                                              right: 0.0,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: const Text(
                                                    "Teritory Drug Test",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 40,
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
                                                        key:
                                                            _thirtoryDrugTestKey,
                                                        controller:
                                                            _siteController,
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
                                                            // Update the number of donors and the text controller
                                                            _thirteryDrugTestController
                                                                    .text =
                                                                value; // Manually update the controller text
                                                            _thirtoryDrugTestKey
                                                                .currentState!
                                                                .validate();
                                                          });
                                                        },
                                                        validator: (value) {
                                                          if (_thirteryDrugTestController
                                                                  .text ==
                                                              "") {
                                                            return 'Please enter a valid drug test name';
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
                                            height: 15,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 0.0,
                                              top: 15.0,
                                              right: 0.0,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: const Text(
                                                    "Select Preferred Device",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 40,
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
                                                        key:
                                                            _selectPreferedThirtoryDeviceKey,
                                                        controller:
                                                            _thirteryDrugTestPreferredDeviceController,
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
                                                            // Update the number of donors and the text controller
                                                            _thirteryDrugTestPreferredDeviceController
                                                                    .text =
                                                                value; // Manually update the controller text
                                                            _selectPreferedThirtoryDeviceKey
                                                                .currentState!
                                                                .validate();
                                                          });
                                                        },
                                                        validator: (value) {
                                                          if (_thirteryDrugTestPreferredDeviceController
                                                                  .text ==
                                                              "") {
                                                            return 'Please enter a valid preferred device';
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
                                            height: 25,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              60, // Adjust the number of dashes
                                              (index) => Container(
                                                width: 4, // Width of each dash
                                                height:
                                                    2, // Height of each dash (thickness)
                                                color: Colors
                                                    .black, // Color of the dash
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : _testsType == TestsType.DrugOnly
                                      ? Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  // Left-aligned title
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Drug Test Specifications",
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 0.0,
                                                  top: 15.0,
                                                  right: 0.0,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: const Text(
                                                        "Primary Drug Test",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 40,
                                                        child: Material(
                                                          elevation:
                                                              4, // Adjust this value for more or less elevation
                                                          shadowColor: Colors
                                                              .black
                                                              .withOpacity(
                                                                  0.5), // Optional: Adjust shadow color
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4), // Match with TextFormField's border radius
                                                          child: TextFormField(
                                                            key:
                                                                _primaryTestSpecificationsKey,
                                                            controller:
                                                                _primaryDrugTestController,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text, // Ensures numeric input
                                                            onChanged: (value) {
                                                              setState(() {
                                                                // Update the number of donors and the text controller
                                                                _primaryDrugTestController
                                                                        .text =
                                                                    value; // Manually update the controller text
                                                                _primaryTestSpecificationsKey
                                                                    .currentState!
                                                                    .validate();
                                                              });
                                                            },
                                                            validator: (value) {
                                                              if (_primaryDrugTestController
                                                                      .text ==
                                                                  "") {
                                                                return 'Please enter the primary drug test name';
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
                                                height: 15,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 0.0,
                                                  top: 15.0,
                                                  right: 0.0,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: const Text(
                                                        "Select Preferred Device",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 40,
                                                        child: Material(
                                                          elevation:
                                                              4, // Adjust this value for more or less elevation
                                                          shadowColor: Colors
                                                              .black
                                                              .withOpacity(
                                                                  0.5), // Optional: Adjust shadow color
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4), // Match with TextFormField's border radius
                                                          child: TextFormField(
                                                            key:
                                                                _selectPreferedPrimaryDeviceKey,
                                                            controller:
                                                                _primaryDrugTestPreferredDeviceController,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text, // Ensures numeric input
                                                            onChanged: (value) {
                                                              setState(() {
                                                                // Update the number of donors and the text controller
                                                                _primaryDrugTestPreferredDeviceController
                                                                        .text =
                                                                    value; // Manually update the controller text
                                                                _selectPreferedPrimaryDeviceKey
                                                                    .currentState!
                                                                    .validate();
                                                              });
                                                            },
                                                            validator: (value) {
                                                              if (_primaryDrugTestPreferredDeviceController
                                                                      .text ==
                                                                  "") {
                                                                return 'Please enter the prefered Device name';
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
                                                height: 25,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: List.generate(
                                                  60, // Adjust the number of dashes
                                                  (index) => Container(
                                                    width:
                                                        4, // Width of each dash
                                                    height:
                                                        2, // Height of each dash (thickness)
                                                    color: Colors
                                                        .black, // Color of the dash
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 0.0,
                                                  top: 15.0,
                                                  right: 0.0,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: const Text(
                                                        "Secondary Drug Test",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 40,
                                                        child: Material(
                                                          elevation:
                                                              4, // Adjust this value for more or less elevation
                                                          shadowColor: Colors
                                                              .black
                                                              .withOpacity(
                                                                  0.5), // Optional: Adjust shadow color
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4), // Match with TextFormField's border radius
                                                          child: TextFormField(
                                                            key:
                                                                _secondaryDrugTestKey,
                                                            controller:
                                                                _secondaryDrugTestController,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text, // Ensures numeric input
                                                            onChanged: (value) {
                                                              setState(() {
                                                                // Update the number of donors and the text controller
                                                                _secondaryDrugTestController
                                                                        .text =
                                                                    value; // Manually update the controller text
                                                                _secondaryDrugTestKey
                                                                    .currentState!
                                                                    .validate();
                                                              });
                                                            },
                                                            validator: (value) {
                                                              if (_secondaryDrugTestController
                                                                      .text ==
                                                                  "") {
                                                                return 'Please enter a valid drug test name';
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
                                                height: 15,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 0.0,
                                                  top: 15.0,
                                                  right: 0.0,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: const Text(
                                                        "Select Preferred Device",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 40,
                                                        child: Material(
                                                          elevation:
                                                              4, // Adjust this value for more or less elevation
                                                          shadowColor: Colors
                                                              .black
                                                              .withOpacity(
                                                                  0.5), // Optional: Adjust shadow color
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4), // Match with TextFormField's border radius
                                                          child: TextFormField(
                                                            key:
                                                                _selectPreferedSecondaryDeviceKey,
                                                            controller:
                                                                _secondaryDrugTestPreferredDeviceController,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text, // Ensures numeric input
                                                            onChanged: (value) {
                                                              setState(() {
                                                                // Update the number of donors and the text controller
                                                                _secondaryDrugTestPreferredDeviceController
                                                                        .text =
                                                                    value; // Manually update the controller text
                                                                _selectPreferedSecondaryDeviceKey
                                                                    .currentState!
                                                                    .validate();
                                                              });
                                                            },
                                                            validator: (value) {
                                                              if (_secondaryDrugTestPreferredDeviceController
                                                                      .text ==
                                                                  "") {
                                                                return 'Please enter a valid device name';
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
                                                height: 25,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: List.generate(
                                                  60, // Adjust the number of dashes
                                                  (index) => Container(
                                                    width:
                                                        4, // Width of each dash
                                                    height:
                                                        2, // Height of each dash (thickness)
                                                    color: Colors
                                                        .black, // Color of the dash
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 0.0,
                                                  top: 15.0,
                                                  right: 0.0,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: const Text(
                                                        "Teritory Drug Test",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 40,
                                                        child: Material(
                                                          elevation:
                                                              4, // Adjust this value for more or less elevation
                                                          shadowColor: Colors
                                                              .black
                                                              .withOpacity(
                                                                  0.5), // Optional: Adjust shadow color
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4), // Match with TextFormField's border radius
                                                          child: TextFormField(
                                                            key:
                                                                _thirtoryDrugTestKey,
                                                            controller:
                                                                _siteController,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text, // Ensures numeric input
                                                            onChanged: (value) {
                                                              setState(() {
                                                                // Update the number of donors and the text controller
                                                                _thirteryDrugTestController
                                                                        .text =
                                                                    value; // Manually update the controller text
                                                                _thirtoryDrugTestKey
                                                                    .currentState!
                                                                    .validate();
                                                              });
                                                            },
                                                            validator: (value) {
                                                              if (_thirteryDrugTestController
                                                                      .text ==
                                                                  "") {
                                                                return 'Please enter a valid drug test name';
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
                                                height: 15,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 0.0,
                                                  top: 15.0,
                                                  right: 0.0,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: const Text(
                                                        "Select Preferred Device",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 40,
                                                        child: Material(
                                                          elevation:
                                                              4, // Adjust this value for more or less elevation
                                                          shadowColor: Colors
                                                              .black
                                                              .withOpacity(
                                                                  0.5), // Optional: Adjust shadow color
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4), // Match with TextFormField's border radius
                                                          child: TextFormField(
                                                            key:
                                                                _selectPreferedThirtoryDeviceKey,
                                                            controller:
                                                                _thirteryDrugTestPreferredDeviceController,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .white,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                  color: Colors
                                                                      .red,
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
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text, // Ensures numeric input
                                                            onChanged: (value) {
                                                              setState(() {
                                                                // Update the number of donors and the text controller
                                                                _thirteryDrugTestPreferredDeviceController
                                                                        .text =
                                                                    value; // Manually update the controller text
                                                                _selectPreferedThirtoryDeviceKey
                                                                    .currentState!
                                                                    .validate();
                                                              });
                                                            },
                                                            validator: (value) {
                                                              if (_thirteryDrugTestPreferredDeviceController
                                                                      .text ==
                                                                  "") {
                                                                return 'Please enter a valid preferred device';
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
                                                height: 25,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: List.generate(
                                                  60, // Adjust the number of dashes
                                                  (index) => Container(
                                                    width:
                                                        4, // Width of each dash
                                                    height:
                                                        2, // Height of each dash (thickness)
                                                    color: Colors
                                                        .black, // Color of the dash
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container()
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
              left: 26.0,
              right: 26.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
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
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ]);
      case 1:
        return Column(children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 1250,
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
                                  "Additional Tests (s)",
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
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              height: 88,
                              width: double.infinity,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                child: TextFormField(
                                  key: _additionalTestsKey,
                                  controller: _additionalTestsController,
                                  maxLines:
                                      null, // Makes the text field expandable
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    hintText: 'Test (s)',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide
                                          .none, // Removes border outline
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    setState(() {
                                      _additionalTestsController.text = value;
                                      _additionalTestsKey.currentState
                                          ?.validate();
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter any test instructions';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              height: 88,
                              width: double.infinity,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                child: TextFormField(
                                  key: _additioanlTestInstructionsKey,
                                  controller:
                                      _additioanlTestInstructionsController,
                                  maxLines:
                                      null, // Makes the text field expandable
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    hintText: 'Additional Test Instructions',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide
                                          .none, // Removes border outline
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    setState(() {
                                      _additioanlTestInstructionsController
                                          .text = value;
                                      _additioanlTestInstructionsKey
                                          .currentState
                                          ?.validate();
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter any additional test instructions';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left-aligned title
                              Row(
                                children: [
                                  Text(
                                    "Donor Selection Process",
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
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              height: 88,
                              width: double.infinity,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                child: TextFormField(
                                  key: _donorSelectionProcessKey,
                                  controller: _donorSelectionProcessController,
                                  maxLines:
                                      null, // Makes the text field expandable
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide
                                          .none, // Removes border outline
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    setState(() {
                                      _donorSelectionProcessController.text =
                                          value;
                                      _donorSelectionProcessKey.currentState
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
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left-aligned title
                              Row(
                                children: [
                                  Text(
                                    "Screening and Testing Process",
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
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              height: 88,
                              width: double.infinity,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                child: TextFormField(
                                  key: _screeningAndTestingProcessKey,
                                  controller:
                                      _screeningAndTestingProcessController,
                                  maxLines:
                                      null, // Makes the text field expandable
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide
                                          .none, // Removes border outline
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    setState(() {
                                      _screeningAndTestingProcessController
                                          .text = value;
                                      _screeningAndTestingProcessKey
                                          .currentState
                                          ?.validate();
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter any screening and testing process';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left-aligned title
                              Row(
                                children: [
                                  Text(
                                    "Test Confirmation Instructions",
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
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              height: 88,
                              width: double.infinity,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                child: TextFormField(
                                  key: _testConfirmationInstructionsKey,
                                  controller:
                                      _testConfirmationInstructionsController,
                                  maxLines:
                                      null, // Makes the text field expandable
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide
                                          .none, // Removes border outline
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    setState(() {
                                      _testConfirmationInstructionsController
                                          .text = value;
                                      _testConfirmationInstructionsKey
                                          .currentState
                                          ?.validate();
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter any test confirmation instructions';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left-aligned title
                              Row(
                                children: [
                                  Text(
                                    "Global Site Access Instructions",
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
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              height: 88,
                              width: double.infinity,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                child: TextFormField(
                                  key: _globalSiteAccessInstructionsKey,
                                  controller:
                                      _globalSiteAccessInstructionsController,
                                  maxLines:
                                      null, // Makes the text field expandable
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide
                                          .none, // Removes border outline
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    setState(() {
                                      _globalSiteAccessInstructionsController
                                          .text = value;
                                      _globalSiteAccessInstructionsKey
                                          .currentState
                                          ?.validate();
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter any global site access instructions';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left-aligned title
                              Row(
                                children: [
                                  Text(
                                    "Specific Local Site Access Instructions",
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
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              height: 88,
                              width: double.infinity,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                child: TextFormField(
                                  key: _specificLocalSiteAccessInstructionsKey,
                                  controller:
                                      _specificLocalSiteAccessInstructionsController,
                                  maxLines:
                                      null, // Makes the text field expandable
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide
                                          .none, // Removes border outline
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    setState(() {
                                      _specificLocalSiteAccessInstructionsController
                                          .text = value;
                                      _specificLocalSiteAccessInstructionsKey
                                          .currentState
                                          ?.validate();
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter specific local site access instructions';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left-aligned title
                              Row(
                                children: [
                                  Text(
                                    "Special Instructions",
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
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Container(
                              height: 88,
                              width: double.infinity,
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                child: TextFormField(
                                  key: _specialInstructionsKey,
                                  controller: _specialInstructionsController,
                                  maxLines:
                                      null, // Makes the text field expandable
                                  minLines: 5,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide
                                          .none, // Removes border outline
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 12,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    setState(() {
                                      _specialInstructionsController.text =
                                          value;
                                      _specialInstructionsKey.currentState
                                          ?.validate();
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter any special instructions';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 1.0,
                              right: 1.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: _prevStep,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(
                                        0xFF01B4D2), // Color for the Back button
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    minimumSize: Size(80,
                                        30), // Sets a minimum width and height
                                  ),
                                  child: const Text(
                                    "Back",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: _nextStep,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors
                                        .blue, // Color for the Next button
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    minimumSize: Size(80, 30),
                                  ),
                                  child: const Text(
                                    "Next",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ]),
                      ]),
                ),
              ),
            ),
          )
        ]);
      case 2:
        return Column(children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 430,
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
                                  "Authorized Representative",
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
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              top: 15.0,
                              right: 0.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    "Authorized Representative",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Color(0xFF94A3B8),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _authorizedRepresentativeKey,
                                        controller:
                                            _authorizedRepresentativeController,
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
                                            // Update the number of donors and the text controller
                                            _authorizedRepresentativeController
                                                    .text =
                                                value; // Manually update the controller text
                                            _authorizedRepresentativeKey
                                                .currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_authorizedRepresentativeController
                                                  .text ==
                                              "") {
                                            return 'Please enter the authorized representative\'s name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    "Mobile",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Color(0xFF94A3B8),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key:
                                            _authorizedRepresentativeMobileNumberKey,
                                        controller:
                                            _authorizedRepresentativeMobileNumberController,
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
                                            .phone, // Ensures numeric input
                                        onChanged: (value) {
                                          setState(() {
                                            // Update the number of donors and the text controller
                                            _authorizedRepresentativeMobileNumberController
                                                    .text =
                                                value; // Manually update the controller text
                                            _authorizedRepresentativeMobileNumberKey
                                                .currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_authorizedRepresentativeMobileNumberController
                                                  .text ==
                                              "") {
                                            return 'Please enter a valid mobile number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    "Position",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Color(0xFF94A3B8),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
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
                                            // Update the number of donors and the text controller
                                            _positionController.text =
                                                value; // Manually update the controller text
                                            _positionKey.currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_positionController.text == "") {
                                            return 'Please enter the position';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    "Email",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Color(0xFF94A3B8),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    child: Material(
                                      elevation:
                                          4, // Adjust this value for more or less elevation
                                      shadowColor: Colors.black.withOpacity(
                                          0.5), // Optional: Adjust shadow color
                                      borderRadius: BorderRadius.circular(
                                          4), // Match with TextFormField's border radius
                                      child: TextFormField(
                                        key: _authorizedRepresentativeEmailKey,
                                        controller:
                                            _authorizedRepresentativeEmailController,
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
                                            .emailAddress, // Ensures numeric input
                                        onChanged: (value) {
                                          setState(() {
                                            // Update the number of donors and the text controller
                                            _authorizedRepresentativeEmailController
                                                    .text =
                                                value; // Manually update the controller text
                                            _authorizedRepresentativeEmailKey
                                                .currentState!
                                                .validate();
                                          });
                                        },
                                        validator: (value) {
                                          if (_authorizedRepresentativeEmailController
                                                  .text ==
                                              "") {
                                            return 'Please enter a valid authorized representatuve email';
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
                        ]),
                      ]),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 500,
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
                                      child: Text("4"),
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
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 1.0,
                                right: 1.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: _prevStep,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(
                                          0xFF01B4D2), // Color for the Back button
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      minimumSize: Size(80,
                                          30), // Sets a minimum width and height
                                    ),
                                    child: const Text(
                                      "Back",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: _nextStep,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .blue, // Color for the Next button
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      minimumSize: Size(80, 30),
                                    ),
                                    child: const Text(
                                      "Create Job",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          )
        ]);
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

  void _prevStep() {
    if (_currentStep > 0) {
      widget.scrollController.animateTo(
        0, // Scroll to top
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentStep--;
      });
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
                                    "New Onsite Job",
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
                        /* Row(
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
                        ), */
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
