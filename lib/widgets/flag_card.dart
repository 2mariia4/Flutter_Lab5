import 'package:flutter/material.dart';

class FlagCard extends StatelessWidget {
  final String assetPath;
  final String title;

  const FlagCard({
    super.key,
    required this.assetPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Image.asset(
              assetPath,
              height: 180,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}