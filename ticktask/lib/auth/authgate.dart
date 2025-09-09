import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ticktask/pages/homepage.dart';
import 'package:ticktask/pages/loginpage.dart';

class AuthGate extends StatelessWidget {
  AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        // valid session
        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (session != null) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
