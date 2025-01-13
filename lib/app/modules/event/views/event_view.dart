import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../settings/constants.dart';
import '../controllers/event_controller.dart';

class EventView extends GetView<EventController> {
  const EventView({super.key});
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
                const Text("Info Event",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.info_outline,
                      color: Constants.primaryColor),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings_outlined, color: Constants.primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'EventView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
