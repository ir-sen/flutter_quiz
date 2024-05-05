class QuizQuestion {
  // like 
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

// this is copy and return shuffled list answers
  /// Returns a shuffled list of answers for this question.
  ///
  /// The list is a copy of the answers list, shuffled using the [shuffle]
  /// method.
  ///
  /// The returned list is not the original answers list, so it can be safely
  /// modified without affecting the original data.
  List<String> getShuffledAnswers() {
    // Create a copy of the answers list.
    final shufflList = List<String>.of(answers);

    // Shuffle the copy of the answers list.
    shufflList.shuffle();

    // Return the shuffled list.
    return shufflList;
  }
}