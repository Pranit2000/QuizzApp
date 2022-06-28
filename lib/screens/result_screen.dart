import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/main.dart';

class Resultpage extends StatefulWidget {
  final int score;
  const Resultpage(this.score, {Key? key}) : super(key: key);

  @override
  State<Resultpage> createState() => _ResultpageState();
}

class _ResultpageState extends State<Resultpage> {
  @override
  Widget build(BuildContext context) {
    Color maincolor = Color(0xFF252c4a);
    Color secondcolor = Color(0xFF117eeb);
    return Scaffold(
      backgroundColor: maincolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Congradulation",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your Score IS :  ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              "${widget.score}",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 80.0),
            ),
            SizedBox(
              height: 60.0,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
              },
              elevation: 0.0,
              color: Colors.orange,
              textColor: Colors.white,
              child: Text("Repeat the Quizz"),
            ),
          ],
        ),
      ),
    );
  }
}
