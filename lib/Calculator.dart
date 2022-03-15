import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'main.dart';

 String equation = "0";
 var income = 'income';
 var expense = 'expense';
 var mapping = {
   'rental': income,
   'salary': income,
   'coupons':income,
   'transport':expense,
   'shopping':expense,
   'health':expense,
   'travel':expense,
   'home':expense,
   'food': expense
 };

class Calculator extends StatelessWidget {

  var choice;

  Calculator ({Key?key, this.choice});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
        appBar:AppBar(
             leading:IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            iconSize: 20,
            color: Colors.white,
            splashColor: Colors.purple,
            onPressed: () {
                FirebaseFirestore.instance
                .collection('expense')
                .add({'amount': equation,
                  'category': this.choice, 
                  'type': mapping[this.choice]});
               Navigator.pop(context,const MyApp());  
            },
          ),
          backgroundColor: Colors.yellow[600],
        ) ,
        body:const SimpleCalculator()
        ),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {

  //String equation = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
  String result = "0";

  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "C"){
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      }

      else if(buttonText == "⌫"){
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if(equation == ""){
          equation = "0";
        }
      }

      else if(buttonText == "="){
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          equation = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result = "Error";
        }

      }

      else{
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if(equation == "0"){
          equation = buttonText;
        }else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: const BorderSide(
                  color: Colors.white,
                  width: 1,
                  style: BorderStyle.solid
              )
          ),
          padding: const EdgeInsets.all(16.0),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: Colors.black
            ),
          )
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    //  appBar: AppBar(title: Text('Calculator')),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding:const EdgeInsets.fromLTRB(10, 250, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: equationFontSize),),
          ),

          const Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height:270,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("C", 1,const Color.fromARGB(255, 241, 239, 239)),
                          buildButton("⌫", 1, const Color.fromARGB(255, 241, 239, 239)),
                          buildButton("=", 1, const Color.fromARGB(255, 241, 239, 239)),
                          buildButton(".", 1, const Color.fromARGB(255, 241, 239, 239)),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("-", 1, const Color.fromARGB(255, 241, 239, 239)),
                          buildButton("+", 1, const Color.fromARGB(255, 241, 239, 239)),
                          buildButton("0", 1, const Color.fromARGB(255, 241, 239, 239)),
                          buildButton("9", 1, const Color.fromARGB(255, 241, 239, 239)),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("8", 1, const Color.fromARGB(255, 241, 239, 239)),
                          buildButton("7", 1, const Color.fromARGB(255, 241, 239, 239)),
                          buildButton("6", 1, const Color.fromARGB(255, 241, 239, 239)),
                          buildButton("5", 1, const Color.fromARGB(255, 241, 239, 239)),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("1", 1,const Color.fromARGB(255, 241, 239, 239)),
                          buildButton("2", 1, const Color.fromARGB(255, 241, 239, 239)),
                          buildButton("3", 1, const Color.fromARGB(255, 241, 239, 239)),
                          buildButton("4", 1, const Color.fromARGB(255, 241, 239, 239)),
                        ]
                    ),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
