import 'package:aavishkaar/Game_Screens/coins.dart';
import 'package:aavishkaar/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:logger/logger.dart';

class Database {
  static List<Question> getQuestions() {
    return [
    Question(
        text:"There must always be a President of India.",
        correctAnswer:true,
        imageUrl:"https://i.imghippo.com/files/HcMK6384JK.jpg ",
    ),
    Question(
        text:"The President of India can exercise executive power only through appointed officers.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"The President is the supreme commander of the Union's Defence Forces, with unrestricted power.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"Parliament can assign functions to entities other than the President through new laws.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"The President of India is elected by both Houses of Parliament and State Legislative Assemblies.",
        correctAnswer:false,
        imageUrl:"https://i.imghippo.com/files/Vskv8363zNY.jpg",
    ),
    Question(
        text:"The National Capital Territory of Delhi and the Union Territory of Puducherry are considered 'States' for the presidential election",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"Each state must have an equal number of votes in the presidential election process.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"The President is elected by a proportional representation system using a single transferable vote.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"The President serves a term of six years from the date they take office",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"If the President resigns, they must write to the Vice-President.",
        correctAnswer:true,
        imageUrl:"https://i.imghippo.com/files/TtFn7337lAY.jpg",
    ),
    Question(
        text:"A President of India cannot run for re-election after serving a term.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"Until new census data is available after 2026, population data for presidential election representation is based on the 1971 census.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"To be eligible for election as President, a person must be at least 30 years old.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"A person holding a paid position under the Government of India is eligible to be elected President.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"Being the Vice-President, Governor, or a Minister does not count as holding an office of profit for the purpose of Presidential eligibility.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"The President cannot be a member of Parliament or a State Legislature during their term.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"If a member of Parliament is elected President, they must resign from their seat before taking the oath.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"The President’s salary and allowances can be reduced while they are in office.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"The President must take an oath before assuming office, administered by the Prime Minister of India.",
        correctAnswer:false,
        imageUrl:"https://i.imghippo.com/files/EDF8799R.jpeg",
    ),
    Question(
        text:"The President’s oath includes a promise to protect the Constitution and laws of India.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"Either House of Parliament can bring impeachment charges against the President.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"Impeachment charges require a written notice signed by at least half of the members of the House.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"To pass impeachment charges, at least two-thirds of the total members of the House must approve the resolution..",
        correctAnswer:true,
        imageUrl:"https://i.imghippo.com/files/thxP4053y.jpeg",
    ),
    Question(
        text:"If the investigating House upholds the charges, the President is removed immediately.",
        correctAnswer:true,
        imageUrl:"https://i.imghippo.com/files/sNP5973GjQ.jpg",
    ),
    Question(
        text:"An election to fill a vacancy caused by the end of the President's term must be completed before the term ends.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"If the President's office becomes vacant due to death, resignation, or removal, a new election must be held within six months.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"The person elected to fill a presidential vacancy will serve a full five-year term starting from their date of office.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"There is no provision for a Vice-President in India.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"The Vice-President is the Chairman of the Council of States by virtue of their office.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"If the Vice-President is acting as President, they continue to serve as Chairman of the Council of States.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"While acting as Chairman of the Council of States, the Vice-President can hold another paid office.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"If the President cannot perform their duties due to absence or illness, the Vice-President will take over until the President returns.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"While acting as President, the Vice-President does not receive the salary or allowances set for the President.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"The Vice-President is elected by members of both Houses of Parliament through a secret ballot and proportional representation.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"The Vice-President can continue to be a member of Parliament after assuming office.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"To be eligible for election as Vice-President, a person must be at least 40 years old.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"A paid government employee can be elected Vice-President of India.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"Being the President or a Minister does not count as holding an office of profit when considering Vice-Presidential eligibility.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"The Vice-President serves a five-year term starting from when they assume office.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"The Vice-President can resign by submitting a letter to the President.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"The Vice-President can be removed by a simple majority vote in the House of the People alone.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"If a new Vice-President is not elected by the end of the current term, the outgoing Vice-President remains in office until a successor takes over.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"If a new Vice-President is not elected by the end of the current term, the outgoing Vice-President remains in office until a successor takes over.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"If the Vice-President’s term is ending, an election must be held before their term expires.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"A Vice-President elected to fill a casual vacancy serves the remainder of the previous term.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"The Vice-President takes an oath in front of the Prime Minister.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"The Vice-President’s oath includes a promise to remain loyal to the Constitution of India.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"Parliament can make laws to handle unforeseen situations where the President’s functions need to be performed.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"The Supreme Court handles disputes related to the election of the President or Vice-President, and its decision is final.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"If the Supreme Court declares a Presidential election invalid, the actions taken by that President remain valid until the decision.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"A vacancy in the electoral college can be a reason to challenge the election of a President or Vice-President.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"The term 'State' in this section includes the State of Jammu and Kashmir.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"Each State in India must have a separate Governor.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"Every State is required to have a Governor.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"The Governor of a State exercises executive power either directly or through subordinate officers.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"The Governor can override functions assigned to other authorities by existing laws.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"State Legislatures cannot assign new functions to authorities under the Governor.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"The Governor of a State is appointed by the Prime Minister.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"The appointment of a Governor is done through an official document issued by the President.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"The Governor serves at the pleasure of the President.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"A Governor cannot resign before completing their five-year term.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"A Governor continues in office even after their term ends until a successor takes over.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"A person must be at least 30 years old to be eligible for appointment as Governor.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"Only Indian citizens can be appointed as Governors.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"The Governor can be a member of Parliament or any State Legislature while serving as Governor.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"If a person holding a legislative position is appointed as Governor, they automatically lose their legislative seat upon assuming the role.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"The Governor cannot hold any other profitable position during their tenure.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"If one person is appointed Governor of multiple States, they receive a combined salary from the States as determined by the President.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"The Governor's salary and allowances can be reduced during their term.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"The Governor takes their oath of office in the presence of the Chief Justice of the Supreme Court.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"The Governor's oath includes a promise to preserve, protect, and defend the Constitution.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"The President can make arrangements for the Governor's functions in scenarios not covered by the Constitution.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"The Governor has the authority to grant pardons or commute sentences for individuals convicted under State laws.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"The State's executive power is restricted to matters under the exclusive purview of the State Legislature.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"The Governor always acts on the advice of the Council of Ministers, without exceptions.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"The Governor's decision regarding whether they should act at their discretion is final and cannot be challenged in court.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"Courts can inquire into the advice provided by Ministers to the Governor.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"The Governor appoints the Chief Minister and other Ministers on the advice of the Chief Minister.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"Every State must have a Minister specifically in charge of tribal welfare, regardless of its demographic composition.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"The total number of Ministers in a State cannot exceed 15% of the total number of Legislative Assembly members, with a minimum of 12 Ministers.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"A member disqualified under the Tenth Schedule can still be appointed as a Minister.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"The Council of Ministers is collectively responsible to the State's Legislative Assembly.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"A Minister ceases to hold office if they are not a member of the State Legislature for six consecutive months.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"The salaries and allowances of Ministers are determined by the State Legislature, and until then, they follow the Second Schedule.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"A member disqualified under the Tenth Schedule can still be appointed as a Minister.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"The Advocate-General is appointed by the Chief Minister of the State.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"To be eligible for appointment as Advocate-General, a person must be qualified to be a Judge of the High Court.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"The Advocate-General serves at the pleasure of the Chief Justice of the High Court.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"The salary of the Advocate-General is determined by the Governor.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"All executive actions of the State Government are carried out in the name of the Chief Minister.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"Orders executed in the name of the Governor can be challenged in court if they are not properly authenticated.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"The Governor is responsible for creating rules to efficiently conduct the State Government's business and allocating responsibilities among Ministers.",
        correctAnswer:true,
        imageUrl:"https://i.imghippo.com/files/akXg9697HMk.jpg",
    ), 
    Question(
        text:"The Governor must always consult the Chief Minister before making rules for the conduct of State business.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"The Chief Minister must inform the Governor about all decisions made by the Council of Ministers regarding the state's administration.",
        correctAnswer:true,
        imageUrl:null,
    ), 
    Question(
        text:"The Chief Minister is not obligated to provide information to the Governor if it pertains to proposed legislation.",
        correctAnswer:false,
        imageUrl:null,
    ), 
    Question(
        text:"If a decision by a Minister has not been discussed by the Council of Ministers, the Chief Minister must submit it for the Council's consideration if the Governor requests.",
        correctAnswer:true,
        imageUrl:"https://i.imghippo.com/files/Js9482PA.jpg",
    ), 
    Question(
        text:"Every State Legislature must include both a Legislative Council and a Legislative Assembly.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"The Legislative Council is the Upper House of the State Legislature in States that have two Houses.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"In States with a single Legislature, it is called the Legislative Assembly.",
        correctAnswer:true,
        imageUrl:null,
    ),
    Question(
        text:"The Parliament of India can create or abolish a Legislative Council in a State without the consent of the State Legislature.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"A resolution to create or abolish a Legislative Council must be passed by a simple majority of the Legislative Assembly members present and voting.",
        correctAnswer:false,
        imageUrl:null,
    ),
    Question(
        text:"Laws regarding the creation or abolition of Legislative Councils must include necessary amendments to the Constitution.",
        correctAnswer:true,
        imageUrl:null,
    ),
];
  }
}


class TrueFalseGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TFScreen();
  }
}

class TFScreen extends StatefulWidget {
  @override
  _TFScreenState createState() => _TFScreenState();
}

class _TFScreenState extends State<TFScreen> {
  final Logger _logger = Logger();
  List<SwipeItem> _swipeItems = [];
  late MatchEngine _matchEngine;
  int _score = 0;
  Color _backgroundColor = Colors.blue; // Default color
  bool _isAnswerCorrect = true; // Flag to indicate whether the answer is correct

  @override
  void initState() {
    super.initState();
    _initializeQuestions();
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  Future<void> _initializeQuestions() async {
    List<Question> questions = Database.getQuestions();
    for (var question in questions) {
      _swipeItems.add(SwipeItem(
        content: question,
        likeAction: () async => await _onSwipe(true, question),
        nopeAction: () async => await _onSwipe(false, question),
        //onSlideUpdate: (region) => _logger.d("Region: $region"),
      ));
    }
  }

  Future<void> _onSwipe(bool userAnswer, Question question) async {
    setState(() {
      _isAnswerCorrect = userAnswer == question.correctAnswer;
      _backgroundColor = _isAnswerCorrect ? Colors.green : Colors.red; // Change background color
      if (_isAnswerCorrect) {
        _score++;
      }
      // After 2 seconds, reset the background color
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _backgroundColor = Colors.blue;
        });
      });
    });
  }

  ScoreManager s = ScoreManager();

  Future<void> _showFinalScore() async {
    void finishGame() {
      s.addScore(_score);
  Navigator.popUntil(context, (route) => route.isFirst); 
  }
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Game Over'),
      content: Text('Points gained today $_score'),
      actions: [
        TextButton(
          onPressed: () {
            finishGame();
          },
          child: Text('Home'),
        ),
      ],
    ),
  );
}



  void _resetGame() {
    setState(() {
      _score = 0;
      _swipeItems.clear();
      _initializeQuestions();
      _matchEngine = MatchEngine(swipeItems: _swipeItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('True or False Game'),
        centerTitle: true,
      ),
      body: Container(
        color: _backgroundColor, // Background color changes based on answer
        child: Column(
          children: [
            Expanded(
              child: SwipeCards(
                matchEngine: _matchEngine,
                itemBuilder: (BuildContext context, int index) {
                  final question = _swipeItems[index].content as Question;
                  return Card(
                    color: Colors.blue[200],
                    elevation: 8,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Container(
                      padding: EdgeInsets.all(24),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (question.imageUrl != null)
                            Image.network(question.imageUrl!, height: 150), // Show image if available
                          SizedBox(height: 20),
                          Text(
                            question.text,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                onStackFinished: _showFinalScore,
                itemChanged: (SwipeItem item, int index) {
                  _logger.d("Item changed: ${item.content.text}, index: $index");
                },
                upSwipeAllowed: false,
                fillSpace: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Score: $_score',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String text;
  final bool correctAnswer;
  final String? imageUrl; // Optional image URL

  Question({
    required this.text,
    required this.correctAnswer,
    this.imageUrl, // Image URL is optional
  });
}
