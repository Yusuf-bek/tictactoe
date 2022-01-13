import 'package:flutter/material.dart';
import 'package:tictactoe/body/backend/backendbase.dart';

class Interface extends StatefulWidget {
  const Interface({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InterfaceWidgetState();
}

class _InterfaceWidgetState extends State<Interface> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.green.shade100,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.25,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.red],
                ),
              ),
              child: Center(
                child: Text(
                  "Tic Tac Toe",
                  style: TextStyle(fontSize: 30, color: Colors.green.shade100),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 80,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Text(
                chanceChange(),
                style: const TextStyle(fontSize: 30),
              )),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 1.1,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    addDataControlWin();
                    return InkWell(
                      onTap: () {
                        if (stuckButtonImageList[index] == 2 &&
                            continiueGame()) {
                          if (imageSwitcher == 0) {
                            imageSwitcher = 1;
                          } else {
                            imageSwitcher = 0;
                          }

                          stuckButtonImageList[index] = imageSwitcher;
                        }
                        if (winnerIndex == 1 || winnerIndex == 0) {
                          
                          oneDialog();
                        }

                        setState(() {});
                      },
                      child: StuffContainerReturner(index),
                    );
                  },
                  itemCount: 9,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.13,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  stuckButtonImageList.clear();
                  stuckButtonImageList.addAll([2, 2, 2, 2, 2, 2, 2, 2, 2]);
                  setState(() {});
                },
                child: const Text(
                  "RESTART",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      );

  Container StuffContainerReturner(int index) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.2,
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        color: Colors.cyan.shade200,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: Colors.green,
        ),
        image: DecorationImage(
            image: AssetImage(orangeAppleSwitch[stuckButtonImageList[index]]),
            fit: BoxFit.cover),
      ),
    );
  }

  oneDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(winnerChange()),
            content: Container(
              height: MediaQuery.of(context).size.width * 0.6,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage("assets/images/youwin.gif"),
                    fit: BoxFit.cover),
              ),
            ),
          );
        });
  }
}
