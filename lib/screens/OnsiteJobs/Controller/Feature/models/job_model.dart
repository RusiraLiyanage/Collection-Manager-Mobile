import 'dart:convert';

class JobModel {
  String jobNumber;
  String jobStatus;
  String dateTime;
  String client;
  String rep;
  String location;
  String service;
  String callout;
  List<CollectorModel> collectors;
  BookingModel bookingInfo;

  JobModel({
    required this.jobNumber,
    required this.jobStatus,
    required this.dateTime,
    required this.client,
    required this.rep,
    required this.location,
    required this.service,
    required this.callout,
    required this.collectors,
    required this.bookingInfo,
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
        collectors: List<CollectorModel>.from(
          json["collectors"].map((x) => CollectorModel.fromJson(x)),
        ),
        bookingInfo: BookingModel.fromJson(json["bookingInfo"]),
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
        "collectors": List<dynamic>.from(collectors.map((x) => x.toJson())),
        "bookingInfo": bookingInfo.toJson(),
      };
}

class CollectorModel {
  String collectorName;
  String collectorStatus;

  CollectorModel({
    required this.collectorName,
    required this.collectorStatus,
  });

  factory CollectorModel.fromRawJson(String str) =>
      CollectorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
  OrganizationModel organizatioInfo;
  JobDetailsModel jobDetails;
  ClientModel clientInfo;
  BookingModel({
    required this.organizatioInfo,
    required this.clientInfo,
    required this.jobDetails,
  });

  factory BookingModel.fromRawJson(String str) =>
      BookingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        organizatioInfo: OrganizationModel.fromJson(json["organisationInfo"]),
        jobDetails: JobDetailsModel.fromJson(json["jobDetails"]),
        clientInfo: ClientModel.fromJson(json["clientInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "organisationInfo": organizatioInfo.toJson(),
        "jobDetails": jobDetails.toJson(),
        "clientInfo": clientInfo.toJson(),
      };
}

class OrganizationModel {
  String collectionOrganization;
  List<String> serviceOffice;

  OrganizationModel({
    required this.collectionOrganization,
    required this.serviceOffice,
  });

  factory OrganizationModel.fromRawJson(String str) =>
      OrganizationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrganizationModel.fromJson(Map<String, dynamic> json) =>
      OrganizationModel(
        collectionOrganization: json["collectionOrganisation"],
        serviceOffice: List<String>.from(json["serviceOffice"]),
      );

  Map<String, dynamic> toJson() => {
        "collectionOrganization": collectionOrganization,
        "serviceOffice": serviceOffice,
      };
}

class ClientModel {
  List<ClientDetailsModel> clientDetails;
  List<SiteInfoModel> locationDetails;

  ClientModel({required this.clientDetails, required this.locationDetails});

  factory ClientModel.fromRawJson(String str) =>
      ClientModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        clientDetails: List<ClientDetailsModel>.from(
          json["clientDetails"].map((x) => ClientDetailsModel.fromJson(x)),
        ),
        locationDetails: List<SiteInfoModel>.from(
          json["locationDetails"].map((x) => SiteInfoModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "clientDetails":
            List<dynamic>.from(clientDetails.map((x) => x.toJson())),
        "locationDetails":
            List<dynamic>.from(locationDetails.map((x) => x.toJson())),
      };
}

class ClientDetailsModel {
  String clientName;
  String clientReference;

  ClientDetailsModel({
    required this.clientName,
    required this.clientReference,
  });

  factory ClientDetailsModel.fromRawJson(String str) =>
      ClientDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
  String jobType;
  String jobDate;
  String startTime;
  String duration;
  String noOfDonors;
  String jobReference;
  String typeOfService;

  JobDetailsModel({
    required this.jobType,
    required this.jobDate,
    required this.startTime,
    required this.duration,
    required this.noOfDonors,
    required this.jobReference,
    required this.typeOfService,
  });

  factory JobDetailsModel.fromRawJson(String str) =>
      JobDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

/* class LocationDetailsModel {
  List<SiteInfoModel> locationDetails;

  LocationDetailsModel({
    required this.locationDetails,
  });

  factory LocationDetailsModel.fromRawJson(String str) =>
      LocationDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationDetailsModel.fromJson(Map<String, dynamic> json) =>
      LocationDetailsModel(
        locationDetails: List<SiteInfoModel>.from(
          json["locationDetails"].map((x) => SiteInfoModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "locationDetails":
            List<dynamic>.from(locationDetails.map((x) => x.toJson()))
      };
} */

class SiteInfoModel {
  String siteName;
  List<SiteContactsModel> siteContacts;

  SiteInfoModel({
    required this.siteName,
    required this.siteContacts,
  });

  factory SiteInfoModel.fromRawJson(String str) =>
      SiteInfoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SiteInfoModel.fromJson(Map<String, dynamic> json) => SiteInfoModel(
        siteName: json["siteName"],
        siteContacts: List<SiteContactsModel>.from(
          json["siteContacts"].map((x) => SiteContactsModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "siteName": siteName,
        "siteContacts": List<dynamic>.from(siteContacts.map((x) => x.toJson())),
      };
}

class SiteContactsModel {
  String siteContactName;
  String siteContactMobile;

  SiteContactsModel({
    required this.siteContactName,
    required this.siteContactMobile,
  });

  factory SiteContactsModel.fromRawJson(String str) =>
      SiteContactsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
  String testType;

  TestsAndDevicesModel({
    required this.testType,
  });

  factory TestsAndDevicesModel.fromRawJson(String str) =>
      TestsAndDevicesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TestsAndDevicesModel.fromJson(Map<String, dynamic> json) =>
      TestsAndDevicesModel(
        testType: json["testType"],
      );

  Map<String, dynamic> toJson() => {
        "testType": testType,
      };
}
