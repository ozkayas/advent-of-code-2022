import 'dart:io';

int calculateScore(String opponent, String my) {
  // A Rock, B Paper, C Scissors
  // X Rock, Y Paper, Z Scissors
  if (opponent == "A") {
    if (my == "X" || my == "A") {
      return 3; // draw
    } else if (my == "Y" || my == "B") {
      return 6; // win
    } else {
      return 0; // lost
    }
  } else if (opponent == "B") {
    if (my == "X" || my == "A") {
      return 0; // lost
    } else if (my == "Y" || my == "B") {
      return 3; // draw
    } else {
      return 6; // win
    }
  } else {
    if (my == "X" || my == "A") {
      return 6; // win
    } else if (my == "Y" || my == "B") {
      return 0; // lost
    } else {
      return 3; // draw
    }
  }
}

int moveValue(String my) {
  if (my == "X" || my == "A") {
    return 1; // rock 1
  } else if (my == "Y" || my == "B") {
    return 2; // paper
  } else {
    return 3; // scissors
  }
}

String getMove(String opponent, String result) {
  if (opponent == "A") {
    if (result == "X") {
      return "C"; // need to loose
    } else if (result == "Y") {
      return "A"; // need to draw
    } else {
      return "B"; // need to win
    }
  } else if (opponent == "B") {
    if (result == "X") {
      return 'A'; // need to loose
    } else if (result == "Y") {
      return 'B'; // need to draw
    } else {
      return 'C'; // win
    }
  } else {
    if (result == "X") {
      return "B"; // need to loose
    } else if (result == "Y") {
      return "C"; // need to draw
    } else {
      return "A"; // draw
    }
  }
}

void main(List<String> args) {
  List<String> input = File('Day02/input.txt').readAsLinesSync();
  int scorePartOne = 0;
  int scorePartTwo = 0;

  for (String item in input) {
    scorePartOne += calculateScore(item[0], item[2]) + moveValue(item[2]);
    scorePartTwo += calculateScore(item[0], getMove(item[0], item[2])) + moveValue(getMove(item[0], item[2]));
  }
  print(scorePartOne);
  print(scorePartTwo);

  return;
}
