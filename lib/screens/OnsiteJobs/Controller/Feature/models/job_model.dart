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
        jobNumber: json["jobNumber"],
        jobStatus: json["jobStatus"],
        dateTime: json["dateTime"],
        location: json["location"],
        client: json["client"],
        rep: json["rep"],
        service: json["service"],
        callout: json["callout"],
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
        collectorName: json["collectorName"],
        collectorStatus: json["collectorStatus"],
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
        selectedServiceOffice: json["selectedServiceOffice"] != null
            ? json["selectedServiceOffice"]
            : null,
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
        selectedClient:
            json["selectedClient"] != null ? json["selectedClient"] : null,
        selectedSite:
            json["selectedSite"] != null ? json["selectedSite"] : null,
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
        clientName: json["clientName"],
        clientReference: json["clientReference"],
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
        jobType: json["jobType"],
        jobDate: json["jobDate"],
        startTime: json["startTime"],
        duration: json["duration"],
        noOfDonors: json["noOfDonors"],
        jobReference: json["jobReference"],
        typeOfService: json["typeOfService"],
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
        siteContactName: json["siteContactName"],
        siteContactMobile: json["siteContactMobile"],
      );

  Map<String, dynamic> toJson() => {
        "siteContactName": siteContactName,
        "siteContactMobile": siteContactMobile,
      };
}

class TestsAndDevicesModel {
  String? testType;

  TestsAndDevicesModel({this.testType});

  factory TestsAndDevicesModel.fromJson(Map<String, dynamic> json) =>
      TestsAndDevicesModel(
        testType: json["testType"],
      );

  Map<String, dynamic> toJson() => {
        "testType": testType,
      };
}
