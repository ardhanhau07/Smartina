import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../settings/constants.dart';

class SuratDetailScreen extends StatefulWidget {
  final String nomorSurat;

  const SuratDetailScreen({required this.nomorSurat, super.key});

  @override
  _SuratDetailScreenState createState() => _SuratDetailScreenState();
}

class _SuratDetailScreenState extends State<SuratDetailScreen> {
  List<dynamic> ayatList = [];
  bool isLoading = true;

  // Fungsi untuk mengambil data ayat dari API berdasarkan nomor surat
  Future<void> fetchAyatData() async {
    final url =
        'https://api.npoint.io/99c279bb173a6e28359c/surat/${widget.nomorSurat}'; // URL API Ayat

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          ayatList = json.decode(response.body); // Parsing JSON sebagai List
          isLoading = false;
        });
      } else {
        throw Exception('Gagal mengambil data ayat');
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAyatData(); // Memanggil fetchAyatData saat halaman pertama kali dimuat
  }

  String convertToArabicNumber(String number) {
    const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return number.split('').map((e) => arabicDigits[int.parse(e)]).join();
  }

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
                Text('Surat ${widget.nomorSurat} Detail',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.cases, color: Constants.primaryColor),
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ayatList.isEmpty
              ? const Center(child: Text('Ayat tidak ditemukan'))
              : ListView.builder(
                  itemCount: ayatList.length,
                  itemBuilder: (context, index) {
                    final ayat = ayatList[index]; // Ambil data dari List
                    final nomorAyat = ayat['nomor'];
                    final arabicNumber = convertToArabicNumber(nomorAyat);
                    final arabicText = ayat['ar'];
                    final terjemahan = ayat['id'];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      elevation: 5,
                      child: ListTile(
                        leading: Text(
                          arabicNumber,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'ScheherazadeNew',
                            color: Constants.primaryColor,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(arabicText,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'ScheherazadeNew')),
                            Text(terjemahan,
                                style: const TextStyle(
                                    fontSize: 14, fontStyle: FontStyle.italic)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
