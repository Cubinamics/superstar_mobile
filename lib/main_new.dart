import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'screens/idle_screen.dart';

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    cameras = await availableCameras();
  } catch (e) {
    print('Error initializing cameras: $e');
    cameras = [];
  }

  runApp(const SuperstarApp());
}

class SuperstarApp extends StatelessWidget {
  const SuperstarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adidas Superstar Experience',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Arial',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          headlineLarge:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          headlineMedium:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const IdleScreen(),
    );
  }
}
