import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/income.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(ChartApp());
}

class ChartApp extends StatelessWidget {
  final incomeList, type;

  const ChartApp({ Key? key, this.incomeList, this.type});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
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
       body: MyHomePage(incomeList: this.incomeList, type: this.type),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final incomeList, type;
  const MyHomePage({Key? key, this.incomeList, this.type}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late List<Data> _chartData;
  late TooltipBehavior tooltip;

  @override
  void initState(){
    super.initState();
    List<Data> chartData= [];
    widget.incomeList.forEach((ele){
       var category = ele.category;
       var exType = ele.type;

       if (exType == widget.type) {
         Data data = Data(category, int.parse(ele.amount));
         chartData.add(data);
       }
    });
    _chartData = chartData;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body: SizedBox(
          height:300, 
          width:400,        
          child:Card(
          margin:const EdgeInsets.only(top:20,left:20,right:20),
          child: SfCircularChart(
            palette: const <Color>[Colors.orange,Colors.yellow,Colors.teal],
            legend:Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            annotations: <CircularChartAnnotation>[
             CircularChartAnnotation(
              widget: Container()                
             ),
             CircularChartAnnotation(
              widget: Container(
              child: const Text('Income',
                  style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 15))))
              ],
             series: <CircularSeries>[
             DoughnutSeries<Data, String>(
              dataSource:_chartData,
              pointColorMapper:(Data data,  _) => data.color,
              xValueMapper: (Data data,_)=>data.branch,
              yValueMapper: (Data data,_)=>data.amt,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              radius:'70%',
              innerRadius: '60%',
              // Explode the segments on tap
              explode: true,
              explodeIndex: 1
            )
          ]
        ),
        ),
      ) 
      ),  
  );
  }
}

class Data {
  var color;
  Data(this.branch,this.amt);
  final String branch;
  final int amt;
  
}
       