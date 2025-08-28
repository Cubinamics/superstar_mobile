import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import '../main.dart';
import 'photo_review_screen.dart';
import 'dart:io';
import 'dart:typed_data';

class CameraScreen extends StatefulWidget {
  final String gender;

  const CameraScreen({Key? key, required this.gender}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  bool _isInitialized = false;
  bool _isCountingDown = false;
  int _countdown = 10;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // Request camera permission
    final status = await Permission.camera.request();
    if (status != PermissionStatus.granted) {
      _showPermissionDialog();
      return;
    }

    if (cameras.isEmpty) {
      _showNoCameraDialog();
      return;
    }

    // Initialize camera with front camera if available
    CameraDescription camera = cameras.first;
    for (var cam in cameras) {
      if (cam.lensDirection == CameraLensDirection.front) {
        camera = cam;
        break;
      }
    }

    _controller = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    try {
      await _controller!.initialize();
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      print('Error initializing camera: $e');
      _showCameraErrorDialog();
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Camera Permission Required'),
        content: const Text('This app needs camera access to take your photo.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Go Back'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }

  void _showNoCameraDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('No Camera Found'),
        content: const Text('No camera is available on this device.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }

  void _showCameraErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Camera Error'),
        content: const Text('Failed to initialize camera. Please try again.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }

  Future<void> _startCountdownAndTakePhoto() async {
    if (!_isInitialized || _controller == null) return;

    setState(() {
      _isCountingDown = true;
      _countdown = 10;
    });

    // Countdown timer
    for (int i = 10; i > 0; i--) {
      if (!mounted) return;
      setState(() {
        _countdown = i;
      });
      await Future.delayed(const Duration(seconds: 1));
    }

    if (!mounted) return;

    try {
      final XFile photo = await _controller!.takePicture();
      final Uint8List photoBytes = await photo.readAsBytes();

      setState(() {
        _isCountingDown = false;
      });

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoReviewScreen(
              photoBytes: photoBytes,
              gender: widget.gender,
            ),
          ),
        );
      }
    } catch (e) {
      print('Error taking photo: $e');
      setState(() {
        _isCountingDown = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to take photo. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Color(0xFF1a1a1a)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.white, size: 28),
                    ),
                    const Expanded(
                      child: Text(
                        'SNAP YOUR POSE!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 48), // Balance the back button
                  ],
                ),
              ),

              // Camera preview
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.3), width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: _isInitialized && _controller != null
                        ? Stack(
                            children: [
                              // Ensure consistent sizing with SizedBox
                              SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: SizedBox(
                                    width: _controller!
                                            .value.previewSize?.height ??
                                        1,
                                    height:
                                        _controller!.value.previewSize?.width ??
                                            1,
                                    child: CameraPreview(_controller!),
                                  ),
                                ),
                              ),
                              if (_isCountingDown)
                                Positioned.fill(
                                  child: Container(
                                    color: Colors.black.withOpacity(0.7),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '$_countdown',
                                            style: const TextStyle(
                                              fontSize: 120,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const Text(
                                            'Get ready!',
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          )
                        : const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(color: Colors.white),
                                SizedBox(height: 16),
                                Text(
                                  'Initializing camera...',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ),

              // Instructions and capture button
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text(
                      'Step up. You’ve got 10 seconds! Make it original.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 30),

                    // Capture button
                    GestureDetector(
                      onTap: _isInitialized && !_isCountingDown
                          ? _startCountdownAndTakePhoto
                          : null,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: _isInitialized && !_isCountingDown
                              ? Colors.white
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 4,
                          ),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: _isInitialized && !_isCountingDown
                              ? Colors.black
                              : Colors.white,
                          size: 36,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
