import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../settings/constants.dart';
import '../controllers/profile_user_controller.dart';

class ProfileUserView extends GetView<ProfileUserController> {
  const ProfileUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileUserController());

    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/Girl.jpg'),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Input Your Name Here',
                      label: Text(
                        'Name',
                        style: TextStyle(color: Constants.primaryColor),
                      ),
                      labelStyle: Constants.BodyMedium,
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: const TextStyle(color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Input Your Address Here',
                      label: Text(
                        'Address',
                        style: TextStyle(color: Constants.primaryColor),
                      ),
                      labelStyle: Constants.BodyMedium,
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: const TextStyle(color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Input Your Mobile Number Here',
                      label: Text(
                        'Mobile Number',
                        style: TextStyle(color: Constants.primaryColor),
                      ),
                      labelStyle: Constants.BodyMedium,
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: const TextStyle(color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(() => Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SwitchListTile(
                          title: const Text("Dark Mode"),
                          subtitle: const Text("Enable dark mode for the app"),
                          value: controller.isDarkMode.value,
                          onChanged: (bool value) {
                            controller.toggleDarkMode(value);
                          },
                          secondary:
                              const Icon(Icons.dark_mode, color: Colors.blue),
                        ),
                      )),
                  const SizedBox(height: 20),
                  Obx(() => Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SwitchListTile(
                          title: const Text("Notifications"),
                          subtitle: const Text(
                              "Enable or disable app notifications"),
                          value: controller.notificationsEnabled.value,
                          onChanged: (bool value) {
                            controller.toggleNotifications(value);
                          },
                          secondary: const Icon(Icons.notifications,
                              color: Colors.blue),
                        ),
                      )),
                  const SizedBox(height: 20),
                  Obx(() => Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading:
                              const Icon(Icons.language, color: Colors.blue),
                          title: Text(
                              "Language: ${controller.selectedLanguage.value}"),
                          subtitle: const Text("Tap to select language"),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () =>
                              controller.showLanguageSelection(context),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
