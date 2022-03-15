// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart'; 
import 'main.dart'; 
import 'AddIncome.dart';
import 'Calculator.dart';  
  
void main() => runApp(const MyApp1());  
  
class MyApp1 extends StatelessWidget {
 final int x=5;
  const MyApp1({Key? key}) : super(key: key);
  
  @override  
  Widget build(BuildContext context) {  
    const appTitle = 'Money manager';  
    return MaterialApp(  
      title: appTitle,  
      home: Scaffold(  
      appBar: AppBar(
        //title:Text("Money Manager"),
        title:const DropDown(),
        automaticallyImplyLeading: true,
          leading:IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            iconSize: 20,
            color: Colors.white,
            splashColor: Colors.purple,
            onPressed: () {
               Navigator.pop(context,const MyApp());  
            },
          ),
      
        centerTitle:true,
        backgroundColor: Colors.yellow[600],
      ),
      body:
        GridView.count(  
         crossAxisCount: 3,  
         children: List.generate(choices.length, (index) {  
         return Center(  
         child: ViewCard(choice: choices[index]),  
         );  
        }  
        )
        )  
      ),      
     );     
  }  
}  

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);
  @override
  _DropDownState createState() => _DropDownState();
}
  
class _DropDownState extends State<DropDown> {
  String dropdownvalue = 'Expense';   
  var items = ['Expense','Income'];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownvalue,
      icon: const Icon(Icons.keyboard_arrow_down),    
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items,style:const TextStyle(fontFamily:'ComicNeue')),
        );
      }).toList(),
      onChanged: (String? newValue) { 
        setState(() {
          dropdownvalue = newValue!;
            switch(newValue){
                  case "Expense" :
                   // int index=1;
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) =>View(choice1: choices1[index])),
                    // );
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>MyApp1()),
                    );
                   // show();
                    break;
                    case "Income" :
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyApp2()),
                    );
                    // Navigator.pop(context);  
                    break;
            }
        });
      },
    );
  }
}

class GridViewIcon {  
  const GridViewIcon({required this.title, required this.icon});  
  final String title;  
  final IconData icon;  
}  
  
const List<GridViewIcon> choices = const <GridViewIcon>[  
  const GridViewIcon(title: 'Food', icon: Icons.food_bank),  
  const GridViewIcon(title: 'Transport', icon: Icons.emoji_transportation),  
  const GridViewIcon(title: 'Shopping', icon: Icons.shopping_bag),  
  const GridViewIcon(title: 'Health', icon: Icons.health_and_safety),  
  const GridViewIcon(title: 'Travel', icon: Icons.travel_explore),  
  const GridViewIcon(title: 'Home', icon: Icons.home),  
];  

class ViewCard extends StatelessWidget {  
  const ViewCard({Key?key, required this.choice}) : super(key: key);  
  final GridViewIcon choice;  
  
  @override  
  Widget build(BuildContext context) {  
    return SizedBox( 
        width: 100,
        height: 80,
        child:Card(  
        color: Colors.grey[100],
        elevation:10,  
        shape: RoundedRectangleBorder(  
          borderRadius: BorderRadius.circular(15.0),  
        ),  
        child: InkWell(
          onTap:(){
                 var chLower = choice.title.toLowerCase();
                //SimpleCalculator();
                //show();
                 Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Calculator(choice: chLower)),
                    );
              },
        child: Center(child: Column(  
            //mainAxisSize: MainAxisSize.min,  
            crossAxisAlignment: CrossAxisAlignment.center,  
            children: <Widget>[                
              Expanded(child: Icon(choice.icon, size:30.0)),  
              Text(choice.title, style:const TextStyle(color:Colors.black,fontFamily:'ComicNeue')),  
            ]  
        ),  
        )  
        ),
    ),
    );  
  }  
}  

