
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'latihan63_bloc/app_bloc_observer.dart';
import 'latihan63_bloc/auth_cubit.dart';
import 'latihan63_bloc/login_bloc_page.dart';

void main() {
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit()..cekSesi(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplikasi HR',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
          useMaterial3: true,
        ),
        home: const LoginBlocPage(),
      ),
    );
  }
}
