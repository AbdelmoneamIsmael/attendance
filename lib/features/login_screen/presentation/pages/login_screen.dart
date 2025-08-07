import 'package:attendance/core/app_controller/language_controller.dart';
import 'package:attendance/core/const/app_const.dart';
import 'package:attendance/core/widgets/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(children: [

                ],),
          ),
        ],
      ),
    );
  }
}
