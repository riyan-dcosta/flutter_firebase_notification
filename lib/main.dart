import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final firebaseInstance = await FirebaseMessaging.instance;
  final notificationSettings =
      firebaseInstance.requestPermission(provisional: true);
  firebaseInstance.onTokenRefresh.listen(
    (event) {
      print(event.toString());
    },
  );
  final fcmToken = await firebaseInstance.getToken();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
