import 'package:flutter/material.dart';
import 'package:quiz_app_april/dummy_db.dart';
import 'package:quiz_app_april/view/home_screen/widgets/options_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentQstnIndex = 0;
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //question section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    DummyDb.question[currentQstnIndex]["question"].toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // options seciton
                Column(
                  children: List.generate(
                    4,
                    (index) {
                      List ansOptions =
                          DummyDb.question[currentQstnIndex]["options"] as List;
                      return optionsCard(
                        borderColor: getColor(index),
                        onOpitonsTapped: () {
                          selectedIndex = index;
                          setState(() {});
                          if (index ==
                              DummyDb.question[currentQstnIndex]
                                  ["answerIndex"]) {
                            print("rignt answer");
                          } else {
                            print("wrong answer");
                          }
                        },
                        option: ansOptions[index],
                      );
                    },
                  ),
                ),

                InkWell(
                  onTap: () {
                    if (currentQstnIndex < DummyDb.question.length - 1) {
                      currentQstnIndex++;
                      print(currentQstnIndex);
                      setState(() {});
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade800,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getColor(int index) {
    if (DummyDb.question[currentQstnIndex]["answerIndex"] == selectedIndex &&
        index == selectedIndex) {
      return Colors.green;
    }
    return Colors.grey.shade800;
  }
}
