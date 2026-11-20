
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());

  Future<void> cekSesi() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');

    if (email != null && email.isNotEmpty) {
      emit(AuthAuthenticated(email));
    } else {
      emit(const AuthUnauthenticated());
    }
  }

  Future<void> login(String username, String password) async {
    emit(const AuthLoading());

    await Future.delayed(const Duration(seconds: 1));

    if (username == 'admin' && password == '123456') {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', username);

      emit(AuthAuthenticated(username));
    } else {
      emit(const AuthError('Username atau password salah'));
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');

    emit(const AuthUnauthenticated());
  }
}
