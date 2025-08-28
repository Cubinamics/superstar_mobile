import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'screens/idle_screen.dart';
import 'theme/app_theme.dart';

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
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const IdleScreen(),
    );
  }
}
