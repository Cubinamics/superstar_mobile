import 'package:flutter/material.dart';
import 'gender_selection_screen.dart';
import 'terms_and_conditions_screen.dart';
import '../theme/app_theme.dart';

class IdleScreen extends StatelessWidget {
  const IdleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Force full width
        height: double.infinity, // Force full height
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Color(0xFF1a1a1a)],
          ),
        ),
        child: SafeArea(
          child: Container(
            width: double.infinity, // Ensure SafeArea takes full width
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center horizontally
              children: [
                // Logo/Branding
                const Icon(
                  Icons.camera_alt_outlined,
                  size: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 30),

                // Title
                Text(
                  'REMIX YOUR STYLE',
                  style: AppTheme.headingMedium.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                // Subtitle
                Text(
                  'Snap a photo. Let the app create your look.',
                  style: AppTheme.headingMedium.copyWith(
                    fontSize: 20,
                    color: Colors.grey,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 80),

                // Start Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GenderSelectionScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                  ),
                  child: Text(
                    'START',
                    style: AppTheme.buttonText.copyWith(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Terms and Conditions Button
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsAndConditionsScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Terms and Conditions',
                    style: AppTheme.bodyLarge.copyWith(
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
