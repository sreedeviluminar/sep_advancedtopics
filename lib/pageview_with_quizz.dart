import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  PageController _pageController = PageController();
  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Berlin', 'Paris', 'Madrid', 'Rome'],
      'correctAnswer': 'Paris',
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'options': ['Mars', 'Jupiter', 'Venus', 'Earth'],
      'correctAnswer': 'Mars',
    },
    // Add more questions as needed
  ];

  late List<String?> userAnswers;

  @override
  void initState() {
    super.initState();
    userAnswers = List.filled(questions.length, null);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return buildQuizPage(index);
      },
    );
  }

  Widget buildQuizPage(int index) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questions[index]['question'],
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 20.0),
          Column(
            children: List.generate(
              questions[index]['options'].length,
                  (optionIndex) {
                String option = questions[index]['options'][optionIndex];
                return InkWell(
                  onTap: () {
                    setState(() {
                      userAnswers[index] = option;
                    });
                  },
                  child: RadioListTile<String>(
                    title: Text(option),
                    value: option,
                    groupValue: userAnswers[index],
                    onChanged: (value) {
                      setState(() {
                        userAnswers[index] = value;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Move to the next question
              if (index < questions.length - 1) {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              } else {
                // Display quiz result
                showQuizResult();
              }
            },
            child: Text(index < questions.length - 1 ? 'Next' : 'Submit'),
          ),
        ],
      ),
    );
  }

  void showQuizResult() {
    int correctAnswers = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i]['correctAnswer']) {
        correctAnswers++;
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Result'),
          content: Text('You got $correctAnswers out of ${questions.length} questions correct!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
