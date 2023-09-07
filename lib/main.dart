import 'package:flutter/material.dart';
import 'package:flutter_theme_practice/controller/theme_controller.dart';
import 'package:flutter_theme_practice/view/home.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  Get.put(ThemeController(preferences), permanent: true);
  runApp(const MyApp());
}

class MyApp extends GetView<ThemeController> {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MaterialApp(
        theme: lightMode,
        darkTheme: darkMode,
        themeMode: controller.themeMode.value,
        home: const Home(),
      ),
    );
  }
}

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  textTheme: TextTheme(
    titleLarge: const TextStyle(color: Color(0xff28222b)),
    titleSmall: TextStyle(color: const Color(0xff28222b).withOpacity(0.7)),
    labelMedium: const TextStyle(color: Color(0xff9229c8)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff9279c8)),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  cardTheme: const CardTheme(color: Colors.white),
  dividerTheme: const DividerThemeData(
    color: Color(0xffeae8f4),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color(0xffeae8f4),
  ),
  switchTheme: const SwitchThemeData(
    thumbColor: MaterialStatePropertyAll(Colors.white),
    trackColor: MaterialStatePropertyAll(Color(0xff9279c8)),
  ),
  scaffoldBackgroundColor: const Color(0xffEAE8F4),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  textTheme: TextTheme(
    titleLarge: const TextStyle(color: Color(0xffdadada)),
    titleSmall: TextStyle(color: const Color(0xffdadada).withOpacity(0.7)),
    labelMedium: const TextStyle(color: Color(0xff8abd93)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff8abd93)),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  cardTheme: const CardTheme(
    color: Color(0xff342c38),
  ),
  dividerTheme: const DividerThemeData(
    color: Color(0xff28222b),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color(0xff282228),
  ),
  switchTheme: const SwitchThemeData(
    thumbColor: MaterialStatePropertyAll(Colors.black),
    trackColor: MaterialStatePropertyAll(Color(0xffdadada)),
  ),
  scaffoldBackgroundColor: const Color(0xff282228),
);
