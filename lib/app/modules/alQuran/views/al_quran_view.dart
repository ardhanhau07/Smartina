import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'suratDetail.dart'; 
import '../../../settings/constants.dart';
import '../controllers/al_quran_controller.dart';

class AlQuranView extends GetView<AlQuranController> {
  const AlQuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: AppBar(
            backgroundColor: Constants.primaryColor.withOpacity(0.3),
            elevation: 0,
            title: Row(
              children: [
                const Text("Al - Qur'an",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.bookmark_outline,
                      color: Constants.primaryColor),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings_outlined,
                      color: Constants.primaryColor),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Constants.primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.png'), 
            fit: BoxFit.cover, 
            opacity: 0.5, 
          ),
        ),
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.suratList.isEmpty) {
              return const Center(child: Text('Data surat tidak ditemukan'));
            }

            return ListView.builder(
              itemCount: controller.suratList.length,
              itemBuilder: (context, index) {
                final surat = controller.suratList[index];
                final namaSurat = surat['nama'];
                final arti = surat['arti'];
                final jumlahAyat = surat['ayat'];
                final nomorSurat = surat['nomor'];

                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  elevation: 5,
                  child: ListTile(
                    leading: Icon(Icons.library_books,
                        color: Constants.primaryColor),
                    title: Text('$namaSurat ($arti)',
                        style: const TextStyle(fontSize: 18)),
                    subtitle: Text('Jumlah Ayat: $jumlahAyat'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Get.to(() => SuratDetailScreen(nomorSurat: nomorSurat));
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
