import 'package:flutter/material.dart';
import 'presentation/screens/splash_screen.dart';
import 'core/session_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager.initSession();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NOVATREX AI',
      home: SplashScreen(), 
    );
  }
}
