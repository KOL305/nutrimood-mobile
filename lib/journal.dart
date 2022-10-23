import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:collection';
import 'dart:async';


class journal extends StatefulWidget {
  const journal({super.key});
  static const IconData navigate_before = IconData(0xe41c, fontFamily: 'MaterialIcons', matchTextDirection: true);
  static const IconData navigate_next = IconData(0xe41d, fontFamily: 'MaterialIcons', matchTextDirection: true);

  @override
  State<journal> createState() => _journalState();
}

class _journalState extends State<journal> {
  final List entries = [{'name':'water', 'calories':'0','meal':'water','servings': '10'},{'name':'chocolate', 'calories':'100','meal':'snack','servings': '2'},{'name':'cookie', 'calories':'300','meal':'snack','servings': '2'},{'name':'apple', 'calories':'50','meal':'breakfast','servings': '1'}, {'name':'rice', 'calories':'500','meal':'dinner','servings': '1'},{'name':'sandwich', 'calories':'1000','meal':'lunch','servings': '2'}];
  var today = DateTime.now();

  var color = {'breakfast':Colors.yellowAccent,'water':Colors.lightBlue, 'dinner':Colors.pink[100], 'snack':Colors.green,'lunch': Colors.orangeAccent};

  int currentIndex =0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            DateFormat('MM-dd-yyyy').format(today),
            //date,
          ),
          backgroundColor: Colors.indigo[400],
          centerTitle: true,
          elevation: 0.0,
          leading: //Icon(App.navigate_before),
          IconButton(
            icon: Icon(journal.navigate_before),
            onPressed: () {
              today = today.subtract(const Duration(days: 1));
              setState(() { entries.length; });
            },
          ),
          actions: [
            IconButton(
                icon: Icon(journal.navigate_next),
              onPressed: ()=>{
              today = today.add(const Duration(days: 1)),
              setState(() { entries.length; })
              },
            ),
          ],
        ),
        body: entries.length > 0
            ? ListView.builder(
          itemCount: entries.length,
          itemBuilder: (contest, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
              child: Card(
                  child: ListTile(
                      title: Text('${entries[index]['name']}'),
                    subtitle: Text('serving size: '+'${entries[index]['servings']}'),
                      tileColor: color['${entries[index]['meal']}'],
                    onLongPress: (){
                      //showAlertDialog(context, index);
                      //setState(() { entries.length; });
                      setState((){
                        entries.removeAt(index);
                      });
                    },
                    trailing: Text('${entries[index]['calories']}'+' cals'),
                ),
              ),
            );
          },
          )
       : Center(child: Text('Go eat something!!!'),
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

/////////////////////////////////////
/*
final List entries = [{'name':'water', 'calories':'0','meal':'water','servings': '10'},{'name':'chocolate', 'calories':'100','meal':'snack','servings': '2'},{'name':'cookie', 'calories':'300','meal':'snack','servings': '2'},{'name':'apple', 'calories':'50','meal':'breakfast','servings': '1'}, {'name':'rice', 'calories':'500','meal':'dinner','servings': '1'},{'name':'sandwich', 'calories':'1000','meal':'lunch','servings': '2'}];


class App extends StatefulWidget {
  static const IconData navigate_before = IconData(0xe41c, fontFamily: 'MaterialIcons', matchTextDirection: true);
  static const IconData navigate_next = IconData(0xe41d, fontFamily: 'MaterialIcons', matchTextDirection: true);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  //final List entries = [{'name':'water', 'calories':'0','meal':'water','servings': '10'},{'name':'chocolate', 'calories':'100','meal':'snack','servings': '2'},{'name':'cookie', 'calories':'300','meal':'snack','servings': '2'},{'name':'apple', 'calories':'50','meal':'breakfast','servings': '1'}, {'name':'rice', 'calories':'500','meal':'dinner','servings': '1'},{'name':'sandwich', 'calories':'1000','meal':'lunch','servings': '2'}];
  //var date = DateFormat('MM-dd-yyyy').format(DateTime.now());
  var today = DateTime.now();

  var color = {'breakfast':Colors.yellowAccent,'water':Colors.lightBlue, 'dinner':Colors.pink[100], 'snack':Colors.green,'lunch': Colors.orangeAccent};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            DateFormat('MM-dd-yyyy').format(today),
            //date,
          ),
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
          elevation: 0.0,
          leading: //Icon(App.navigate_before),
          IconButton(
            icon: Icon(App.navigate_before),
            onPressed: () {
              today = today.subtract(const Duration(days: 1));
              setState(() { entries.length; });
            },
          ),
          actions: [
            IconButton(
                icon: Icon(App.navigate_next),
              onPressed: ()=>{
              today = today.add(const Duration(days: 1)),
              setState(() { entries.length; })
              },
            ),
          ],
        ),
        body: entries.length > 0
            ? ListView.builder(
          itemCount: entries.length,
          itemBuilder: (contest, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
              child: Card(
                  child: ListTile(
                      title: Text('${entries[index]['name']}'),
                    subtitle: Text('serving size: '+'${entries[index]['servings']}'),
                      tileColor: color['${entries[index]['meal']}'],
                    onLongPress: (){
                      //showAlertDialog(context, index);
                      //setState(() { entries.length; });
                      setState((){
                        entries.removeAt(index);
                      });
                    },
                    trailing: Text('${entries[index]['calories']}'+' cals'),
                ),
              ),
            );
          },
          )
       : Center(child: Text('Go eat something!!!'),
        ),
      ),
    );
  }
}
*/
/*
showAlertDialog(BuildContext context, int index) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () {
    },
  );
  Widget continueButton = TextButton(
    child: Text("Continue"),
    onPressed:  () {
      entries.removeAt(index);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content: Text("Would you like to continue learning how to use Flutter alerts?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
*/