import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Quiz App',

      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Sample questions and answers
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Parisondon', 'Madrid'],
      'correctAnswer': 'Paris',
    },
    {
      'question': 'Who wrote "To Kill a Mockingbird"?',
      'options': ['Harper Lee', 'Jane Austen', 'Mark Twain', 'Charles Dickens'],
      'correctAnswer': 'Harper Lee',
    },
    // Add more questions here
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;

  void _answerQuestion(String selectedAnswer) {
    String correctAnswer = _questions[_currentQuestionIndex]['correctAnswer'];
    if (selectedAnswer == correctAnswer) {
      _score++;
    }
    setState(() {
      _currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        title: Text('Quiz App',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: _currentQuestionIndex < _questions.length
          ? Center(
            child: QuizQuestion(
                    question: _questions[_currentQuestionIndex]['question'],
                    options: _questions[_currentQuestionIndex]['options'],
                    onAnswerSelected: _answerQuestion,
                  ),
          )
          : QuizResult(score: _score, totalQuestions: _questions.length),
    );
  }
}

class QuizQuestion extends StatelessWidget {
  final String question;
  final List<String> options;
  final Function(String) onAnswerSelected;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        Column(
          children: options.map((option) {
            return ElevatedButton(
              onPressed: () => onAnswerSelected(option),
              child: Text(option),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class QuizResult extends StatelessWidget {
  final int score;
  final int totalQuestions;

  QuizResult({required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quiz Completed!',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Your Score: $score out of $totalQuestions',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
