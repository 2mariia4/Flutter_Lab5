import 'dart:math';

import 'package:flutter/material.dart';

import '../data/flags_data.dart';
import '../widgets/answer_buttons.dart';
import '../widgets/flag_card.dart';
import '../widgets/gradient_background.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Random _random = Random();

  late FlagItem _current;
  late List<String> _options;
  String? _message;
  Color _messageColor = Colors.white;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _nextQuestion();
  }

  void _nextQuestion() {
    final int index = _random.nextInt(flags.length);
    _current = flags[index];

    final Set<String> options = {_current.country};
    while (options.length < 3) {
      options.add(flags[_random.nextInt(flags.length)].country);
    }

    final List<String> shuffled = options.toList()..shuffle(_random);

    setState(() {
      _options = shuffled;
      _message = null;
      _messageColor = Colors.white;
    });
  }

  void _checkAnswer(String answer) {
    setState(() {
      if (answer == _current.country) {
        _score++;
        _message = 'Верно! Это ${_current.country}';
        _messageColor = Colors.greenAccent;
      } else {
        _message = 'Неверно. Правильный ответ: ${_current.country}';
        _messageColor = Colors.redAccent;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Угадай флаг',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Счёт: $_score',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                FlagCard(
                  assetPath: _current.assetPath,
                  title: 'Что это за страна?',
                ),
                const SizedBox(height: 20),
                AnswerButtons(
                  options: _options,
                  onSelected: _checkAnswer,
                ),
                const SizedBox(height: 16),
                if (_message != null)
                  Text(
                    _message!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _messageColor,
                    ),
                  ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: _nextQuestion,
                  icon: const Icon(Icons.skip_next),
                  label: const Text('Следующий флаг'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 54),
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF1E3C72),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}