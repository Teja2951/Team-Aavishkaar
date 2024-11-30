class QuestionQuiz {

  const QuestionQuiz(this.text,this.answers,this.correctAnswer,this.explanation);


  final String text;
  final List<String> answers;
  final String correctAnswer;
  final String explanation;

  List<String> getShuffuledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }


}