import 'dart:io';

main() {
  List<String> lines = File("calories.txt").readAsLinesSync();

  List<int> clusteredCalories(List<String> lines) {
    int temp = 0;
    List<int> clusteredCalories = [];

    for (String line in lines) {
      if (line.isEmpty) {
        clusteredCalories.add(temp);
        temp = 0;
      } else {
        temp += int.tryParse(line)!;
      }
    }
    clusteredCalories.add(temp);

    return clusteredCalories;
  }

  // ###    METHODS    ###
  //####### PART ONE ###########

  int partOne(List<String> lines) {
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

    return maxCalorie;
  }

  //####### PART ONE ###########
  int partTwo(List<String> lines) {
    List<int> calories = clusteredCalories(lines);

    calories.sort();
    print(calories.reversed.toList()[0]);
    print(calories.reversed.toList()[1]);
    print(calories.reversed.toList()[2]);
    print(calories.reversed.toList()[0] + calories.reversed.toList()[1] + calories.reversed.toList()[2]);

    return 0;
  }

  // ############# MAIN ############

  // int maxCalories = partOne(lines);
  // print(maxCalories);
  partTwo(lines);
}
