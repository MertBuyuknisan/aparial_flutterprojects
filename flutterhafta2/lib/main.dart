import 'package:flutter/material.dart';
import 'package:flutterhafta2/birincisayfa.dart';
import 'package:shared_preferences/shared_preferences.dart';


final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
      final prefs = await SharedPreferences.getInstance();
      final isDarkMode = prefs.getBool('karanlikMod') ?? false;
      themeNotifier.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  } catch (e) {
      themeNotifier.value = ThemeMode.light;
  }

  runApp(const Anasayfa());
}

class Anasayfa extends StatelessWidget {
  const Anasayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, child) {
        return MaterialApp(
          title: "İkinciHafta",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          themeMode: currentMode, 
          home: const BirinciSayfa(),
        );
      },
    );
  }
}
