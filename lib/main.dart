import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/expense.dart';
import 'AddIncome.dart';
import 'IndividualList.dart';
import 'Calculator.dart';
import 'DoughnutChart.dart';
import 'package:flutter_application_1/database.dart';
import 'package:flutter_application_1/models/income.dart';

var total = 0;
void main() => runApp(const MyApp1());

class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  State<MyApp1> createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  int total = 0, expense = 0;
  List<Expense> incomeList = [];
  final FirestoreData _firestoreData = FirestoreData();

  updateTotal(newTotal) {
    setState(() {
      total = newTotal;
    });
  }

  updateExpense(newExpense) {
    setState(() {
      expense = newExpense;
    });
  }

  updateIncomeList(incomeList) {
    setState(() {
      this.incomeList = incomeList;
    });
  }

  @override
  void initState() {
    super.initState();
    int calTotal = 0, totalExpense = 0;
    _firestoreData.getExpense().then((value) {
      value.forEach((ele) {
         if (ele.type == "income") {
           calTotal += int.parse(ele.amount);
        }
        //calTotal += int.parse(ele.amount);
        if (ele.type == "expense") {
           totalExpense += int.parse(ele.amount);
        }
      });
      updateTotal(calTotal);
      updateExpense(totalExpense);
      updateIncomeList(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Money manager';
    return MaterialApp(
      routes: {
        //moving to individual list screen
        '/individualList': (context) =>  IndividualList(),
      },
      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Money Manager",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                fontFamily: 'ComicNeue',
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.yellow[600],
          ),
          body: MyApp3(incomeList: incomeList, total: total, totalExpense: expense)),
    );
  }
}

class MyApp3 extends StatelessWidget {
  final incomeList;
  final total, totalExpense;

  // ignore: use_key_in_widget_constructors
  const MyApp3({this.incomeList, this.total, this.totalExpense});
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            height: 50.0,
            margin: const EdgeInsets.only(
              top: 20,
            ),
            padding: const EdgeInsets.all(15.0),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: const DropDown()),
        Container(
          alignment: Alignment.center,
          height: 80.0,
          margin: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          padding: const EdgeInsets.all(15.0),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Income",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontFamily: 'ComicNeue',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChartApp(incomeList: incomeList, type: "income")),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 30.0,
                      width: 80.0,
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                              width: 2.0, color: Colors.lightBlue.shade600),
                        ),
                        color: Colors.white,
                      ),
                      child: Text(total.toString()),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    "Expense",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontFamily: 'ComicNeue',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChartApp(incomeList: incomeList, type: "expense")),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 30.0,
                      width: 80.0,
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                              width: 2.0, color: Colors.lightBlue.shade600),
                        ),
                        color: Colors.white,
                      ),
                      child: Text(totalExpense.toString()),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    "Balance",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontFamily: 'ComicNeue',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChartApp()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 30.0,
                      width: 80.0,
                      padding: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Text((total - totalExpense).toString()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        MyApp(incomeList: incomeList),
           const SizedBox(height:210.0),
          Column(
            crossAxisAlignment:CrossAxisAlignment.end,
            mainAxisAlignment:MainAxisAlignment.end,
            children:<Widget>[
              Padding(
               padding: const EdgeInsets.only(right:20),
               child:Align(
                alignment: Alignment.bottomRight,
                child:FloatingActionButton(
                  backgroundColor: Colors.yellow[600],  
                  foregroundColor: Colors.white,  
                  onPressed:(){
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyApp2()),
                    );
                  },
                  child: const Icon(Icons.add),
                ),
               ),
              ),
            ],
          ),
      ],
    );
  }
}

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownvalue = 'Jan';
  var items = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownvalue,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(
            items,
            style: const TextStyle(
              color: Colors.black,
              //fontWeight:FontWeight.bold,
              fontSize: 20.0,
              fontFamily: 'ComicNeue',
            ),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }
}

class MyApp extends StatelessWidget {

  final incomeList;
  // final FirestoreData _firestoreData = FirestoreData();
  const MyApp({ this.incomeList });

  @override
  Widget build(BuildContext context) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: incomeList!.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color(0xE1FFFFFF),
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                   child:InkWell(
                    onTap: () {
                       var amount=incomeList![index].amount;
                       var category=incomeList![index].category;
                       var type=incomeList![index].type;
                      //  print(amount);
                      //  print(type);
                      //  print(category);
                       Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  IndividualList(amount:amount,category:category,type:type)),
                    );
                    // Navigator.pushNamed(context, '/individualList');
                    },
                  child: ListTile(
                      leading: Text(incomeList![index].amount),
                      title: Text(
                        (incomeList![index].category),
                        //'($total)',
                        style: TextStyle(color: Colors.black, fontSize: 15,fontFamily: 'Comicneue'),
                      ))));
            });
          // }
          // return Text("loading");
        // });
  }
}
