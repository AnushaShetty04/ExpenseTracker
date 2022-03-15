import 'dart:html';

import 'package:flutter/material.dart';
import 'AddExpense.dart';
import 'Calculator.dart';  
//import 'AddIncome.dart';  
  
void main() => runApp( IndividualList());  
  
class IndividualList extends StatelessWidget {
   var amount;
   var category;
   var type;
   IndividualList({Key? key,this.amount,this.category,this.type});
  
  @override  
  Widget build(BuildContext context) {  
    const appTitle = 'Money manager';  
    return MaterialApp(  
      title: appTitle,  
      home: Scaffold(  
      appBar: AppBar(
      title:const Text("Details", textAlign: TextAlign.left,
      style:TextStyle(
        color:Colors.black,                          
        fontSize:25.0,
        fontWeight:FontWeight.bold,
        fontFamily:'ComicNeue',
      ),
      ),
      automaticallyImplyLeading: true,
      leading:IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        iconSize: 20,
        color: Colors.black,
        splashColor: Colors.purple,
         onPressed: () {
            Navigator.pop(context);  
         },
        ),      
        centerTitle:true,
        backgroundColor: Colors.yellow[600],
      ),
      body: Details(amount:amount,category:category,type:type)
    
      ),      
     );     
  }  
}  

class Details extends StatelessWidget {
   var amount;
   var category;
   var type;
   Details({Key? key,this.amount,this.category,this.type}) ;
 // _DetailsState createState() => _DetailsState();
 @override
  Widget build(BuildContext context) {
     final String cat=category;
       return 
       SizedBox(
        height:250, 
        width:400,        
       child: Card(  
        margin:const EdgeInsets.only(top:20,left:20,right:20), 
        clipBehavior: Clip.antiAlias,
        child:Column(
          children: [
            ListTile(
            leading: Icon(Icons.food_bank_rounded,color:Colors.yellow,size:40),
                  title: Text(category,
                  style:TextStyle(
                   color:Colors.black,                          
                   fontSize:18.0,
                   //fontWeight:FontWeight.bold,
                   fontFamily:'ComicNeue',
                  ),
                  ),
            ),
            const Divider(),
            Container(
            child:Padding(
             padding: const EdgeInsets.all(20.0),
               child:Row(
               children: <Widget> [
               Padding(
                 padding:EdgeInsets.all(3.0),
                 child: Text(
                   'Category',                          
                   style:TextStyle(
                   color:Colors.grey,                          
                   fontSize:18.0,
                   fontWeight:FontWeight.bold,
                   fontFamily:'ComicNeue',
                 ),
                ),
               ),
               Padding(
                 padding:EdgeInsets.only(left:70.0),
                 child:  Text(category, style:TextStyle(fontSize: 18.0,fontFamily:'ComicNeue')),
               ),            
               ],
               )
            ),
            ),
            Container(
            child:Padding(
             padding: const EdgeInsets.only(top:1.0,left:10,right:10),
               child:Row(
               children: <Widget> [
               Padding(
                 padding:  EdgeInsets.only(left:10.0,right:10,top:1),
                 child: Text(
                   'Money',                          
                   style:TextStyle(
                   color:Colors.grey, 
                   fontWeight:FontWeight.bold,                       
                   fontSize:18.0,
                   fontFamily:'ComicNeue',
                 ),
                ),
               ),
               Padding(
                 padding:  EdgeInsets.only(left:80.0),
                 child:  Text(amount, style:  TextStyle(fontSize: 18.0,fontFamily:'ComicNeue')),
               ),            
               ],
               )
            ),
            ),
            Container(
            child:Padding(
             padding: const EdgeInsets.only(top:20.0,left:10,right:10),
               child:Row(
               children: <Widget>[
               Padding(
                 padding: EdgeInsets.only(left:10.0,right:10,top:1),
                 child: Text(
                   'Type',                          
                   style:TextStyle(
                   color:Colors.grey, 
                   fontWeight:FontWeight.bold,                       
                   fontSize:18.0,
                   fontFamily:'ComicNeue',
                 ),
                ),
               ),
               Padding(
                 padding: EdgeInsets.only(left:80.0),
                 child:  Text(type, style:  TextStyle(fontSize: 18.0,fontFamily:'ComicNeue')),
               ),            
               ],
               )
            ),
            ),
          
           
          ],
        ),
      ),
     // ),
    );
  }
}