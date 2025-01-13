import 'package:flutter/material.dart';
import '../../../settings/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class TransportView extends StatefulWidget {
  const TransportView({super.key});

  @override
  _TransportViewState createState() => _TransportViewState();
}

class _TransportViewState extends State<TransportView> {
  final TextEditingController asalController = TextEditingController();
  final TextEditingController tujuanController = TextEditingController();
  LatLng? asalLocation;

  Future<List<String>> searchLocation(String query) async {
    if (query.isEmpty) return [];
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?format=json&q=$query');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data
          .map<String>((place) => place["display_name"] as String)
          .toList();
    }
    return [];
  }

  Future<LatLng?> getCoordinates(String query) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?format=json&q=$query');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      if (data.isNotEmpty) {
        return LatLng(
            double.parse(data[0]['lat']), double.parse(data[0]['lon']));
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          content(),
          Positioned(top: 0, left: 0, right: 0, child: appBar()),
          Positioned(top: 90, left: 20, right: 20, child: asalField()),
          Positioned(top: 150, left: 20, right: 20, child: tujuanField()),
        ],
      ),
    );
  }

  Widget appBar() {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Row(
        children: const [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/places/cafe2.jpg'),
          ),
          SizedBox(width: 10),
          Text(
            'Mau Kemana, Zulfa?',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(Icons.settings, color: Colors.white),
        ],
      ),
    );
  }

  Widget asalField() {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) async {
        return await searchLocation(textEditingValue.text);
      },
      onSelected: (String suggestion) async {
        asalController.text = suggestion;
        LatLng? location = await getCoordinates(suggestion);
        setState(() {
          asalLocation = location;
        });
      },
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        return TextField(
          controller: asalController,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: 'Asal',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none),
            suffixIcon: const Icon(Icons.circle_outlined, color: Colors.grey),
          ),
        );
      },
    );
  }

  Widget tujuanField() {
    return TextField(
      controller: tujuanController,
      decoration: InputDecoration(
        hintText: 'Mau kemana hari ini?',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        suffixIcon: const Icon(Icons.golf_course, color: Colors.grey),
      ),
    );
  }

  Widget content() {
    return FlutterMap(
      options: MapOptions(
        initialCenter: asalLocation ?? LatLng(-7.9214, 112.5483),
        initialZoom: 15,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
        ),
        MarkerLayer(
            markers: asalLocation != null ? [_buildMarker(asalLocation!)] : []),
      ],
    );
  }

  Marker _buildMarker(LatLng position) {
    return Marker(
      point: position,
      width: 50,
      height: 50,
      child: const Icon(Icons.location_pin, size: 50, color: Colors.red),
    );
  }
}