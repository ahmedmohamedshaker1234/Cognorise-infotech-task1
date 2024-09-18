import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/pages/Button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String Userask = '';
  String userhint = '';
  String Useranswer = '';

  List<String> myButton = [
    'AC',
    'Del',
    '%',
    '÷',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'Ans',
    '='
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator App"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 60,
                  alignment: Alignment.centerLeft,
                  color: Colors.grey.shade200,
                  child: AutoSizeText(
                    Userask,
                      style: TextStyle(
                        fontSize: 40,
                      )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 60,
                  alignment: Alignment.centerRight,
                  color: Colors.grey.shade200,
                  child: AutoSizeText(
                    userhint,
                      style: TextStyle(
                        fontSize: 40,
                      )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 60,
                  alignment: Alignment.centerRight,
                  color: Colors.grey.shade200,
                  child: AutoSizeText(
                    Useranswer,
                      style: TextStyle(
                        fontSize: 40,
                      )
                  ),
                ),
              ],
            )),
            Expanded(
                flex: 2,
                child: GridView.builder(
                  itemCount: myButton.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    // AC BUTTON
                    if (myButton[index] == 'AC') {
                      return Button(
                        buttoncolor: Colors.amber,
                        buttontext: myButton[index],
                        textcolor: Colors.black,
                        tapped: () {
                          setState(() {
                            Userask = '';
                            userhint = '';
                            Useranswer = '';
                          });
                        },
                      );
                      // DEL BUTTON
                    } else if (myButton[index] == 'Del') {
                      return Button(
                        buttoncolor: Colors.red,
                        buttontext: myButton[index],
                        textcolor: Colors.black,
                        tapped: () {
                          setState(() {
                            if (Userask.isNotEmpty) {
                              Userask =
                                  Userask.substring(0, Userask.length - 1);
                            }
                          });
                        },
                      );
                      // PERCENTAGE BUTTON
                    } else if (myButton[index] == '%' ||
                        myButton[index] == '÷' ||
                        myButton[index] == 'x' ||
                        myButton[index] == '+' ||
                        myButton[index] == '-') {
                      return Button(
                        buttoncolor: Colors.blue,
                        buttontext: myButton[index],
                        textcolor: Colors.black,
                        tapped: () {
                          setState(() {
                            Userask = Userask + myButton[index];
                          });
                        },
                      );
                      // EQUAL BUTTON
                    } else if (myButton[index] == '=') {
                      return Button(
                        buttoncolor: Colors.blue,
                        buttontext: myButton[index],
                        textcolor: Colors.white,
                        tapped: () {
                          setState(() {
                            eqal(

                            );
                            if (Useranswer.endsWith('.0')) {
                              Useranswer = Useranswer.replaceAll('.0', '');
                          }

                          });
                        },
                      );
                    } else {
                      return Button(
                        buttoncolor: Colors.grey.shade300,
                        buttontext: myButton[index],
                        textcolor: Colors.black,
                        tapped: () {
                          setState(() {
                            Userask = Userask + myButton[index];
                          });
                        },
                      );
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }

  void eqal() {
   try {
      String userinput = Userask;
    userinput = userinput.replaceAll('x', '*');
    userinput = userinput.replaceAll('÷', '/');
    Parser p = Parser();
    Expression exp = p.parse(userinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    Useranswer = eval.toString();
   }
   catch(e){
    if (Userask.endsWith("÷")) {
    userhint = "😂نسبت هتقسم ايه";
    Useranswer = "";
} else if (Userask.endsWith("x")) {
    userhint = "نسيت هتضرب ايه";
    Useranswer = "";
} else if (Userask.endsWith("-")) {
    userhint = "عندى السكر . 🥰ناقص ايه";
    Useranswer = "";
} else if (Userask.endsWith("+")) {
    userhint = "جالى الضغط..🤒هتجمع ايه";
    Useranswer = "";
} else {
    Useranswer = "ERROR";
}
   }
  }
}
