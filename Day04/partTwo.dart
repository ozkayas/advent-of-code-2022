import 'dart:io';

bool coversAny(List<int> a, List<int> b) {
  if (a.first == b.first) {
    return true;
  }
  if (a.first < b.first && a.last >= b.last) {
    return true;
  }
  if (b.first < a.first && b.last >= a.last) {
    return true;
  }
  return false;
}

bool overlaps(List<int> a, List<int> b) {
  if (a.first < b.first && a.last < b.first) {
    return true;
  }
  if (b.first < a.first && b.last < a.first) {
    return true;
  }
  return false;
}

void main() {
  List<String> inputLines = File('Day04/input.txt').readAsLinesSync();
  List<List<List<int>>> pairs = []; // [[36,92][35,78]]
  for (var line in inputLines) {
    int a = int.tryParse(line.split(',').first.split('-')[0])!;
    int b = int.tryParse(line.split(',').first.split('-')[1])!;
    int c = int.tryParse(line.split(',').last.split('-')[0])!;
    int d = int.tryParse(line.split(',').last.split('-')[1])!;
    pairs.add([
      [a, b],
      [c, d],
    ]);
  }
  int counter = 0;
  for (var pair in pairs) {
    if (overlaps(pair.first, pair.last)) {
      counter++;
    }
  }
  print(counter);
  print(inputLines.length - counter);
  return;
}
