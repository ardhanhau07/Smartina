import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await initialization(); 
  FlutterNativeSplash.remove(); 

  runApp(MyApp());
}

Future initialization() async {
  await Future.delayed(Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smartina",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: _buildTheme(Brightness.light),
      darkTheme: ThemeData.dark(),
    );
  }
}

ThemeData _buildTheme(Brightness brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.lexendDecaTextTheme(baseTheme.textTheme),
  );
}
