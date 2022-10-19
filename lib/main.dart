import 'package:congressional_app_challenge_mobile/dashboard.dart';
import 'package:congressional_app_challenge_mobile/journal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Index(),
      routes: {
        "/journal": (context) => const journal(),
        "/dashboard": (context) => const dashboard(),
      },
    );
  }
}

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Card(
          child: ListTile(
            title: const Text("Journal"),
            leading: const Icon(Icons.auto_awesome),
            onTap: () {
              Navigator.pushNamed(context, "/journal");
            },
          ),
        ),
        Card(
          child: ListTile(
              title: const Text("Dashboard"),
              leading: const Icon(Icons.access_alarm),
              onTap: () {
                Navigator.pushNamed(context, "/dashboard");
              }),
        ),
      ],
    ));
  }
}
