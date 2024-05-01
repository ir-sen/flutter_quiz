class QuizQuestion {

  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

// this is copy and return shuffled list answers
  List<String> getShuffledAnswers() {
    final shufflList = List.of(answers);
    shufflList.shuffle();
    return shufflList;
  }
}