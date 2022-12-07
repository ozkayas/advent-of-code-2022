import 'dart:io';

main() {
  List<String> lines = File("calories.txt").readAsLinesSync();
  List<int> calories = [];

  for (String item in lines) {
    if (item.isEmpty) {
      calories.add(0);
    } else {
      calories.add(int.tryParse(item)!);
    }
  }

  int maxCalorie = 0;
  int temp = 0;

  for (int calorie in calories) {
    if (calorie == 0) {
      if (temp > maxCalorie) {
        maxCalorie = temp;
      }
      temp = 0;
    } else {
      temp += calorie;
    }
    // print(maxCalorie);
  }
}
