import 'package:permission_handler/permission_handler.dart';

Future<void> _requestMicrophonePermission() async {
  final status = await Permission.microphone.status;

  if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) {
    final result = await Permission.microphone.request();
    if (result.isGranted) {
      print('🎤 Microphone permission granted.');
    } else {
      print('🚫 Microphone permission denied.');
    }
  } else if (status.isGranted) {
    print('🎤 Microphone permission already granted.');
  }
}
