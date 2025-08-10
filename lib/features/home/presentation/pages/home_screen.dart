import 'package:attendance/core/const/app_const.dart';
import 'package:attendance/core/models/account_model/account_model.dart';
import 'package:attendance/core/models/account_model/employee_info.dart';
import 'package:attendance/core/util/networking/firebase_connection.dart';
import 'package:attendance/core/widgets/title_tale.dart';
import 'package:attendance/features/home/presentation/controller/home_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home_screen_title'.tr)),

      body: GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) {},
        builder: (_) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    TitleTale(
                      title: "Name ${controller.employeeInformation.name}",
                    ),
                    TitleTale(
                      title:
                          "department ${controller.employeeInformation.department}",
                    ),
                    TitleTale(
                      title:
                          "employeeId ${controller.employeeInformation.employeeId}",
                    ),
                    TitleTale(
                      title: "Phone ${controller.employeeInformation.phone}",
                    ),
                    TitleTale(
                      title:
                          "hire date ${controller.employeeInformation.hireDate!.toDate()}",
                    ),
                    TitleTale(
                      title: "Salary ${controller.employeeInformation.salary}",
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
