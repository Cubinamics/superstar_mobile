import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

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
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.white, size: 28),
                ),

                const SizedBox(height: 20),

                // Title
                const Text(
                  'Terms and Conditions',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 30),

                // Terms content (scrollable)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Adidas Superstar Interactive Experience',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildSection(
                          'Experience Overview',
                          'Welcome to the Adidas Superstar Interactive Experience. This application allows you to create personalized outfit combinations and receive custom snapshots via email.',
                        ),
                        _buildSection(
                          'Photo Capture and Usage',
                          'By participating in this experience, you consent to having your photo taken for the purpose of creating personalized outfit visualizations. Your photo will be temporarily stored on our secure servers during the session and will be automatically deleted after the experience concludes.',
                        ),
                        _buildSection(
                          'Data Privacy',
                          'We respect your privacy. Any personal information, including photos and email addresses, is used solely for the purpose of this interactive experience. We do not share, sell, or distribute your personal information to third parties.',
                        ),
                        _buildSection(
                          'Session Duration',
                          'Each experience session has a limited duration for security purposes. Your data will be automatically purged from our systems at the end of each session.',
                        ),
                        _buildSection(
                          'Email Communications',
                          'If you choose to provide your email address, we will send you your personalized snapshot. This is a one-time communication, and your email will not be used for marketing purposes.',
                        ),
                        _buildSection(
                          'Acceptance',
                          'By continuing with this experience, you acknowledge that you have read, understood, and agree to these terms and conditions.',
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'For questions or concerns, please contact our support team.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

                // Accept button
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'I UNDERSTAND',
                      style: TextStyle(
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
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              height: 1.5,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
