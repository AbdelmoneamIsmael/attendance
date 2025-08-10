import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeInformation {
  EmployeeInformation({
    required this.employeeId,
    required this.name,
    required this.position,
    required this.department,
    required this.email,
    required this.phone,
    required this.hireDate,
    required this.salary,
  });

  final String? employeeId;
  final String? name;
  final String? position;
  final String? department;
  final String? email;
  final String? phone;
  final Timestamp? hireDate;
  final num? salary;

  EmployeeInformation copyWith({
    String? employeeId,
    String? name,
    String? position,
    String? department,
    String? email,
    String? phone,
    Timestamp? hireDate,
    num? salary,
  }) {
    return EmployeeInformation(
      employeeId: employeeId ?? this.employeeId,
      name: name ?? this.name,
      position: position ?? this.position,
      department: department ?? this.department,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      hireDate: hireDate ?? this.hireDate,
      salary: salary ?? this.salary,
    );
  }

  factory EmployeeInformation.fromJson(Map<String, dynamic> json) {
    return EmployeeInformation(
      employeeId: json["employeeId"],
      name: json["name"],
      position: json["position"],
      department: json["department"],
      email: json["email"],
      phone: json["phone"],
      hireDate: json["hireDate"],
      salary: json["salary"],
    );
  }

  Map<String, dynamic> toJson() => {
    "employeeId": employeeId,
    "name": name,
    "position": position,
    "department": department,
    "email": email,
    "phone": phone,
    "hireDate": hireDate,
    "salary": salary,
  };

  @override
  String toString() {
    return "$employeeId, $name, $position, $department, $email, $phone, $hireDate, $salary, ";
  }
}

/*
{
	"employeeId": "EMP001",
	"name": "Ahmed Hassan",
	"position": "Software Engineer",
	"department": "IT",
	"email": "ahmed.hassan@example.com",
	"phone": "+20 1001234567",
	"hireDate": "2021-03-15",
	"salary": 15000
}*/
