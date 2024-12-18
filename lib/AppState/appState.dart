import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _isDrawerOpen = false;

  bool _isHome = true;
  bool _isDashboard = false;
  bool _isDashboardHome = false;
  bool _isTestsProcessed = false;
  bool _isTestSampleResults = false;
  bool _isOnsiteJobs = false;
  bool _isOnsiteApprovals = false;
  bool _isClientManagement = false;
  bool _isAccounting = false;
  bool _isAccountingDashboard = false;
  bool _isTests = false;
  bool _isLicensing = false;
  bool _isITServices = false;
  bool _isInvoices = false;
  bool _isCollectionReports = false;
  bool _isCollectorsCalendar = false;
  bool _isFaq = false;

  bool get isHomeOpen => _isHome;
  bool get isDashboardOpen => _isDashboard;
  bool get isDashboardHomeOpen => _isDashboardHome;
  bool get isTestsProcessedOpen => _isTestsProcessed;
  bool get isTestSampleResultsOpen => _isTestSampleResults;
  bool get isOnsiteJobsOpen => _isOnsiteJobs;
  bool get isOnsiteApprovals => _isOnsiteApprovals;
  bool get isClientManagementOpen => _isClientManagement;
  bool get isAccountingOpen => _isAccounting;
  bool get isAccountingDashboardOpen => _isAccountingDashboard;
  bool get isTestsOpen => _isTests;
  bool get isLicensingOpen => _isLicensing;
  bool get isITServicesOpen => _isITServices;
  bool get isInvoicesOpen => _isInvoices;
  bool get isCollectionReportsOpen => _isCollectionReports;
  bool get isCollectorsCalendarOpen => _isCollectorsCalendar;
  bool get isFaqOpen => _isFaq;

  bool get isDrawerOpen => _isDrawerOpen;

  void setDrawerState(bool isOpen) {
    _isDrawerOpen = isOpen;
    notifyListeners(); // Notify all listeners about the state change
  }

  void setHome(bool isSet) {
    _isHome = isSet;
    notifyListeners();
  }

  void setDashboard(bool isSet) {
    _isDashboard = isSet;
    notifyListeners();
  }

  void setDashboardHome(bool isSet) {
    _isDashboardHome = isSet;
    notifyListeners();
  }

  void setTestsProcessed(bool isSet) {
    _isTestsProcessed = isSet;
    notifyListeners();
  }

  void setTestSampleResults(bool isSet) {
    _isTestSampleResults = isSet;
    notifyListeners();
  }

  void setOnsiteJobs(bool isSet) {
    _isOnsiteJobs = isSet;
    notifyListeners();
  }

  void setOnsiteApprovals(bool isSet) {
    _isOnsiteApprovals = isSet;
    notifyListeners();
  }

  void setClientManagement(bool isSet) {
    _isClientManagement = isSet;
    notifyListeners();
  }

  void setAccounting(bool isSet) {
    _isAccounting = isSet;
    notifyListeners();
  }

  void setAccountingDashboard(bool isSet) {
    _isAccountingDashboard = isSet;
    notifyListeners();
  }

  void setTests(bool isSet) {
    _isTests = isSet;
    notifyListeners();
  }

  void setLicensing(bool isSet) {
    _isLicensing = isSet;
    notifyListeners();
  }

  void setITServices(bool isSet) {
    _isITServices = isSet;
    notifyListeners();
  }

  void setInvoices(bool isSet) {
    _isInvoices = isSet;
    notifyListeners();
  }

  void setCollectionReports(bool isSet) {
    _isCollectionReports = isSet;
    notifyListeners();
  }

  void setCollectorsCalendar(bool isSet) {
    _isCollectorsCalendar = isSet;
    notifyListeners();
  }

  void setFAQ(bool isSet) {
    _isFaq = isSet;
    notifyListeners();
  }
}
