import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:async';
import 'email_screen.dart';
import 'gender_selection_screen.dart';
import '../services/api_service.dart';

class PhotoReviewScreen extends StatefulWidget {
  final Uint8List photoBytes;
  final String gender;

  const PhotoReviewScreen({
    Key? key,
    required this.photoBytes,
    required this.gender,
  }) : super(key: key);

  @override
  State<PhotoReviewScreen> createState() => _PhotoReviewScreenState();
}

class _PhotoReviewScreenState extends State<PhotoReviewScreen> {
  bool _isCreatingSession = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // No longer create session immediately - just show the photo for review
  }

  Future<void> _createSessionAndContinue() async {
    try {
      setState(() {
        _isCreatingSession = true;
        _errorMessage = null;
      });

      final sessionId = await ApiService.createSession(
        widget.photoBytes,
        widget.gender,
      );

      if (mounted) {
        // Navigate to email screen with the new session
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EmailScreen(
              photoBytes: widget.photoBytes,
              gender: widget.gender,
              sessionId: sessionId,
            ),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isCreatingSession = false;
        _errorMessage = 'Failed to create session. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show loading screen while creating session
    if (_isCreatingSession) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Color(0xFF1a1a1a)],
            ),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: Colors.white),
                SizedBox(height: 16),
                Text(
                  'Creating session...',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Show error screen if session creation failed
    if (_errorMessage != null) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Color(0xFF1a1a1a)],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.red, size: 64),
                const SizedBox(height: 16),
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Go Back'),
                ),
              ],
            ),
          ),
        ),
      );
    }

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
                        'RCHECK YOUR PHOTO',
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

              // Photo preview
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
                    child: Image.memory(
                      widget.photoBytes,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),

              // Instructions
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Retake or lock it in.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Error message (if any)
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 8.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              // Action buttons
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    // Retake button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Go back to gender selection to start over
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const GenderSelectionScreen(),
                            ),
                            (route) => route.isFirst,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white, width: 2),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          'RETAKE',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Continue button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: !_isCreatingSession
                            ? _createSessionAndContinue
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          _isCreatingSession ? 'SENDING...' : 'CONTINUE',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
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
