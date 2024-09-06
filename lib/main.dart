import 'package:healo_app/src/features/screens/welcome/welcome_screen.dart';
import 'package:healo_app/src/util/theme/widget_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'demo.dart';

Future<void> main() async {
  await Supabase.initialize(
      url: "https://sgwnssqdicjsaqqgrert.supabase.co/",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNnd25zc3FkaWNqc2FxcWdyZXJ0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjQ4NTE5MTgsImV4cCI6MjA0MDQyNzkxOH0.CrWpi4HgjALR8dj9pgo9T-cDryhEGuSqFYuvaw1gWAA");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
