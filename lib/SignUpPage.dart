import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'LoginPage.dart';
import 'package:flutter/material.dart';
import 'InputDeco_design.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  //TextController to read text entered in text field
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  TextEditingController _watergoal = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _birthmonth = TextEditingController();
  TextEditingController _birthdate = TextEditingController();
  TextEditingController _birthyear = TextEditingController();

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
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: Container(
                        width: 375,
                        height: 40,
                        child: Text(
                            'LOGO',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 30,
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
                    controller: _email,
                    decoration:buildInputDecoration(Icons.email,"Email"),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Please a Enter Email';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _email = value as TextEditingController;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: _password,
                    obscureText: true,
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: _confirmpassword,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.lock,"Confirm Password"),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Please re-enter password';
                      }
                      print(_password.text);

                      print(_confirmpassword.text);

                      if(_password.text!=_confirmpassword.text){
                        return "Password does not match";
                      }

                      return null;
                    },

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: _height,
                    decoration:buildInputDecoration(Icons.accessibility_new_rounded,"Height(cm)"),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Please enter your height';
                      }
                      if(int.parse(value)<=50)
                      {
                        return 'Please enter your height as centimeter';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _height = value as TextEditingController;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: _weight,
                    decoration:buildInputDecoration(Icons.monitor_weight_outlined,"Weight(kg)"),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Please enter your weight';
                      }
                      if(int.parse(value)>=600)
                      {
                        return 'Please enter your weight as kilogram';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _weight = value as TextEditingController;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: _watergoal,
                    decoration:buildInputDecoration(Icons.water_drop_outlined,"Water Goal(ml)"),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Please enter your water goal';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _watergoal = value as TextEditingController;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: _gender,
                    decoration:buildInputDecoration(Icons.transgender,"Gender(male/female)"),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Please enter your gender';
                      }
                      if((value.toLowerCase()!='male')&&(value.toLowerCase()!='female'))
                      {
                        print(value.toLowerCase());
                        return 'Please enter your gender(male/female)';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _gender = value as TextEditingController;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 5),
                  child: TextFormField(
                    controller: _birthdate,
                    decoration:buildInputDecoration(Icons.date_range_rounded,"Birth Date (dd)"),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Please enter your birthdate';
                      }
                      if((int.parse(value)<0)|(int.parse(value)>=30))
                      {
                        return 'Please enter your birthdate as DD';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _birthdate = value as TextEditingController;
                    },
                  ),
                ),
                Padding(
                      padding: const EdgeInsets.only(bottom: 15,left: 10,right: 5),
                      child: TextFormField(
                        controller: _birthmonth,
                        decoration:buildInputDecoration(Icons.date_range_rounded,"Birth Month (mm)"),
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'Please enter your birthmonth';
                          }
                          if((int.parse(value)<0)|(int.parse(value)>=12))
                          {
                            return 'Please enter your birthmonth as MM';
                          }
                          return null;
                        },
                        onSaved: (value){
                          _birthmonth = value as TextEditingController;
                        },
                      ),
                    ),
                Padding(
                      padding: const EdgeInsets.only(bottom: 15,left: 10,right: 5),
                      child: TextFormField(
                        controller: _birthyear,
                        decoration:buildInputDecoration(Icons.date_range_rounded,"Birth Year (yyyy)"),
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'Please enter your birthyear';
                          }
                          if((int.parse(value)<1800))
                          {
                            return 'Please enter your birthyear as YYYY';
                          }
                          return null;
                        },
                        onSaved: (value){
                          _birthyear = value as TextEditingController;
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
                        print("UnSuccessfull");
                      }
                    },

                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color:Colors.white),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Text("Already have an account?"),
                    TextButton(
                      child: const Text(
                          'Login'
                      ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
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
      'email': _email.text,
      'password': _password.text,
      'height': _height.text,
      'weight': _weight.text,
      'watergoal': _watergoal.text,
      'gender': _gender.text,
      'month': _birthmonth.text,
      'day': _birthdate.text,
      'year': _birthyear.text,
    };
    print("USER DATA: ${body}");
    var response = await http.post(Uri.parse('http://10.0.2.2:8000/api/signup'), headers: header, body: jsonEncode(body));

    var data = jsonDecode(response.body);

    print(data);

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
      print(data["token"]);
      await storage.write(key: "token", value: data["token"]);
      print("This is the token");
      print(await storage.read(key: "token"));
      Timer(const Duration(milliseconds: 1000), (){Navigator.pushReplacementNamed(context, '/dashboard');});
    }


  }
}