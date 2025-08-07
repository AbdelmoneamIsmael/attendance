import 'package:cloud_firestore/cloud_firestore.dart';

class UserAccountModel {
  UserAccountModel({
    required this.userName,
    required this.password,
    required this.mobileModle,
    required this.mobileId,
    required this.lastActivity,
  });

  final String? userName;
  final String? password;
  final String? mobileModle;
  final String? mobileId;
  final Timestamp? lastActivity;

  UserAccountModel copyWith({
    String? userName,
    String? password,
    String? mobileModle,
    String? mobileId,
    Timestamp? lastActivity,
  }) {
    return UserAccountModel(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      mobileModle: mobileModle ?? this.mobileModle,
      mobileId: mobileId ?? this.mobileId,
      lastActivity: lastActivity ?? this.lastActivity,
    );
  }

  factory UserAccountModel.fromJson(Map<String, dynamic> json) {
    return UserAccountModel(
      userName: json["userName"],
      password: json["password"],
      mobileModle: json["mobileModle"],
      mobileId: json["mobileID"],
      lastActivity: json["lastActivity"],
    );
  }

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "password": password,
    "mobileModle": mobileModle,
    "mobileID": mobileId,
    "lastActivity": lastActivity,
  };

  @override
  String toString() {
    return "$userName, $password, $mobileModle, $mobileId, $lastActivity, ";
  }
}

/*
{
	"userName": "",
	"password": "",
	"mobileModle": "",
	"mobileID": "",
	"lastActivity": ""
}*/
