import 'package:cloud_firestore/cloud_firestore.dart';

class UserAccountModel {
  UserAccountModel({
    required this.employeeId,
    required this.userName,
    required this.password,
    required this.mobileModle,
    required this.mobileId,
    required this.lastActivity,
  });

   String? employeeId;
   String? userName;
   String? password;
   String? mobileModle;
   String? mobileId;
   Timestamp? lastActivity;

  UserAccountModel copyWith({
    String? employeeId,
    String? userName,
    String? password,
    String? mobileModle,
    String? mobileId,
    Timestamp? lastActivity,
  }) {
    return UserAccountModel(
      employeeId: employeeId ?? this.employeeId,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      mobileModle: mobileModle ?? this.mobileModle,
      mobileId: mobileId ?? this.mobileId,
      lastActivity: lastActivity ?? this.lastActivity,
    );
  }

  factory UserAccountModel.fromJson(Map<String, dynamic> json) {
    return UserAccountModel(
      employeeId: json["employeeID"],
      userName: json["userName"],
      password: json["password"],
      mobileModle: json["mobileModle"],
      mobileId: json["mobileID"],
      lastActivity: json["lastActivity"],
    );
  }

  Map<String, dynamic> toJson() => {
    "employeeID": employeeId,
    "userName": userName,
    "password": password,
    "mobileModle": mobileModle,
    "mobileID": mobileId,
    "lastActivity": lastActivity,
  };

  @override
  String toString() {
    return "$employeeId, $userName, $password, $mobileModle, $mobileId, $lastActivity, ";
  }
}

/*
{
	"employeeID": "",
	"userName": "",
	"password": "",
	"mobileModle": "",
	"mobileID": "",
	"lastActivity": ""
}*/
