import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AlQuranController extends GetxController {
  var suratList = [].obs; 
  var isLoading = false.obs; 

  @override
  void onInit() {
    super.onInit();
    fetchDataSurat();
  }

  Future<void> fetchDataSurat() async {
    const url = 'https://api.npoint.io/99c279bb173a6e28359c/data';

    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        suratList.value = json.decode(response.body);
      } else {
        Get.snackbar("Error", "Gagal mengambil data surat",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
