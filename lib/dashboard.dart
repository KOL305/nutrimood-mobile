import 'package:flutter/material.dart';
import 'package:emojis/emojis.dart';
import 'package:emojis/emojis.dart'; // to use Emoji collection
import 'package:emojis/emoji.dart'; // to use Emoji utilities

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  int currentIndex = 0;
  var entries;
  var average;
  var caloriesStat;
  var proteinStat;
  var carbsStat;
  var fatStat;
  var waterStat;
  var color1;
  var color2;
  var color3;
  var color4;
  var color5;
  var emoji;
  var dayInInt;
  var day;

  @override
  void initState() {
    super.initState();
    entries = {'Day':5/1,'Calories':(10000/1000),'Proteins':(10000/200),'Carbs':(50/50),'Fat':(20/120),'Water':(10/1000)};
    average = (entries['Calories']!+ entries['Proteins']!+entries['Carbs']!+entries['Fat']!+entries['Water']!)/5;
    caloriesStat = entries['Calories'];
    proteinStat = entries['Proteins'];
    carbsStat = entries['Carbs'];
    fatStat = entries['Fat'];
    waterStat = entries['Water'];
    dayInInt = entries['Day']?.round();
    day = dayInInt.toString();
  }




  @override
  Widget build(BuildContext context) {
    if(average>.7 && average<=1){
      emoji = '${Emojis.smilingFace}';
    }else if(average>.5&&average<=.7){
      emoji = '${Emojis.neutralFace}';
    }else if(average<=.5&&average>.3){
      emoji = '${Emojis.worriedFace}';
    }else{
      emoji = '${Emojis.skull}';
    }
    if(caloriesStat!>1){
      color1 = Colors.black;
    }else{
      color1 = Color(0xff00ff00);
    }
    if(proteinStat!>1){
      color2 = Colors.black;
    }else{
    color2 = Color(0xff00ff00);
    }
    if(carbsStat!>1){
      color3 = Colors.black;
    }else{
      color3 = Color(0xff00ff00);
    }
    if(fatStat!>1){
      color4 = Colors.black;
    }else{
      color4 = Color(0xff00ff00);
    }
    if(waterStat!>1){
      color5 = Colors.black;
    }else{
      color5 = Color(0xff00ff00);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Day " + day, textAlign: TextAlign.left,),
          backgroundColor: Colors.pink[100],
          centerTitle: false,
          elevation: 0.0,  
          actions: [
            Text(emoji,style: TextStyle(fontSize: 50)),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 287.4,
              width: 415,
              child:FittedBox(

              fit: BoxFit.fill,
              child: Image(
                image: NetworkImage('https://media.tenor.com/6Lw1YBeMrCMAAAAM/hanoopy-happy.gif'),
              ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    height: 250.0,
                    color: Colors.pink[100],
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Calories   ', textAlign: TextAlign.start,),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 11),
                                width: 300,
                                height: 20,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  child: LinearProgressIndicator(
                                    value: entries['Calories'],
                                    valueColor: AlwaysStoppedAnimation<Color>(color1),
                                    backgroundColor: Color(0xffD6D6D6),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Proteins   ', textAlign: TextAlign.start,),
                            Container(
                              margin: EdgeInsets.symmetric(vertical:11),
                              width: 300,
                              height:20,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  value: entries['Proteins'],
                                  valueColor: AlwaysStoppedAnimation<Color>(color2),
                                  backgroundColor: Color(0xffD6D6D6),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Carbs      ', textAlign: TextAlign.start,),
                            Container(
                              margin: EdgeInsets.symmetric(vertical:11),
                              width: 300,
                              height:20,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  value: entries['Carbs'],
                                  valueColor: AlwaysStoppedAnimation<Color>(color3),
                                  backgroundColor: Color(0xffD6D6D6),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Fat          ', textAlign: TextAlign.start,),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 11),
                              width: 300,
                              height: 20,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  value: entries['Fat'],
                                  valueColor: AlwaysStoppedAnimation<Color>(color4),
                                  backgroundColor: Color(0xffD6D6D6),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Water      ', textAlign: TextAlign.start,),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 11),
                              width: 300,
                              height: 20,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  value: entries['Water'],
                                  valueColor: AlwaysStoppedAnimation<Color>(color5),
                                  backgroundColor: Color(0xffD6D6D6),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ),
                  ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.indigo[400],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          iconSize: 36,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index)=> setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Dash Board',
              //backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: 'Journal',
              //backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Calorie Search',
              //backgroundColor: Colors.blue,
            ),

          ],
        ),
      ),
    );
  }
}

// void main() => runApp(App());

// var entries = {'Calories':(10000/1000),'Proteins':(10000/200),'Carbs':(50/50),'Fat':(20/120),'Water':(10/1000)};

// var average = (entries['Calories']!+ entries['Proteins']!+entries['Carbs']!+entries['Fat']!+entries['Water']!)/5;
// var caloriesStat = entries['Calories'];
// var proteinStat = entries['Proteins'];
// var carbsStat = entries['Carbs'];
// var fatStat = entries['Fat'];
// var waterStat = entries['Water'];
// var color1;
// var color2;
// var color3;
// var color4;
// var color5;
// var emoji;



// class App extends StatefulWidget {
//   @override
//   State<App> createState() => _AppState();
// }


// class _AppState extends State<App> {

//   @override
//   Widget build(BuildContext context) {
//     if(average>.7 && average<=1){
//       emoji = '${Emojis.smilingFace}';
//     }else if(average>.5&&average<=.7){
//       emoji = '${Emojis.neutralFace}';
//     }else if(average<=.5&&average>.3){
//       emoji = '${Emojis.worriedFace}';
//     }else{
//       emoji = '${Emojis.skull}';
//     }
//     if(caloriesStat!>1){
//       color1 = Colors.black;
//     }else{
//       color1 = Color(0xff00ff00);
//     }
//     if(proteinStat!>1){
//       color2 = Colors.black;
//     }else{
//     color2 = Color(0xff00ff00);
//     }
//     if(carbsStat!>1){
//       color3 = Colors.black;
//     }else{
//       color3 = Color(0xff00ff00);
//     }
//     if(fatStat!>1){
//       color4 = Colors.black;
//     }else{
//       color4 = Color(0xff00ff00);
//     }
//     if(waterStat!>1){
//       color5 = Colors.black;
//     }else{
//       color5 = Color(0xff00ff00);
//     }
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Day", textAlign: TextAlign.left,),
//           backgroundColor: Colors.pink[100],
//           centerTitle: false,
//           elevation: 0.0,  
//           actions: [
//             Text(emoji,style: TextStyle(fontSize: 50)),
//           ],
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             Image(
//               image: NetworkImage('https://i.gifer.com/57EY.gif'),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     padding: EdgeInsets.all(10.0),
//                     height: 250.0,
//                     color: Colors.pink[100],
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Text('Calories   ', textAlign: TextAlign.start,),
//                             Container(
//                               margin: EdgeInsets.symmetric(vertical: 11),
//                                 width: 300,
//                                 height: 20,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                                   child: LinearProgressIndicator(
//                                     value: entries['Calories'],
//                                     valueColor: AlwaysStoppedAnimation<Color>(color1),
//                                     backgroundColor: Color(0xffD6D6D6),
//                                   ),
//                                 ),
//                               ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Text('Proteins   ', textAlign: TextAlign.start,),
//                             Container(
//                               margin: EdgeInsets.symmetric(vertical:11),
//                               width: 300,
//                               height:20,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                                 child: LinearProgressIndicator(
//                                   value: entries['Proteins'],
//                                   valueColor: AlwaysStoppedAnimation<Color>(color2),
//                                   backgroundColor: Color(0xffD6D6D6),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Text('Carbs      ', textAlign: TextAlign.start,),
//                             Container(
//                               margin: EdgeInsets.symmetric(vertical:11),
//                               width: 300,
//                               height:20,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                                 child: LinearProgressIndicator(
//                                   value: entries['Carbs'],
//                                   valueColor: AlwaysStoppedAnimation<Color>(color3),
//                                   backgroundColor: Color(0xffD6D6D6),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Text('Fat          ', textAlign: TextAlign.start,),
//                             Container(
//                               margin: EdgeInsets.symmetric(vertical: 11),
//                               width: 300,
//                               height: 20,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                                 child: LinearProgressIndicator(
//                                   value: entries['Fat'],
//                                   valueColor: AlwaysStoppedAnimation<Color>(color4),
//                                   backgroundColor: Color(0xffD6D6D6),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Text('Water      ', textAlign: TextAlign.start,),
//                             Container(
//                               margin: EdgeInsets.symmetric(vertical: 11),
//                               width: 300,
//                               height: 20,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                                 child: LinearProgressIndicator(
//                                   value: entries['Water'],
//                                   valueColor: AlwaysStoppedAnimation<Color>(color5),
//                                   backgroundColor: Color(0xffD6D6D6),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     ),
//                   ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






