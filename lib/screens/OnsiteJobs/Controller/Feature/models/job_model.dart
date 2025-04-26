import 'dart:convert';

class JobModel {
  String? jobNumber;
  String? jobStatus;
  String? dateTime;
  String? client;
  String? rep;
  String? location;
  String? service;
  String? callout;
  List<CollectorModel>? collectors;
  BookingModel? bookingInfo;

  JobModel({
    this.jobNumber,
    this.jobStatus,
    this.dateTime,
    this.client,
    this.rep,
    this.location,
    this.service,
    this.callout,
    this.collectors,
    this.bookingInfo,
  });

  factory JobModel.fromRawJson(String str) =>
      JobModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        jobNumber: json["jobNumber"] ?? null,
        jobStatus: json["jobStatus"] ?? null,
        dateTime: json["dateTime"] ?? null,
        location: json["location"] ?? null,
        client: json["client"] ?? null,
        rep: json["rep"] ?? null,
        service: json["service"] ?? null,
        callout: json["callout"] ?? null,
        collectors: json["collectors"] != null
            ? List<CollectorModel>.from(
                json["collectors"].map((x) => CollectorModel.fromJson(x)))
            : null,
        bookingInfo: json["bookingInfo"] != null
            ? BookingModel.fromJson(json["bookingInfo"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "jobNumber": jobNumber,
        "jobStatus": jobStatus,
        "dateTime": dateTime,
        "location": location,
        "client": client,
        "rep": rep,
        "service": service,
        "callout": callout,
        "collectors": collectors?.map((x) => x.toJson()).toList(),
        "bookingInfo": bookingInfo?.toJson(),
      };
}

class CollectorModel {
  String? collectorName;
  String? collectorStatus;

  CollectorModel({this.collectorName, this.collectorStatus});

  factory CollectorModel.fromJson(Map<String, dynamic> json) => CollectorModel(
        collectorName: json["collectorName"] ?? null,
        collectorStatus: json["collectorStatus"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "collectorName": collectorName,
        "collectorStatus": collectorStatus,
      };
}

class BookingModel {
  OrganizationModel? organizatioInfo;
  JobDetailsModel? jobDetails;
  ClientModel? clientInfo;

  BookingModel({this.organizatioInfo, this.clientInfo, this.jobDetails});

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        organizatioInfo: json["organisationInfo"] != null
            ? OrganizationModel.fromJson(json["organisationInfo"])
            : null,
        jobDetails: json["jobDetails"] != null
            ? JobDetailsModel.fromJson(json["jobDetails"])
            : null,
        clientInfo: json["clientInfo"] != null
            ? ClientModel.fromJson(json["clientInfo"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "organisationInfo": organizatioInfo?.toJson(),
        "jobDetails": jobDetails?.toJson(),
        "clientInfo": clientInfo?.toJson(),
      };
}

class OrganizationModel {
  String? collectionOrganization;
  String? selectedServiceOffice;
  List<String>? serviceOffice;

  OrganizationModel(
      {this.collectionOrganization,
      this.selectedServiceOffice,
      this.serviceOffice});

  factory OrganizationModel.fromJson(Map<String, dynamic> json) =>
      OrganizationModel(
        collectionOrganization: json["collectionOrganisation"],
        selectedServiceOffice: json["selectedServiceOffice"] ?? null,
        serviceOffice: json["serviceOffice"] != null
            ? List<String>.from(json["serviceOffice"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "collectionOrganization": collectionOrganization,
        "selectedServiceOffice": selectedServiceOffice,
        "serviceOffice": serviceOffice,
      };
}

class ClientModel {
  String? selectedClient;
  String? selectedSite;
  List<ClientDetailsModel>? clientDetails;
  List<SiteInfoModel>? locationDetails;

  ClientModel(
      {this.selectedClient,
      this.selectedSite,
      this.clientDetails,
      this.locationDetails});

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        selectedClient: json["selectedClient"] ?? null,
        selectedSite: json["selectedSite"] ?? null,
        clientDetails: json["clientDetails"] != null
            ? List<ClientDetailsModel>.from(json["clientDetails"]
                .map((x) => ClientDetailsModel.fromJson(x)))
            : null,
        locationDetails: json["locationDetails"] != null
            ? List<SiteInfoModel>.from(
                json["locationDetails"].map((x) => SiteInfoModel.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "selectedClient": selectedClient,
        "selectedSite": selectedSite,
        "clientDetails": clientDetails?.map((x) => x.toJson()).toList(),
        "locationDetails": locationDetails?.map((x) => x.toJson()).toList(),
      };
}

class ClientDetailsModel {
  String? clientName;
  String? clientReference;

  ClientDetailsModel({this.clientName, this.clientReference});

  factory ClientDetailsModel.fromJson(Map<String, dynamic> json) =>
      ClientDetailsModel(
        clientName: json["clientName"] ?? null,
        clientReference: json["clientReference"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "clientName": clientName,
        "clientReference": clientReference,
      };
}

class JobDetailsModel {
  String? jobType;
  String? jobDate;
  String? startTime;
  String? duration;
  String? noOfDonors;
  String? jobReference;
  String? typeOfService;

  JobDetailsModel({
    this.jobType,
    this.jobDate,
    this.startTime,
    this.duration,
    this.noOfDonors,
    this.jobReference,
    this.typeOfService,
  });

  factory JobDetailsModel.fromJson(Map<String, dynamic> json) =>
      JobDetailsModel(
        jobType: json["jobType"] ?? null,
        jobDate: json["jobDate"] ?? null,
        startTime: json["startTime"] ?? null,
        duration: json["duration"] ?? null,
        noOfDonors: json["noOfDonors"] ?? null,
        jobReference: json["jobReference"] ?? null,
        typeOfService: json["typeOfService"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "jobType": jobType,
        "jobDate": jobDate,
        "startTime": startTime,
        "duration": duration,
        "noOfDonors": noOfDonors,
        "jobReference": jobReference,
        "typeOfService": typeOfService,
      };
}

class SiteInfoModel {
  String? siteName;
  List<SiteContactsModel>? siteContacts;
  TestsAndDevicesModel? testsAndDevices;

  SiteInfoModel({this.siteName, this.siteContacts, this.testsAndDevices});

  factory SiteInfoModel.fromJson(Map<String, dynamic> json) => SiteInfoModel(
        siteName: json["siteName"],
        siteContacts: json["siteContacts"] != null
            ? List<SiteContactsModel>.from(
                json["siteContacts"].map(
                  (x) => SiteContactsModel.fromJson(x),
                ),
              )
            : null,
        testsAndDevices: json["testsAndDevices"] != null
            ? TestsAndDevicesModel.fromJson(json["testsAndDevices"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "siteName": siteName,
        "siteContacts": siteContacts?.map((x) => x.toJson()).toList(),
        "testsAndDevices": testsAndDevices?.toJson(),
      };
}

class SiteContactsModel {
  String? siteContactName;
  String? siteContactMobile;

  SiteContactsModel({this.siteContactName, this.siteContactMobile});

  factory SiteContactsModel.fromJson(Map<String, dynamic> json) =>
      SiteContactsModel(
        siteContactName: json["siteContactName"] ?? null,
        siteContactMobile: json["siteContactMobile"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "siteContactName": siteContactName,
        "siteContactMobile": siteContactMobile,
      };
}

class TestsAndDevicesModel {
  String? testType;
  DrugTestSpecificationsModel? drugTestSpecifications;

  TestsAndDevicesModel({this.testType, this.drugTestSpecifications});

  factory TestsAndDevicesModel.fromJson(Map<String, dynamic> json) =>
      TestsAndDevicesModel(
        testType: json["testType"] ?? null,
        drugTestSpecifications: json["drugTestSpecifications"] != null
            ? DrugTestSpecificationsModel.fromJson(
                json["drugTestSpecifications"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "testType": testType,
        "drugTestSpecifications": drugTestSpecifications?.toJson(),
      };
}

class DrugTestSpecificationsModel {
  PrimaryDrugTestModel? primaryDrugTest;
  SecondaryDrugTestModel? secondaryDrugTest;
  TeritoryDrugTestModel? teritoryDrugTest;
  AdditionalInfoModel? additionalInfo;
  AuthorizedRepresentativeModel? authorizedRepresentative;

  DrugTestSpecificationsModel({
    this.primaryDrugTest,
    this.secondaryDrugTest,
    this.teritoryDrugTest,
    this.additionalInfo,
    this.authorizedRepresentative,
  });

  factory DrugTestSpecificationsModel.fromJson(Map<String, dynamic> json) =>
      DrugTestSpecificationsModel(
        primaryDrugTest: json["primaryDrugTest"] != null
            ? PrimaryDrugTestModel.fromJson(json["primaryDrugTest"])
            : null,
        secondaryDrugTest: json["secondaryDrugTest"] != null
            ? SecondaryDrugTestModel.fromJson(json["secondaryDrugTest"])
            : null,
        teritoryDrugTest: json["teritoryDrugTest"] != null
            ? TeritoryDrugTestModel.fromJson(json["teritoryDrugTest"])
            : null,
        additionalInfo: json["additionalInfo"] != null
            ? AdditionalInfoModel.fromJson(json["additionalInfo"])
            : null,
        authorizedRepresentative: json["authorizedRepresentativeInfo"] != null
            ? AuthorizedRepresentativeModel.fromJson(
                json["authorizedRepresentativeInfo"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "primaryDrugTest": primaryDrugTest?.toJson(),
        "secondaryDrugTest": secondaryDrugTest?.toJson(),
        "teritoryDrugTest": teritoryDrugTest?.toJson(),
        "additionalInfo": additionalInfo?.toJson(),
        "authorizedRepresentativeInfo": authorizedRepresentative?.toJson(),
      };
}

class PrimaryDrugTestModel {
  String? drugTestName;
  String? selectPreferedDevice;

  PrimaryDrugTestModel({this.drugTestName, this.selectPreferedDevice});

  factory PrimaryDrugTestModel.fromJson(Map<String, dynamic> json) =>
      PrimaryDrugTestModel(
        drugTestName: json["drugTestName"] ?? null,
        selectPreferedDevice: json["selectPreferedDevice"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "drugTestName": drugTestName,
        "selectPreferedDevice": selectPreferedDevice,
      };
}

class SecondaryDrugTestModel {
  String? drugTestName;
  String? selectPreferedDevice;

  SecondaryDrugTestModel({this.drugTestName, this.selectPreferedDevice});

  factory SecondaryDrugTestModel.fromJson(Map<String, dynamic> json) =>
      SecondaryDrugTestModel(
        drugTestName: json["drugTestName"] ?? null,
        selectPreferedDevice: json["selectPreferedDevice"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "drugTestName": drugTestName,
        "selectPreferedDevice": selectPreferedDevice,
      };
}

class TeritoryDrugTestModel {
  String? drugTestName;
  String? selectPreferedDevice;

  TeritoryDrugTestModel({this.drugTestName, this.selectPreferedDevice});

  factory TeritoryDrugTestModel.fromJson(Map<String, dynamic> json) =>
      TeritoryDrugTestModel(
        drugTestName: json["drugTestName"] ?? null,
        selectPreferedDevice: json["selectPreferedDevice"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "drugTestName": drugTestName,
        "selectPreferedDevice": selectPreferedDevice,
      };
}

class AdditionalInfoModel {
  String? additionalTests;
  String? additionalTestInstructions;
  String? donorSelectionProcess;
  String? screeningAndTestingProcess;
  String? testConfirmationInstructions;
  String? globalSiteAccessInstructions;
  String? specificLocalSiteAccessInstructions;
  String? specificInstructions;

  AdditionalInfoModel({
    this.additionalTests,
    this.additionalTestInstructions,
    this.donorSelectionProcess,
    this.screeningAndTestingProcess,
    this.testConfirmationInstructions,
    this.globalSiteAccessInstructions,
    this.specificLocalSiteAccessInstructions,
    this.specificInstructions,
  });

  factory AdditionalInfoModel.fromJson(Map<String, dynamic> json) =>
      AdditionalInfoModel(
        additionalTests: json["additionalTests"] ?? null,
        additionalTestInstructions: json["additionalTestInstructions"] ?? null,
        donorSelectionProcess: json["donorSelectionProcess"] ?? null,
        screeningAndTestingProcess: json["screeningAndTestingProcess"] ?? null,
        testConfirmationInstructions:
            json["testConfirmationInstructions"] ?? null,
        globalSiteAccessInstructions:
            json["globalSiteAccessInstructions"] ?? null,
        specificLocalSiteAccessInstructions:
            json["specificLocalSiteAccessInstructions"] ?? null,
        specificInstructions: json["specificInstructions"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "additionalTests": additionalTests,
        "additionalTestInstructions": additionalTestInstructions,
        "donorSelectionProcess": donorSelectionProcess,
        "screeningAndTestingProcess": screeningAndTestingProcess,
        "testConfirmationInstructions": testConfirmationInstructions,
        "globalSiteAccessInstructions": globalSiteAccessInstructions,
        "specificLocalSiteAccessInstructions":
            specificLocalSiteAccessInstructions,
        "specificInstructions": specificInstructions,
      };
}

class AuthorizedRepresentativeModel {
  String? representativeName;
  String? representativeMobile;
  String? representativePosition;
  String? representativeEmail;
  AuthorizedRepresentativeModel(
      {this.representativeName,
      this.representativeMobile,
      this.representativePosition,
      this.representativeEmail});

  factory AuthorizedRepresentativeModel.fromJson(Map<String, dynamic> json) =>
      AuthorizedRepresentativeModel(
        representativeName: json["representativeName"] ?? null,
        representativeMobile: json["representativeMobile"] ?? null,
        representativePosition: json["representativePosition"] ?? null,
        representativeEmail: json["representativeEmail"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "representativeName": representativeName,
        "representativeMobile": representativeMobile,
        "representativePosition": representativePosition,
        "representativeEmail": representativeEmail,
      };
}
