import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mountain_controller.dart';

class MountainView extends GetView<MountainController> {
  const MountainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MountainView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MountainView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
