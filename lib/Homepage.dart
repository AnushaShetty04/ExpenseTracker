import 'package:flutter/material.dart';  
  
void main() => runApp(const MyApp());  
  
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override  
  Widget build(BuildContext context) {  
    const appTitle = 'Money manager';  
    return MaterialApp(  
      title: appTitle,  
      home: Scaffold(  
      appBar: AppBar(
        title:const Text("Money Manager",
        style:TextStyle(
          color:Colors.black,
          fontWeight:FontWeight.bold,
          fontSize:25.0,
          fontFamily:'ComicNeue',
        ),
        ),
        centerTitle:true,
        backgroundColor: Colors.yellow[600],
      ),
      body:Column(
        children:<Widget> [
          Container(
            alignment: Alignment.center,
            height:50.0,
            margin: const EdgeInsets.only(top:20,),
            padding: const EdgeInsets.all(15.0),
            decoration:const BoxDecoration(
              color:Colors.white,
            ),
            child:const DropDown()
          ),
          Container(
            alignment: Alignment.center,
            height:80.0,
            margin: const EdgeInsets.only(top:20,left:20,right:20,),
            padding: const EdgeInsets.all(15.0),
            decoration:const BoxDecoration(
              color:Colors.white,
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
              children:<Widget>[
                Column(
                  children:<Widget>[
                    const Text("Income",
                      style:TextStyle(
                      color:Colors.black,                 
                      fontSize:15.0,
                      fontFamily:'ComicNeue',                      
                      ),
                    ),
                    GestureDetector(
                     onTap: () { 
                      //print("Tapped a Container"); 
                    },                                   
                    child:Container(
                     alignment: Alignment.center,
                     height:30.0,
                     width:80.0,
                     padding: const EdgeInsets.all(4.0),
                     decoration:BoxDecoration(
                       border: Border(
                        right: BorderSide(width: 2.0, color: Colors.lightBlue.shade600),
                      ),
                      color:Colors.white,
                     ),
                     child:const Text('25000'),
                    ),
                   ),
                   ],
                ),   
                Column(
                  children:<Widget>[
                    const Text("Expense",
                     style:TextStyle(
                      color:Colors.black,                    
                      fontSize:15.0,
                      fontFamily:'ComicNeue',                      
                     ),
                    ),
                    GestureDetector(
                     onTap: () { 
                     // print("Tapped a Container"); 
                    },                                   
                    child:Container(
                     alignment: Alignment.center,
                     height:30.0,
                     width:80.0,
                     padding: const EdgeInsets.all(4.0),
                     decoration:BoxDecoration(
                       border: Border(
                        right: BorderSide(width: 2.0, color: Colors.lightBlue.shade600),
                      ),
                      color:Colors.white,
                     ),
                     child:const Text('12800'),
                    ),
                   ),
                   ],
                ),   
                 Column(
                  children:<Widget>[
                    const Text("Balance",
                     style:TextStyle(
                      color:Colors.black,
                      fontSize:15.0,
                      fontFamily:'ComicNeue',                     
                     ),
                    ),
                    GestureDetector(
                     onTap: () { 
                     // print("Tapped a Container"); 
                    },                                   
                    child:Container(
                     alignment: Alignment.center,
                     height:30.0,
                     width:80.0,
                     padding: const EdgeInsets.all(4.0),
                     decoration:const BoxDecoration(
                      color:Colors.white,
                     ),
                     child:const Text('12200'),
                    ),
                   ),
                   ],
                ),            
              ],
            ),
          ),
          const SizedBox(height:50),
           Card(
            child: Column(
              children: <Widget>[
                 Padding(
                    padding:const EdgeInsets.all(7.0),
                    child:  Row(
                      children: const <Widget>[
                         Padding(
                          padding:  EdgeInsets.all(7.0),
                          child: Text(
                            'Food',
                           // style:  TextStyle(fontSize: 18.0),
                           style:TextStyle(
                            color:Colors.black,                          
                            fontSize:18.0,
                            fontFamily:'ComicNeue',
                           ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left:250.0),
                          child:  Text('5000', style:  TextStyle(fontSize: 18.0)),
                        )
                      ],
                    ))
              ],
            ),
          ),
        const SizedBox(height:250.0),
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
                  onPressed:(){},
                  child: const Icon(Icons.add),
                ),
               ),
              ),
            ],
          ),
    
       ],

      ),
      
      ),
    ) ;      
  }  
}  

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);
  @override
  _DropDownState createState() => _DropDownState();
}
  
class _DropDownState extends State<DropDown> {
  String dropdownvalue = 'Jan';   
  var items = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownvalue,
      icon: const Icon(Icons.keyboard_arrow_down),    
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items,
           style:const TextStyle(
           color:Colors.black,
           fontWeight:FontWeight.bold,
           fontSize:20.0,
           fontFamily:'ComicNeue',
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
