import 'package:flutter/material.dart';

class AnswerButtons extends StatelessWidget {
  final List<String> options;
  final void Function(String) onSelected;

  const AnswerButtons({
    super.key,
    required this.options,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options
          .map(
            (option) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF1E3C72),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () => onSelected(option),
                child: Text(
                  option,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}