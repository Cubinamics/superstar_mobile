import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class ApiService {
  // For Android emulator, use 10.0.2.2
  // For physical device, use your computer's IP address
  static const String baseUrl = 'http://10.0.2.2:3001';

  /// Create a new session with user photo and gender
  static Future<String> createSession(
      Uint8List photoBytes, String gender) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/session'));

      // Add gender field
      request.fields['gender'] = gender;

      // Add photo file
      request.files.add(
        http.MultipartFile.fromBytes(
          'photo',
          photoBytes,
          filename: 'user_photo.jpg',
        ),
      );

      // Send request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        return data['sessionId'];
      } else {
        throw Exception('Failed to create session: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  /// Send email with snapshot for the session
  static Future<bool> sendEmail(String sessionId, String email) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/session/$sessionId/email'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
        }),
      );

      if (response.statusCode == 202) {
        return true;
      } else if (response.statusCode == 410) {
        throw SessionExpiredException('Session has expired or already used');
      } else if (response.statusCode == 404) {
        throw Exception('Session not found');
      } else {
        throw Exception('Failed to send email: ${response.statusCode}');
      }
    } catch (e) {
      if (e is SessionExpiredException) {
        rethrow;
      }
      throw Exception('Network error: $e');
    }
  }

  /// Check backend health
  static Future<bool> checkHealth() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/health'));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}

class SessionExpiredException implements Exception {
  final String message;
  SessionExpiredException(this.message);

  @override
  String toString() => message;
}
