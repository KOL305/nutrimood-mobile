import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'InputDeco_design.dart';
import 'package:http/http.dart' as http;
import 'SignUpPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 90.0),
                  child: Center(
                    child: Container(
                        width: 200,
                        height: 80,
                        child: Text(
                            'LOGO',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 60,
                            )
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 5,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    controller: _name,
                    decoration: buildInputDecoration(Icons.person,"User Name"),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Please Enter User Name';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _name = value as TextEditingController;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: _password,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.lock,"Password"),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Please a Enter Password';
                      }
                      return null;
                    },

                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.white38,width: 2)
                      ),
                    ),
                    onPressed: (){

                      if(_formkey.currentState!.validate())
                      {
                        RegisterUser();
                        print("successful");

                        return;
                      }else{
                        print("Unsuccessful");
                      }
                    },

                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Login',
                        style: TextStyle(color:Colors.white),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Text("Don't have an account?"),
                    TextButton(
                      child: const Text(
                          'Sign Up'
                      ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpPage()),
                          );
                        }
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future RegisterUser() async{
    var header = {"Content-Type":"Application/JSON"};

    var body = {
      'name': _name.text,
      'password': _password.text,
    };

    final response = await http.post(Uri.parse('http://10.0.2.2:8000/api/login'), headers: header, body: jsonEncode(body));

    var data = jsonDecode(response.body);

    if (data["error"] != "0"){
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
    else{
      final storage = new FlutterSecureStorage();
      await storage.write(key: "token", value: data["token"]);
      Timer(const Duration(milliseconds: 1000), (){Navigator.pushReplacementNamed(context, '/dashboard');});
    }
  }
}