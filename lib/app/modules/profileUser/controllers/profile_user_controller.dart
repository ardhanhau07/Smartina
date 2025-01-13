import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileUserController extends GetxController {
  var isDarkMode = false.obs;
  var notificationsEnabled = true.obs;
  var selectedLanguage = 'English'.obs;

  final List<String> languages = [
    'English',
    'Bahasa Indonesia',
    'Español',
    'Français',
    'Deutsch',
  ];

  void toggleDarkMode(bool value) {
    isDarkMode.value = value;
  }

  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;
  }

  void showLanguageSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: languages.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(languages[index]),
              onTap: () {
                selectedLanguage.value = languages[index];
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }
}
