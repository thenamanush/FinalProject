import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ticktask/auth/authgate.dart';
import 'package:ticktask/pages/homepage.dart';
import 'package:ticktask/pages/loginpage.dart';
import 'package:ticktask/pages/signuppage.dart';

void main() async {
  // intialize the supabase
  await Supabase.initialize(
    url: 'https://mfztcaiydjfkfsoxiknb.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1menRjYWl5ZGpma2Zzb3hpa25iIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc0Mjg3OTEsImV4cCI6MjA3MzAwNDc5MX0.xY5LUpxlCxaRnAO2B-nrVV7-UjPNpZbrsGPMTGEHwE0',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
      theme: ThemeData(primarySwatch: Colors.cyan),
    );
  }
}
