import 'dart:io';

String commonItem(List<String> first, List<String> second) {
  String common = '';
  first.sort();
  second.sort();

  int i = 0;
  int j = 0;

  while (i < first.length && j < second.length) {
    if (first[i].compareTo(second[j]) == 0) {
      common = (first[i]);
      break;
    } else if (first[i].compareTo(second[j]) == -1) {
      i++;
    } else {
      j++;
    }
  }

  return common;
}

int valueOf(String char) {
  // a < char < z
  if (char.codeUnits.first > 96) {
    return char.codeUnits.first - 96;
  } else {
    return char.codeUnits.first - 38;
  }
}

void main(List<String> args) {
  List<String> rucksacks = File('Day03/input.txt').readAsLinesSync();
  List<String> firstHalf = [];
  List<String> secondHalf = [];
  List<String> commonLetters = [];
  int commonLettersValue = 0;

  // Fill the input into two lists of Strings
  for (var list in rucksacks) {
    var middle = list.length ~/ 2;
    String firstString = list.substring(0, middle);
    String secondString = list.substring(middle);

    firstHalf.add(firstString);
    secondHalf.add(secondString);
  }

  for (var i = 0; i < rucksacks.length; i++) {
    String common = commonItem(firstHalf[i].split(''), secondHalf[i].split(''));
    commonLetters.add(common);
  }

  for (var letter in commonLetters) {
    commonLettersValue += valueOf(letter);
  }

  // part 1
  print(commonLettersValue);
  return;
}
