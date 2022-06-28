import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions_list.dart';
import 'package:quizz_app/screens/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  //step 1:we nned to create the folder structure of the app
  //Step 2:then we need to create model for our Quizz question
  //Step 3:and we need a simple list of display it
  //in our screen,of course you can use your own list,or get data
  //from and existing API
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //Let's Store the color code in a variable so it will be easy to use it
  Color maincolor = Color(0xFF252c4a);
  Color secondcolor = Color(0xFF117eeb);
  //Let's create a page controller for our pageview
  PageController? _controller = PageController(initialPage: 0);
  //setting the game variable
  bool ispressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Color(0xFF117eeb);
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller!,
            onPageChanged: (Page) {
              setState(() {
                ispressed = false;
              });
            },
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Questions ${index + 1} /${questions.length}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    height: 8.0,
                    thickness: 1.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    questions[index].question!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 29.0,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  //Generate a list of buttons,that will represent the answer to the question
                  //for that we will use a for loop
                  for (int i = 0; i < questions[index].answer!.length; i++)
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 18),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        color: ispressed
                            ? questions[index].answer!.entries.toList()[i].value
                                ? isTrue
                                : isWrong
                            : secondcolor,
                        padding: EdgeInsets.symmetric(vertical: 18.0),
                        onPressed: ispressed
                            ? () {}
                            : () {
                                setState(() {
                                  ispressed = true;
                                });
                                if (questions[index]
                                    .answer!
                                    .entries
                                    .toList()[i]
                                    .value) {
                                  score += 10;
                                  print(score);
                                }
                              },
                        child: Text(questions[index].answer!.keys.toList()[i]),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: ispressed
                            ? index + 1 == questions.length
                                ? () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Resultpage(score)));
                                  }
                                : () {
                                    _controller!.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.linear);
                                        setState(() {
                                          ispressed=false;
                                        });
                                  }
                            : null,
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          
                          side: BorderSide(color: Colors.orange,width: 2.0)
                        ),
                        child: Text(
                          index + 1 == questions.length
                              ? "see Result"
                              : "NextQuestion",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
}
