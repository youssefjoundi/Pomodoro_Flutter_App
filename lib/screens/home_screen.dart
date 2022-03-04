import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pomodoro_app/ui/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //App Variables
  int time = 25;
  int breakTime = 5;
  Timer? timer;
  int counter = 25 * 60;

  void _startTimer(int timeInMinutes) {
    counter = timeInMinutes * 60;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (counter == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          counter--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        title: Text("Pomodoro Clock"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      /*Setting the body of the app*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${counter ~/ 60 < 10 ? "0" + (counter ~/ 60).toString() : counter ~/ 60} : ${counter % 60 < 10 ? "0" + (counter % 60).toString() : counter % 60}",
            style: TextStyle(
              color: Colors.white,
              fontSize: max(120, MediaQuery.of(context).size.width / 8),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () {
                  // Setting the start button function
                  setState(() {
                    if (timer != null) {
                      timer!.cancel();
                    }
                  });
                  _startTimer(25);
                },
                fillColor: AppColor.secondaryColor,
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 64.0),
                child: Text(
                  "Start",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              RawMaterialButton(
                onPressed: () {
                  // Setting the break button function
                  setState(() {
                    if (timer != null) {
                      timer!.cancel();
                    }
                  });
                  _startTimer(5);
                },
                fillColor: AppColor.secondaryColor,
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 64.0),
                child: Text(
                  "Break",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
