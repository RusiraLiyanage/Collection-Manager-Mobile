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

  JobModel({
    required this.jobNumber,
    required this.jobStatus,
    required this.dateTime,
    required this.client,
    required this.rep,
    required this.location,
    required this.service,
    required this.callout,
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
      };
}
