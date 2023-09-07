import 'package:flutter/material.dart';
import 'package:flutter_theme_practice/components/app_font.dart';
import 'package:flutter_theme_practice/controller/theme_controller.dart';
import 'package:get/get.dart';

class ThemeDrawer extends GetView<ThemeController> {
  const ThemeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Obx(
            () => Column(
              children: [
                Row(
                  children: [
                    AppFont(
                      controller.themeMode.value == ThemeMode.light
                          ? '라이트 모드'
                          : '다크 모드',
                      fontSize: 23,
                    ),
                    Switch(
                      value: controller.themeMode.value == ThemeMode.light,
                      onChanged: (modechage) {
                        controller.updateThemeMode(
                          modechage ? ThemeMode.light : ThemeMode.dark,
                          saveThemeModeState: true,
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
