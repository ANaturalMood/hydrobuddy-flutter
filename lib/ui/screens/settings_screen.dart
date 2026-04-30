import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: ListView(
        children: [
          _SettingsTile(
            icon: Icons.biotech_outlined,
            title: 'Precisão dos Instrumentos',
            onTap: () => context.push('/settings/instrument-precision'),
          ),
          _SettingsTile(
            icon: Icons.functions_outlined,
            title: 'Grau de Liberdade (DOF)',
            onTap: () => context.push('/settings/degree-of-freedom'),
          ),
          _SettingsTile(
            icon: Icons.water_drop_outlined,
            title: 'Qualidade da Água',
            onTap: () => context.push('/water-quality'),
          ),
          _SettingsTile(
            icon: Icons.science_outlined,
            title: 'Análise de Tecido',
            onTap: () => context.push('/tissue'),
          ),
          _SettingsTile(
            icon: Icons.info_outline,
            title: 'Sobre o HydroBuddy',
            onTap: () => context.push('/settings/about'),
          ),
          _SettingsTile(
            icon: Icons.language_outlined,
            title: 'Idioma',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Em breve')),
              );
            },
          ),
          _SettingsTile(
            icon: Icons.palette_outlined,
            title: 'Tema',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Em breve')),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
