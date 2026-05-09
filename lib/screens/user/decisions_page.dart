import 'package:flutter/material.dart';
//import '../../widgets/bottom_navbar.dart';
import '../../widgets/question_card.dart'; 
import '../../models/question_data.dart'; 

class FoodDecisionMaker extends StatefulWidget {
  const FoodDecisionMaker({super.key});

  @override
  State<FoodDecisionMaker> createState() => _FoodDecisionMakerState();
}

class _FoodDecisionMakerState extends State<FoodDecisionMaker> {
  int _currentIndex = 0;
  String? _question2Answer; //track Q2 answer for Q3's dynamic options

  Question get _currentQuestion => kQuestions[_currentIndex];

  // Resolve options — handles dynamic Q3
  List<String> get _currentOptions {
    if (_currentQuestion.type == "dynamic_single_choice") {
      return _currentQuestion.dynamicOptions?[_question2Answer] ?? [];
    }
    return _currentQuestion.options ?? [];
  }

  void _onChoiceTap(String choice) {
    // Save Q2 answer for Q3 dynamic options
    if (_currentIndex == 1) {
      _question2Answer = choice;
    }

    if (_currentIndex < kQuestions.length - 1) {
      setState(() => _currentIndex++);
    } else {
      // TODO: calculate result and navigate
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: QuestionScreen(
        questionText: _currentQuestion.question,
        currentIndex: _currentIndex + 1,
        total: kQuestions.length,
        choices: _currentOptions,
        onChoiceTap: _onChoiceTap,
        onBack: () {
          if (_currentIndex > 0) {
            setState(() => _currentIndex--);
          } else {
            Navigator.pop(context);
          }
        },
        isTiebreaker: _currentQuestion.questionNumber == 6,
      ),
    );
  }
}