import 'package:flutter/material.dart';
import 'package:todo_hive/Screens/result_screen.dart';

class QuizzScreen extends StatefulWidget {
  final String name;
  const QuizzScreen({super.key, required this.name});

  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  List<Map<String, Object>> questions = [
    {
      'question': 'Who has won the most Ballon d\'Or awards?',
      'answers': [
        'Cristiano Ronaldo',
        'Lionel Messi',
        'Zinedine Zidane',
      ],
      'correctAnswer': 'Lionel Messi',
    },
    {
      'question': 'Which country has won the most FIFA World Cups?',
      'answers': [
        'Germany',
        'Brazil',
        'Argentina',
      ],
      'correctAnswer': 'Brazil',
    },
    {
      'question': 'Which player is known for the "Hand of God" goal?',
      'answers': [
        'Diego Maradona',
        'Pele',
        'Johan Cruyff',
      ],
      'correctAnswer': 'Diego Maradona',
    },
    {
      'question': 'Which club has won the most UEFA Champions League titles?',
      'answers': [
        'FC Barcelona',
        'Real Madrid',
        'AC Milan',
      ],
      'correctAnswer': 'Real Madrid',
    },
    {
      'question': 'In which country is the football club Bayern Munich based?',
      'answers': [
        'France',
        'Germany',
        'Spain',
      ],
      'correctAnswer': 'Germany',
    },
    {
      'question':
          'Who holds the record for most goals scored in a single Premier League season?',
      'answers': [
        'Mohamed Salah',
        'Harry Kane',
        'Alan Shearer',
      ],
      'correctAnswer': 'Mohamed Salah',
    },
    {
      'question': 'Which country hosted the 2018 FIFA World Cup?',
      'answers': [
        'Russia',
        'Qatar',
        'Brazil',
      ],
      'correctAnswer': 'Russia',
    },
    {
      'question': 'Which player is nicknamed "The Pharaoh"?',
      'answers': [
        'Sergio Ramos',
        'Mohamed Salah',
        'Neymar Jr.',
      ],
      'correctAnswer': 'Mohamed Salah',
    },
    {
      'question': 'What is the official name of Manchester United\'s stadium?',
      'answers': [
        'Stamford Bridge',
        'Old Trafford',
        'Anfield',
      ],
      'correctAnswer': 'Old Trafford',
    },
    {
      'question': 'Which country won the UEFA Euro 2020 tournament?',
      'answers': [
        'Italy',
        'England',
        'France',
      ],
      'correctAnswer': 'Italy',
    },
    {
      'question':
          'Who is the all-time top scorer for the Brazilian national team?',
      'answers': [
        'Neymar Jr.',
        'Ronaldo Nazário',
        'Pele',
      ],
      'correctAnswer': 'Pele',
    },
    {
      'question': 'Which team is known as "The Blues"?',
      'answers': [
        'Chelsea FC',
        'Manchester City',
        'Everton FC',
      ],
      'correctAnswer': 'Chelsea FC',
    },
    {
      'question':
          'Which player scored a hat-trick in the 1966 World Cup final?',
      'answers': [
        'Bobby Charlton',
        'Geoff Hurst',
        'Gerd Müller',
      ],
      'correctAnswer': 'Geoff Hurst',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QUIZ',
          style: TextStyle(color: Color.fromARGB(255, 249, 219, 26)),
        ),
        backgroundColor: const Color.fromARGB(255, 1, 12, 40),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/quiz.png',
                height: 150,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 1, 35, 121),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${_currentQuestionIndex + 1}/${questions.length}',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 170, 170, 170)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      questions[_currentQuestionIndex]['question'] as String,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 237, 237, 237)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (questions[_currentQuestionIndex]['answers']
                              as List<String>)
                          .map((answer) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _answerQuestion(answer),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                              ),
                              child: Text(
                                answer,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _nextQuestion,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 210, 182, 25),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              _currentQuestionIndex == questions.length - 1
                                  ? 'NEXT'
                                  : 'NEXT',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _answerQuestion(String answer) {
    if (answer == questions[_currentQuestionIndex]['correctAnswer']) {
      setState(() {
        _score++;
      });
    }

    if (_currentQuestionIndex == questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(score: _score, name: widget.name),
        ),
      );
    } else {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _nextQuestion() {
    if (_currentQuestionIndex == questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(score: _score, name: widget.name),
        ),
      );
    } else {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }
}
