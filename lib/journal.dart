import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
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
  List entries = [];
  var today;

  var color = {'Water':Colors.blue[200],'Breakfast':Colors.yellow[200], 'Lunch': Colors.amber[300], 'Dinner':Colors.orange[400], 'Snack':Colors.red[200],};

  int currentIndex = 1;

  getJournal (date) async{
    final storage = new FlutterSecureStorage();
    String? value = await storage.read(key: "token");
    var journalDate = (date).toString().split(" ")[0];
    var splitDate = journalDate.split("-");
    journalDate = "${splitDate[1]}-${splitDate[2]}-${splitDate[0]}";

    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/getjournal?date=$journalDate'), headers: {"authorization": value!});
    var data = jsonDecode(response.body);
    if (data["error"] == "0"){
        entries = data["journal"];
    }
    else if (data["error"] == "-1"){
        entries = [];
    }
    else{
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('An Error Has Occurred'),
          content: Text(data["message"]),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    today = DateTime.now();
    getJournal(today);
    Timer(const Duration(milliseconds: 1000), (){setState(() {});});
  }

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
          backgroundColor: Colors.green[300],
          centerTitle: true,
          elevation: 0.0,
          leading: //Icon(App.navigate_before),
          IconButton(
            icon: Icon(journal.navigate_before),
            onPressed: () {
              today = today.subtract(const Duration(days: 1));
              getJournal(today);
              setState(() {});
              Timer(const Duration(milliseconds: 1000), (){setState(() {entries.length;});});
              
            },
          ),
          actions: [
            IconButton(
                icon: Icon(journal.navigate_next),
              onPressed: (){
              today = today.add(const Duration(days: 1));
              getJournal(today);
              setState(() {});
              Timer(const Duration(milliseconds: 1000), (){setState(() {entries.length;});});
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
          backgroundColor: Colors.green[300],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          iconSize: 36,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index)=> setState(() {
            if (index == 0){
              Navigator.pushNamed(context, "/dashboard");
            }
            else if (index == 2){
              Navigator.pushNamed(context, '/search');
            }

          }),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Dashboard',
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