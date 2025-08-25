# Adidas Superstar Experience - Mobile App

Flutter Android tablet app for user interaction in the store experience.

## Features

- **Multi-Screen Flow**: Idle → Info → Gender → Camera → Review → Email
- **Camera Integration**: Front-facing camera with 5s countdown
- **Photo Capture**: High-quality image capture and review
- **API Integration**: REST calls to backend server
- **Responsive Design**: Optimized for tablet screens

## Setup

1. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```

2. Configure backend URL in `lib/services/api_service.dart`:
   ```dart
   static const String baseUrl = 'http://YOUR_BACKEND_IP:3001';
   ```

3. For Android emulator, use:
   ```dart
   static const String baseUrl = 'http://10.0.2.2:3001';
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Screen Flow

### 1. Idle Screen
- Welcome message and branding
- "Start Experience" button
- Clean, attractive design

### 2. Info Screen
- Explains the 4-step process
- Visual step-by-step guide
- Continue button to proceed

### 3. Gender Selection
- Three options: Male, Female, Neutral
- Visual selection with icons
- Must select before continuing

### 4. Camera Screen
- Camera preview (front-facing preferred)
- 5-second countdown timer
- Automatic photo capture

### 5. Photo Review
- Shows captured photo
- Options: Retake or Continue
- Large preview for review

### 6. Email Screen
- Email input form
- Shows small photo preview
- Sends snapshot request to backend
- Success/error handling

## API Integration

The app communicates with the backend via REST API:

- `POST /session` - Upload photo and gender
- `POST /session/:id/email` - Send email with snapshot

## Camera Permissions

The app requires camera permissions for photo capture. Permissions are requested automatically when needed.

## File Structure

```
lib/
├── main.dart                    # App entry point
├── screens/                     # UI screens
│   ├── idle_screen.dart
│   ├── info_screen.dart
│   ├── gender_selection_screen.dart
│   ├── camera_screen.dart
│   ├── photo_review_screen.dart
│   └── email_screen.dart
└── services/
    └── api_service.dart         # Backend API calls
```

## Build for Production

1. Build APK:
   ```bash
   flutter build apk --release
   ```

2. Install on tablet:
   ```bash
   flutter install
   ```
