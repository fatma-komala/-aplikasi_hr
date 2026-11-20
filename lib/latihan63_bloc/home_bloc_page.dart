
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_cubit.dart';
import 'login_bloc_page.dart';
import '../tantangan/halaman_tantangan.dart';

class HomeBlocPage extends StatelessWidget {
  const HomeBlocPage({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard HR'),
        actions: [
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await context.read<AuthCubit>().logout();

              if (!context.mounted) return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginBlocPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              size: 80,
            ),
            const SizedBox(height: 16),
            Text(
              'Selamat datang, $username!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text('Anda berhasil login ke Aplikasi HR.'),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.swap_horiz),
              label: const Text('Buka Tantangan 6.4'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HalamanTantangan(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
