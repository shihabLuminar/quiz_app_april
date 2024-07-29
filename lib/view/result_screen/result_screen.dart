import 'package:flutter/material.dart';
import 'package:quiz_app_april/dummy_db.dart';
import 'package:quiz_app_april/view/home_screen/home_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.rightAnswerCount});

  final int rightAnswerCount;

  @override
  Widget build(BuildContext context) {
    double percentage = rightAnswerCount * 100 / DummyDb.question.length;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("$percentage %"),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Text("Restart"))
          ],
        ),
      ),
    );
  }
}
