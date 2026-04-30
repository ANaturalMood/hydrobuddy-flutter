import 'package:flutter/material.dart';
import 'package:hydrobuddy/l10n/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.about)),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(height: 32),
          Center(
            child: Icon(
              Icons.science,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'HydroBuddy',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              '1.0.0+1',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              AppLocalizations.of(context)!.aboutDescription,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.credits,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            AppLocalizations.of(context)!.aboutHistory,
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.license,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            AppLocalizations.of(context)!.gplLicense,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
