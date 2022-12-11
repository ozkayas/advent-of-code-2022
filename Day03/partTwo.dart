import 'dart:io';

List<String> commonLetters(List<String> first, List<String> second, List<String> third) {
  List<String> commonFirst = [];
  List<String> commonSecond = [];
  List<String> firstAsList = first..sort();
  List<String> secondAsList = second..sort();
  List<String> thirdAsList = third..sort();

  int i = 0;
  int j = 0;

  while (i < firstAsList.length && j < secondAsList.length) {
    if (firstAsList[i].compareTo(secondAsList[j]) == 0) {
      commonFirst.add(firstAsList[i]);
      i++;
      j++;
    } else if (firstAsList[i].compareTo(secondAsList[j]) == -1) {
      i++;
    } else {
      j++;
    }
  }

  i = 0;
  j = 0;

  while (i < commonFirst.length && j < thirdAsList.length) {
    if (commonFirst[i].compareTo(thirdAsList[j]) == 0) {
      commonSecond.add(commonFirst[i]);
      i++;
      j++;
    } else if (commonFirst[i].compareTo(thirdAsList[j]) == -1) {
      i++;
    } else {
      j++;
    }
  }

  return commonSecond.toSet().toList();
}

int valueOf(String char) {
  // if a < char < z
  if (char.codeUnits.first > 96) {
    return char.codeUnits.first - 96;
  } else {
    return char.codeUnits.first - 38;
  }
}

void main(List<String> args) {
  List<String> rucksacks = File('Day03/input.txt').readAsLinesSync();

  List<String> commonLettersList = [];
  int commonLettersValue = 0;

  for (var i = 0; i < rucksacks.length; i += 3) {
    commonLettersList
        .add(commonLetters(rucksacks[i].split(''), rucksacks[i + 1].split(''), rucksacks[i + 2].split('')).first);
  }

  // print(commonLetters(rucksacks[0].split(''), rucksacks[1].split(''), rucksacks[2].split('')));

  for (var letter in commonLettersList) {
    commonLettersValue += valueOf(letter);
  }

  // part 1
  print(commonLettersValue);
  return;
}
