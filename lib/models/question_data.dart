class Question {
  final int questionNumber;
  final String question;
  final String type;
  final List<String>? options;
  final String? dependsOn;
  final Map<String, List<String>>? dynamicOptions;
  final String purpose;

  const Question({
    required this.questionNumber,
    required this.question,
    required this.type,
    this.options,
    this.dependsOn,
    this.dynamicOptions,
    required this.purpose,
  });
}

class Choice {
  final String label;
  final Map<String, int> points;

  const Choice({required this.label, required this.points});
}

// ── Static question data (swap with Firestore fetch later) ────────────────────

const List<Question> kQuestions = [
  Question(
    questionNumber: 1,
    question: "What's your budget?",
    type: "single_choice",
    options: [
      "Below ₱80",
      "₱81–₱150",
      "₱151–₱300",
      "₱300+",
    ],
    purpose: "Filters restaurants by budgetTags / averageCost",
  ),
  Question(
    questionNumber: 2,
    question: "What are you in the mood for?",
    type: "single_choice",
    options: [
      "Full Meal",
      "Grilled / Seafood",
      "Desserts / Snacks",
      "Premium / Group Dining",
      "Not Sure",
    ],
    purpose: "Matches broad foodCategory first",
  ),
  Question(
    questionNumber: 3,
    question: "What specifically are you craving?",
    type: "dynamic_single_choice",
    dependsOn: "Question 2",
    dynamicOptions: {
      "Full Meal":               ["Karinderya", "Silog", "Ilonggo"],
      "Grilled / Seafood":       ["Ihaw", "Seafood"],
      "Desserts / Snacks":       ["Pastry", "Street Food"],
      "Premium / Group Dining":  ["Samgyup"],
      "Not Sure":                ["Savory", "Sweet", "Grilled"],
    },
    purpose: "Matches exact foodType",
  ),
  Question(
    questionNumber: 4,
    question: "Where do you want to eat?",
    type: "single_choice",
    options: [
      "Hollywood St.",
      "Seawall",
      "Igtuba",
      "Mat-y",
      "Anywhere",
    ],
    purpose: "Filters by preferred location",
  ),
  Question(
    questionNumber: 5,
    question: "What are you looking for right now?",
    type: "single_choice",
    options: [
      "Breakfast",
      "Lunch",
      "Merienda",
      "Dinner",
    ],
    purpose: "Matches mealTags + checks openTime/closeTime",
  ),
  Question(
    questionNumber: 6,
    question: "What matters most to you?",
    type: "single_choice",
    options: [
      "Cheapest Option",
      "Best Food Match",
    ],
    purpose: "Used only for tie-breakers",
  ),
];