import 'package:flutter/material.dart';
import 'package:quizapp/screens/questions_screen.dart';
import 'package:quizapp/data/globals.dart';

class CategoryScreen extends StatelessWidget {
  final String userName;
  const CategoryScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a Quiz"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCategoryTitle(
                context,
                'Sports Quiz',
                Icons.sports_soccer,
                Colors.blue,
                QuestionsScreen(
                    questionList: sportQuizQuestions,
                    questionsCategory: 'Sports Quiz',
                    userName: userName),
              ),
              const SizedBox(height: 20),
              _buildCategoryTitle(
                context,
                'IQ Quiz',
                Icons.lightbulb_outline,
                Colors.green,
                QuestionsScreen(
                    questionList: iqQuizQuestions,
                    questionsCategory: 'IQ Quiz',
                    userName: userName),
              ),
              const SizedBox(height: 20),
              _buildCategoryTitle(
                context,
                'Math Quiz',
                Icons.calculate,
                Colors.red,
                QuestionsScreen(
                    questionList: mathQuizQuestions,
                    questionsCategory: 'Math Quiz',
                    userName: userName),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTitle(BuildContext context, String title, IconData icon,
      Color color, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (BuildContext context) => screen),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
