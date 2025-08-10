class ConnectedDeviceModel {
  ConnectedDeviceModel({required this.deviceId, required this.employeeId});

   String? deviceId;
   String? employeeId;

  ConnectedDeviceModel copyWith({String? deviceId, String? employeeId}) {
    return ConnectedDeviceModel(
      deviceId: deviceId ?? this.deviceId,
      employeeId: employeeId ?? this.employeeId,
    );
  }

  factory ConnectedDeviceModel.fromJson(Map<String, dynamic> json) {
    return ConnectedDeviceModel(
      deviceId: json["deviceId"],
      employeeId: json["employeeId"],
    );
  }

  Map<String, dynamic> toJson() => {
    "deviceId": deviceId,
    "employeeId": employeeId,
  };

  @override
  String toString() {
    return "$deviceId, $employeeId, ";
  }
}

/*
{
	"deviceId": "",
	"employeeId": ""
}*/
