class Definition {
  Definition(this.wordDefinition, this.answers);
  final String wordDefinition;
  final List<String> answers;

  String get definition {
    return wordDefinition;
  }

  List<String> get choices {
    return answers;
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
