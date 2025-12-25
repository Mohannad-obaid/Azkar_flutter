import 'package:azkar/screens/azkar_counter_screen.dart';
import 'package:azkar/screens/azkar_list_screen.dart';
import 'package:azkar/screens/favorites_screen.dart';
import 'package:azkar/screens/home_screen.dart';
import 'package:azkar/screens/prayer_time_screen.dart';
import 'package:azkar/screens/search_screen.dart';
import 'package:azkar/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/launch_screen.dart';
import 'screens/tasbeeh_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('ar'), Locale('en')],
      locale: Locale('ar'),
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansArabicTextTheme(),
      ),
      home: const TasbeehScreen(),
      initialRoute: '/launchScreen',
      routes: {
        '/launchScreen': (context) => const LaunchScreen(),
        '/homeScreen': (context) => const HomeScreenNew(),
        '/tasbeehScreen': (context) => const TasbeehScreen(),
        '/favoriteScreen': (context) => const FavoritesScreen(),
        '/settingsScreen': (context) => const SettingsScreen(),
        '/prayerTimesScreen': (context) => const PrayerTimesScreen(),
        '/listAzkarScreen': (context) => const AzkarListScreen(),
        '/searchScreen': (context) => const AzkarSearchScreen(),
        '/azkarCounterScreen': (context) => const AzkarCounterScreen(),
      },
    );
  }
}
