import 'package:attendance/features/home/presentation/controller/home_cubit.dart';
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
                    ElevatedButton(onPressed: () {}, child: const Text('test')),
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
