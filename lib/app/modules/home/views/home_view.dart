import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartina/app/widgets/CategoryGrid.dart';
import 'package:smartina/app/widgets/RecomendationCard.dart';
import 'package:smartina/app/widgets/searchBar.dart';
import 'package:smartina/app/widgets/sectionTitle.dart';
import '../../../settings/constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: AppBar(
              backgroundColor: Constants.primaryColor.withOpacity(0.3),
              elevation: 0,
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/places/cafe2.jpg'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome",
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                      Text("Zulfa Ulinnuha",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: Constants.primaryColor,
                      ))
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Searchbar(),
                SizedBox(
                  height: 20,
                ),
                CategoryGrid(),
                SectionTitle(title: 'Recomendation'),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: RecomendationCard(
                        title: 'Wali Songo',
                        address: 'Jl. Kayutangan',
                        imagePath: 'assets/images/places/wali9.jpeg',
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      child: RecomendationCard(
                        title: 'Masjid Agung Kota Malang',
                        address: 'Jl. Alun-Alun',
                        imagePath: 'assets/images/places/agungmalang.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SectionTitle(title: 'Halal Foods'),
                SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: RecomendationCard(
                        title: 'Shawarma Burger',
                        address: 'Jl. Kayutangan',
                        imagePath: 'assets/images/foods/burger.jpeg',
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      child: RecomendationCard(
                        title: 'Kebab Shawarma',
                        address: 'Jl. Alun-Alun',
                        imagePath: 'assets/images/foods/kebab.jpg',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SectionTitle(title: 'Video'),
                SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: RecomendationCard(
                        title: 'Tata Cara Wudhu',
                        address: 'Tutorial Lengkap Berwudhu',
                        imagePath: 'assets/images/videos/wudhu.jpg',
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      child: RecomendationCard(
                        title: 'Rekomendasi Camping Malang',
                        address: 'Ayuk Intip Rekomendasi Camping di Malang!',
                        imagePath: 'assets/images/videos/rekomendasi.png',
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 100,
                )
              ],
            ),
          ),
        ));
  }
}
