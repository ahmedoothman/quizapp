import 'package:quizapp/screens/score_screen.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  final String userName;
  final String questionsCategory;
  final List questionList; // Update to the correct type

  const QuestionsScreen({
    super.key,
    required this.questionList,
    required this.questionsCategory,
    required this.userName,
  });

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  int score = 0;

  void _answerQuestion(bool isCorrect) {
    // Update score if the answer is correct
    if (isCorrect) {
      score++;
    }

    // Check if there are more questions
    if (currentQuestionIndex < widget.questionList.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // Navigate to score screen when the quiz is completed
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => ScoreScreen(
            userName: widget.userName,
            score: score,
            totalQuestions: widget.questionList.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questionList[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          widget.questionsCategory,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 20),
            child: Center(
              child: Text(
                '${currentQuestionIndex + 1}/${widget.questionList.length}',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Progress bar
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / widget.questionList.length,
              backgroundColor: Colors.grey[300],
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 20),

            // Display the current question
            Text(
              currentQuestion['questionText'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Display the answer options dynamically
            ...currentQuestion['answers'].map<Widget>((option) {
              return _buildOptionButton(context, option['ans'], () {
                _answerQuestion(option['score'] == 1);
              });
            }).toList(),
          ],
        ),
      ),
    );
  }

  // Helper method to create a stylized button
  Widget _buildOptionButton(
      BuildContext context, String answerText, VoidCallback onTap) {
    return Column(children: [
      SizedBox(
        width: double.infinity, // Makes the button full width
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Colors.deepPurple,
          ),
          child: Text(
            answerText,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
    ]);
  }
}
