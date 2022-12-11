import 'dart:io';

List<int> moveFromSentence(String sentence) {
// Use a regular expression to match all integers in the sentence
  RegExp exp = new RegExp(r"\d+");

// Use the `allMatches` method to find all matches for the regular expression in the sentence
  Iterable<Match> matches = exp.allMatches(sentence);

// Create a list to store the extracted integer values
  List<int> numbers = [];

// Iterate through the matches and add the matched integer values to the list
  for (Match m in matches) {
    numbers.add(int.parse(m.group(0)!));
  }

// Print the list of extracted integer values
  return numbers;
}

void main() {
  /// initial crane data as lists
  List<List<String>> cranes = [
    ['S', 'Z', 'P', 'D', 'L', 'B', 'F', 'C'],
    ['N', 'V', 'G', 'P', 'H', 'W', 'B'],
    ['F', 'W', 'B', 'J', 'G'],
    ['G', 'J', 'N', 'F', 'L', 'W', 'C', 'S'],
    ['W', 'J', 'L', 'T', 'P', 'M', 'S', 'H'],
    ['B', 'C', 'W', 'G', 'F', 'S'],
    ['H', 'T', 'P', 'M', 'Q', 'B', 'W'],
    ['F', 'S', 'W', 'T'],
    ['N', 'C', 'R'],
  ];

  List<String> sentences = File('Day05/input.txt').readAsLinesSync();

  var moves = sentences.map((e) => moveFromSentence(e));

  String finalTopCrates = '';

  for (var move in moves) {
    var listToRemove = cranes[move[1] - 1];
    var listToAdd = cranes[move[2] - 1];
    for (var i = 0; i < move[0]; i++) {
      var removed = listToRemove.removeLast();
      listToAdd.add(removed);
    }
  }

  for (var item in cranes) {
    finalTopCrates += item.last;
  }
  print(finalTopCrates);

  return;
}
