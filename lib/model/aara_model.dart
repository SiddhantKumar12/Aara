// To parse this JSON data, do
//
//     final aaraModel = aaraModelFromJson(jsonString);

import 'dart:convert';

AaraModel aaraModelFromJson(String str) => AaraModel.fromJson(json.decode(str));

String aaraModelToJson(AaraModel data) => json.encode(data.toJson());

class AaraModel {
  AaraModel({
    required this.count,
    required this.msg,
    // required this.data,
    required this.teamMood,
    required this.moodalytics,
    required this.responseCode,
  });

  int count;
  String msg;
  // Data data;
  int teamMood;
  List<Data> moodalytics;
  int responseCode;

  factory AaraModel.fromJson(Map<String, dynamic> json) => AaraModel(
        count: json["count"],
        msg: json["msg"],
        // data: Data.fromJson(json["data"]),
        teamMood: json["team_mood"],
        moodalytics:
            List<Data>.from(json["moodalytics"].map((x) => Data.fromJson(x))),
        responseCode: json["response_code"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "msg": msg,
        // "data": data.toJson(),
        "team_mood": teamMood,
        "moodalytics": List<dynamic>.from(moodalytics.map((x) => x.toJson())),
        "response_code": responseCode,
      };
}

class Data {
  Data({
    required this.id,
    this.createdAt,
    required this.updatedAt,
    required this.managerId,
    required this.description,
    required this.emojiPoint,
    required this.userProfile,
    this.reasonType,
    required this.userProfileId,
    required this.reasonTypeId,
  });

  int id;
  dynamic createdAt;
  DateTime updatedAt;
  int managerId;
  String description;
  int emojiPoint;
  int userProfile;
  dynamic reasonType;
  int userProfileId;
  int reasonTypeId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] ?? 0,
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        managerId: json["manager_id"],
        description: json["description"],
        emojiPoint: json["emoji_point"],
        userProfile: json["user_profile"] == null ? 0 : json["user_profile"],
        reasonType: json["reason_type"],
        userProfileId:
            json["user_profile_id"] == null ? 0 : json["user_profile_id"],
        reasonTypeId:
            json["reason_type_id"] == null ? 0 : json["reason_type_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
        "manager_id": managerId,
        "description": description,
        "emoji_point": emojiPoint,
        "user_profile": userProfile == null ? null : userProfile,
        "reason_type": reasonType,
        "user_profile_id": userProfileId == null ? null : userProfileId,
        "reason_type_id": reasonTypeId == null ? null : reasonTypeId,
      };
}
