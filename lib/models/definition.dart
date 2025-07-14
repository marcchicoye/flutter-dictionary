class Definition {
  Definition(this.wordDefinition, this.answers, this.sentenceExample);
  final String wordDefinition;
  final List<String> answers;
  final String sentenceExample;

  String get definition {
    return wordDefinition;
  }

  List<String> get choices {
    return answers;
  }

  List<String> getShuffledAnswers() {
    final List<String> shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }

  @override
  String toString() {
    final defFormatted = StringBuffer('');

    defFormatted.write(wordDefinition);
    defFormatted.write(' [');
    for (String choice in answers) {
      defFormatted.write(choice);
      defFormatted.write(',');
    }
    return super.toString();
  }
}
