import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengaturan_sholat_controller.dart';

class PengaturanSholatView extends GetView<PengaturanSholatController> {
  const PengaturanSholatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PengaturanSholatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PengaturanSholatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
