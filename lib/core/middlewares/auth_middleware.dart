import 'package:supabase_flutter/supabase_flutter.dart';

class AuthNotifier {
  final SupabaseClient supabase;

  AuthNotifier(this.supabase) {
    supabase.auth.onAuthStateChange.listen((_) {});
  }

  bool get isLoggedIn => supabase.auth.currentSession != null;
}
