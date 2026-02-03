import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthNotifier extends ChangeNotifier {
  final SupabaseClient supabase;

  AuthNotifier(this.supabase) {
    supabase.auth.onAuthStateChange.listen((_) {
      notifyListeners();
    });
  }

  bool get isLoggedIn => supabase.auth.currentSession != null;
}
