import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartina/app/settings/constants.dart';

import '../routes/app_pages.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryButton({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          switch (title) {
            case 'Waktu Sholat':
              Get.toNamed(Routes.SHOLAT);
              break;
            case "Al Qur'an":
              Get.toNamed(Routes.AL_QURAN);
              break;
            case 'Qiblat':
              Get.toNamed(Routes.QIBLAT);
              break;
            case 'Halal Foods':
              Get.toNamed(Routes.FOODS);
              break;
            case 'Hotel':
              Get.toNamed(Routes.HOTEL);
              break;
            case 'Transport':
              Get.toNamed(Routes.TRANSPORT);
              break;
            case 'Event':
              Get.toNamed(Routes.EVENT);
              break;
            case 'Support Malang':
              Get.toNamed(Routes.SUPPORT);
              break;
            default:
              // Tambahkan rute default jika diperlukan
              break;
          }
        },
        // mainAxisAlignment: MainAxisAlignment.center
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Constants.primaryColor),
              padding: EdgeInsets.all(10),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
