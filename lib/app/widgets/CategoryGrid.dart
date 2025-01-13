import 'package:flutter/material.dart';
import 'package:smartina/app/widgets/categoryButton.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 200, // Sesuaikan tinggi maksimum sesuai kebutuhan
      ),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        physics: NeverScrollableScrollPhysics(), // Hindari scroll di dalam GridView
        children: [
          CategoryButton(title: 'Waktu Sholat', icon: Icons.timelapse),
          CategoryButton(title: "Al Qur'an", icon: FlutterIslamicIcons.quran),
          CategoryButton(title: 'Qiblat', icon: FlutterIslamicIcons.qibla),
          CategoryButton(title: 'Halal Foods', icon: Icons.restaurant),
          CategoryButton(title: 'Hotel', icon: Icons.hotel),
          CategoryButton(title: 'Transport', icon: Icons.fire_truck),
          CategoryButton(title: 'Event', icon: Icons.event),
          CategoryButton(title: 'Support Malang', icon: Icons.support),
        ],
      ),
    );
  }
}
