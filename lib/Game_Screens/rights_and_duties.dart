import 'package:aavishkaar/Game_Screens/coins.dart';
import 'package:flutter/material.dart';

class RightsOrDutiesGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RightsOrDutiesPage();
  }
}

class RightsOrDutiesPage extends StatefulWidget {
  @override
  _RightsOrDutiesPageState createState() => _RightsOrDutiesPageState();
}

class _RightsOrDutiesPageState extends State<RightsOrDutiesPage> {
  int score = 0; // Player's score
  int currentIndex = 0; // Current question index

  // Questions and answers
  final List<Question> questions =  [
  Question(
    image: "https://etvbharatimages.akamaized.net/etvbharat/prod-images/320-214-7747853-407-7747853-1593017612890.jpg",
    text: 'the President of India declareing a national emergency when required is a?',
    correctAnswer: 'Duty',
    explanation: 'The President is constitutionally obligated to declare a national emergency under Article 352 in specific situations.',
  ),
  Question(
    image: "https://m.economictimes.com/thumb/msid-109400276,width-1600,height-900,resizemode-4,imgsize-39746/lok-sabha-election-2024.jpg",
    text: ' citizen haveing the right to vote in Lok Sabha elections is a?',
    correctAnswer: 'Right',
    explanation: 'Voting is a constitutional right provided to eligible citizens of India.',
  ),
  Question(
    image: "https://pwonlyias.com/wp-content/uploads/2023/12/Role-of-Governors-1568x882.webp",
    text: ' the Governor of a state reserve certain bills for the President’s consideration is a?',
    correctAnswer: 'Duty',
    explanation: 'It is the Governor’s duty under Article 200 to reserve specific bills for the President’s decision.',
  ),
  Question(
    image: "https://i0.wp.com/lexforti.com/legal-news/wp-content/uploads/2021/04/constitutional-remedies.jpg?fit=1280%2C675&ssl=1",
    text: 'Is the right to seek constitutional remedies guaranteed to all citizens?',
    correctAnswer: 'Right',
    explanation: 'Article 32 grants citizens the right to seek constitutional remedies for the enforcement of fundamental rights.',
  ),
  Question(
    image: "https://akm-img-a-in.tosshub.com/businesstoday/images/story/202401/659e5f48c3b7c-union-finance-minister-nirmala-sitharaman-with-her-team-ahead-of-the-presentation-of-the-union-budge-101135412-16x9.jpg?size=948:533",
    text: 'Is presenting the annual budget a responsibility of the Union Finance Minister?',
    correctAnswer: 'Duty',
    explanation: 'The Finance Minister is constitutionally required to present the annual budget as part of their duties.',
  ),
  Question(
    image: "https://static.wixstatic.com/media/f721f3_f91202374ded4fe99254b3636c2c502f~mv2.png/v1/fill/w_1000,h_709,al_c,q_90,usm_0.66_1.00_0.01/f721f3_f91202374ded4fe99254b3636c2c502f~mv2.png",
    text: 'Do citizens have the right to trade and commerce across India freely?',
    correctAnswer: 'Right',
    explanation: 'Article 301 guarantees freedom of trade and commerce throughout the territory of India.',
  ),
  Question(
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlLvUn9f-zHTfjlnVupEt2KE0cbisod_izqA&s",
    text: 'Is summoning a session of Parliament a responsibility of the President?',
    correctAnswer: 'Duty',
    explanation: 'Under Article 85, it is the President’s duty to summon sessions of Parliament at regular intervals.',
  ),
  Question(
    image: "https://www.nextias.com/blog/wp-content/uploads/2024/02/Right-to-Equality.jpg",
    text: 'Is equality before the law a fundamental right guaranteed to all?',
    correctAnswer: 'Right',
    explanation: 'Article 14 ensures equality before the law and equal protection of laws for all individuals.',
  ),
  Question(
    image: "https://upload.wikimedia.org/wikipedia/commons/3/39/CAG_Official_logo.png",
    text: 'auditing government expenditures of the Comptroller and Auditor General is a?',
    correctAnswer: 'Duty',
    explanation: 'The Comptroller and Auditor General has the constitutional duty to audit public accounts under Article 148.',
  ),
  Question(
    image: 'null',
    text: ' citizens haveing the right to form associations and unions is a?',
    correctAnswer: 'Right',
    explanation: 'Article 19 guarantees citizens the right to form associations and unions freely.',
  ),
  Question(
    image: 'null',
    text: ' the Vice President act as President when the office is vacant is a?',
    correctAnswer: 'Duty',
    explanation: 'Under Article 65, it is the Vice President’s duty to act as President during a vacancy.',
  ),
  Question(
    image:'null',
    text: 'citizens are being protected against tried for the same offense twice is a?',
    correctAnswer: 'Right',
    explanation: 'Article 20 provides protection against double jeopardy, ensuring no one is tried twice for the same offense.',
  ),
  Question(
    image: 'null',
    text: 'the Prime Minister updating the President about Cabinet decisions is a?',
    correctAnswer: 'Duty',
    explanation: 'Under Article 78, it is the Prime Minister’s constitutional duty to inform the President of all Cabinet decisions.',
  ),
  Question(
    image: 'null',
    text: 'citizens haveing the right to reside and settle in any part of India is a?',
    correctAnswer: 'Right',
    explanation: 'Article 19 guarantees the right to reside and settle freely in any part of the Indian territory.',
  ),
  Question(
    image: 'null',
    text: 'Is advising the Governor on state matters a responsibility of the Chief Minister?',
    correctAnswer: 'Duty',
    explanation: 'Article 167 mandates the Chief Minister to provide advice to the Governor on state administration.',
  ),
  Question(
    image: 'null',
    text: 'Is the right to life and personal liberty protected by the Constitution a?',
    correctAnswer: 'Right',
    explanation: 'Article 21 guarantees the right to life and personal liberty to all individuals.',
  ),
  Question(
    image: 'null',
    text: ' the Attorney General  representing the Government of India in legal matters is a?',
    correctAnswer: 'Duty',
    explanation: 'Under Article 76, the Attorney General is responsible for representing the government in legal matters.',
  ),
  Question(
    image: 'null',
    text: 'citizens freely practice and propagate their religion is a?',
    correctAnswer: 'Right',
    explanation: 'Article 25 ensures freedom of religion, including the right to practice and propagate it.',
  ),
  Question(
    image: 'null',
    text: " maintaining order in the Lok Sabha the Speaker’s a?",
    correctAnswer: 'Duty',
    explanation: 'The Speaker’s primary duty is to maintain order and decorum during Lok Sabha sessions.',
  ),
  Question(
    image: 'null',
    text: 'citizens directly approaching the Supreme Court for enforcing is a?',
    correctAnswer: 'Right',
    explanation: 'Article 32 allows citizens to approach the Supreme Court for enforcement of their fundamental rights.',
  ),
  Question(
    image: 'null',
    text: 'the Governor haveing the authority to promulgate ordinances when the legislature is not in session is a?',
    correctAnswer: 'Duty',
    explanation: 'Under Article 213, the Governor is empowered to promulgate ordinances during a legislative recess.',
  ),
  Question(
    image: 'null',
    text: 'the right to constitutional remedies considered a cornerstone of Indian democracy is a?',
    correctAnswer: 'Right',
    explanation: 'Article 32 provides citizens the right to move the Supreme Court for enforcing fundamental rights.',
  ),
  Question(
    image: 'null',
    text: 'Is presenting a no-confidence motion in the Parliament a fundamental responsibility of the opposition?',
    correctAnswer: 'Duty',
    explanation: 'The opposition has a parliamentary duty to hold the government accountable through motions like no-confidence.',
  ),
  Question(
    image: 'null',
    text: 'Do citizens have the right to safeguard their cultural heritage?',
    correctAnswer: 'Right',
    explanation: 'Article 29 ensures the protection of cultural and educational rights for minorities and citizens.',
  ),
  Question(
    image: 'null',
    text: 'Does the President appoint the Prime Minister based on the majority in Lok Sabha?',
    correctAnswer: 'Duty',
    explanation: 'Under Article 75, the President has the duty to appoint the Prime Minister who commands a majority in Lok Sabha.',
  ),
  Question(
    image: 'null',
    text: 'citizens claim protection against discrimination on grounds of religion, race, caste, or gender is a?',
    correctAnswer: 'Right',
    explanation: 'Article 15 prohibits discrimination on these grounds, ensuring equality for all citizens.',
  ),
  Question(
    image: 'null',
    text: ' the Chief Justice of India to administer the oath of office to the President is a?',
    correctAnswer: 'Duty',
    explanation: 'The Chief Justice administers the President’s oath as per Article 60 of the Constitution.',
  ),
  Question(
    image: 'null',
    text: ' citizens  educating  children of age 6 to 14 is a?',
    correctAnswer: 'Right',
    explanation: 'Article 21A guarantees free and compulsory education for children in this age group.',
  ),
  Question(
    image: 'null',
    text: ' maintaining the independence of the judiciary by a judge is a?',
    correctAnswer: 'Duty',
    explanation: 'Judges are constitutionally bound to uphold judicial independence and impartiality.',
  ),
  Question(
    image: 'null',
    text: 'ensuring the security of India’s borders is a right or duty of the Union Government?',
    correctAnswer: 'Duty',
    explanation: 'The Union Government has the duty to protect the sovereignty and territorial integrity of India.',
  ),
  Question(
    image: 'null',
    text: ' the Comptroller and Auditor General auditing all expenditure of the Union and State Governments is a?',
    correctAnswer: 'Duty',
    explanation: 'Under Article 149, the CAG is tasked with auditing public accounts and ensuring financial accountability.',
  ),
  Question(
    image: 'null',
    text: 'Do citizens have the right to move freely throughout the territory of India?',
    correctAnswer: 'Right',
    explanation: 'Article 19 guarantees the right to freedom of movement within India to all citizens.',
  ),
  Question(
    image: 'null',
    text: 'the Vice President required to act as the Rajya Sabha Chairperson is a?',
    correctAnswer: 'Duty',
    explanation: 'Under Article 64, the Vice President serves as the ex-officio Chairperson of the Rajya Sabha.',
  ),
  Question(
    image: 'null',
    text: 'Do citizens have the right to freely practice their religion?',
    correctAnswer: 'Right',
    explanation: 'Article 25 ensures the freedom of religion for all individuals in India.',
  ),
  Question(
    image: 'null',
    text: 'submitting a report on the functioning of Union Territories to the President a duty of the Administrator is a?',
    correctAnswer: 'Duty',
    explanation: 'The Administrator of a Union Territory is constitutionally required to report to the President.',
  ),
  Question(
    image: 'null',
    text: 'citizens demanding protection of their personal data under the Constitution is a?',
    correctAnswer: 'Right',
    explanation: 'The right to privacy, derived from Article 21, includes the protection of personal data.',
  ),
  Question(
    image: 'null',
    text: ' the Prime Minister required to advise the President on key decisions is a?',
    correctAnswer: 'Duty',
    explanation: 'Under Article 74, the Prime Minister has a constitutional duty to advise the President.',
  ),
  Question(
    image: 'null',
    text: 'Do citizens have the right to preserve their language and culture?',
    correctAnswer: 'Right',
    explanation: 'Article 29 protects the rights of citizens to conserve their distinct language, script, or culture.',
  ),
  Question(
    image: 'null',
    text: ' the Governor required to appoint the Chief Minister of the majority party in the State Assembly is a?',
    correctAnswer: 'Duty',
    explanation: 'Under Article 164, it is the Governor’s duty to appoint the Chief Minister based on legislative majority.',
  ),
  Question(
    image: 'null',
    text: ' citizens seeking equality of opportunity in public employment is a?',
    correctAnswer: 'Right',
    explanation: 'Article 16 guarantees equality of opportunity for all citizens in public employment.',
  ),
  Question(
    image: 'null',
    text: 'the Election Commission responsible for conducting free and fair elections is a?',
    correctAnswer: 'Duty',
    explanation: 'The Election Commission has the constitutional duty to ensure free and fair elections under Article 324.',
  ),
  Question(
    image: 'null',
    text: 'citizens haveing the right to seek information from public authorities is a?',
    correctAnswer: 'Right',
    explanation: 'The Right to Information Act is derived from Article 19, ensuring transparency and accountability.',
  ),
  Question(
    image: 'null',
    text: ' the President’s duty to dissolve the Lok Sabha on the advice of the Prime Minister is a?',
    correctAnswer: 'Duty',
    explanation: 'Under Article 85, the President dissolves the Lok Sabha upon the Prime Minister’s recommendation.',
  ),
  Question(
    image: 'null',
    text: 'Do citizens have the right to approach the judiciary for violations of their rights?',
    correctAnswer: 'Right',
    explanation: 'Article 32 and Article 226 empower citizens to approach courts for the enforcement of rights.',
  ),
  Question(
    image: 'null',
    text: 'the Chief Minister required to communicate decisions of the State Government to the Governor is a?',
    correctAnswer: 'Duty',
    explanation: 'Under Article 167, the Chief Minister must keep the Governor informed about state administration.',
  ),
  Question(
    image: 'null',
    text: 'Do citizens have the right to protection from forced labor?',
    correctAnswer: 'Right',
    explanation: 'Article 23 prohibits trafficking and forced labor, ensuring protection for all citizens.',
  ),
  Question(
    image: 'null',
    text: ' the Supreme Court’s responsibility to interpret the Constitution is a?',
    correctAnswer: 'Duty',
    explanation: 'The Supreme Court has the duty to interpret and uphold the Constitution as the highest judicial body.',
  ),
  Question(
    image: 'null',
    text: 'Do citizens have the right to equality in matters of public employment?',
    correctAnswer: 'Right',
    explanation: 'Article 16 ensures non-discrimination and equality in public employment opportunities.',
  ),
  Question(
    image: 'null',
    text: "the duty of the Armed Forces to protect the territorial integrity of India is a?",
    correctAnswer: 'Duty',
    explanation: 'The Armed Forces have the constitutional duty to defend India’s sovereignty and integrity.',
  ),
  Question(
    image: 'null',
    text: "Do citizens have the right to protection against arrest and detention in certain cases?",
    correctAnswer: 'Right',
    explanation: 'Article 22 provides protections against arbitrary arrest and preventive detention.',
  ),
];





  void _checkAnswer(String answer) {
    final question = questions[currentIndex];

    if (answer == question.correctAnswer) {
      setState(() {
        score += 10; // Add score for correct answer
      });
    }

    // Show explanation dialog
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(answer == question.correctAnswer ? "Correct!" : "Wrong!"),
        content: Text(question.explanation),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close explanation dialog
              _nextQuestion();
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }

  void _nextQuestion() {
    setState(() {
      if (currentIndex < questions.length - 1) {
        currentIndex++;
      } else {
        _showGameOver();
      }
    });
  }

  ScoreManager s = ScoreManager();
  void _showGameOver() {
    s.addScore(score);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Game Over"),
        content: Text("Your final score is $score"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close game over dialog
              Navigator.pop(context); // Go back to previous screen
            },
            child: Text("Play Again"),
          ),
        ],
      ),
    );
  }

  void _restartGame() {
    setState(() {
      score = 0;
      currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text("Rights or Duties"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Score display
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Score: $score",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // Image display
          Expanded(
            child: Image.network(
              question.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          // Question text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              question.text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),

          // Answer buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _checkAnswer('Right'),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                ),
                child: Text("Right"),
              ),
              ElevatedButton(
                onPressed: () => _checkAnswer('Duty'),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                ),
                child: Text("Duty"),
              ),
            ],
          ),

          SizedBox(height: 16),
        ],
      ),
    );
  }
}

// Question model
class Question {
  final String image; // URL of the image
  final String text; // Question text
  final String correctAnswer; // Correct answer ("Right" or "Duty")
  final String explanation; // Explanation text

  Question({
    required this.image,
    required this.text,
    required this.correctAnswer,
    required this.explanation,
  });
}
