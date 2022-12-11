import 'package:flutter/material.dart';
import 'package:nutrack_mobile/widget/drawer_menu.dart';
import 'package:food_rec/model/food_rec_model.dart';

import 'package:nutrack_mobile/main.dart';

class FoodRecDetail extends StatelessWidget {
  final FoodRecModel foodRec;
  const FoodRecDetail({super.key, required this.foodRec});

  static const Color cardColor = Color.fromARGB(255, 250, 250, 217);
  static const Color buttonColor = Color.fromARGB(255, 255, 148, 23);
  static const Color ratingColor = Color.fromARGB(255, 238, 160, 43);
  static const Color iconColor = Color.fromARGB(255, 87, 110, 89);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Food Details'),
          backgroundColor: Colors.orange,
        ),
        drawer: NutrackDrawer(),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(children: [
            // if foodRec.is_food is true, icon is food icon, else icon is drink icon
            foodRec.isFood
                ? const Icon(
                    Icons.fastfood,
                    size: 100,
                    color: iconColor,
                  )
                : const Icon(
                    Icons.local_drink,
                    size: 100,
                    color: iconColor,
                  ),
            Center(
                child: Text(
              foodRec.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )),
            const SizedBox(
              height: 10,
            ),
            // container to store foodRec.rating and star icon
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: ratingColor,
                ),
                const SizedBox(
                  width: 0,
                ),
                Text(
                  foodRec.rating.toString(),
                  style: const TextStyle(
                      fontSize: 18,
                      color: ratingColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "Calories: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    Text(
                      foodRec.calories.toString(),
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "Protein: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    Text(
                      foodRec.protein.toString(),
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "Fat: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    Text(
                      foodRec.fat.toString(),
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "Carbohydrate: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    Text(
                      foodRec.carbs.toString(),
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: buttonColor // NEW
                    ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ]),
        ));
  }
}
