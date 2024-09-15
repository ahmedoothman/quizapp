import 'package:flutter/material.dart';
import 'package:quizapp/screens/category_screen.dart';
import 'package:quizapp/screens/home_page.dart';

class ScoreScreen extends StatelessWidget {
  final String userName;
  final int score;
  final int totalQuestions;
  const ScoreScreen(
      {super.key,
      required this.userName,
      required this.score,
      required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Congratulations Message
            Text(
              'Congratulations, $userName!',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Score Display
            const Text(
              'You finished the quiz, your score is:',
              style: TextStyle(fontSize: 22, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              '$score / $totalQuestions', // Use the score parameter here
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent,
              ),
            ),
            const SizedBox(height: 40),

            // Play Again Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => CategoryScreen(
                      userName: userName, // Pass the userName parameter
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              icon: const Icon(Icons.refresh, color: Colors.deepPurple),
              label: const Text(
                "Play Again",
                style: TextStyle(color: Colors.deepPurple, fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),

            // Log Out Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const MyHomePage(title: 'Flutter Demo Home Page'),
                  ),
                  (Route<dynamic> route) => false, // Remove all previous routes
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              icon: const Icon(Icons.exit_to_app, color: Colors.white),
              label: const Text(
                "Log Out",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
