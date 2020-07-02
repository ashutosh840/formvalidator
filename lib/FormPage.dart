
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String email;
  String password;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    name=null;
    email=null;
    password=null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(

        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.text,

                decoration: InputDecoration(


                  border: OutlineInputBorder(),
                  labelText: "Enter Your Name"
                ),
                validator: (value){
                  if(value.length<=3){
                    return 'Please Enter some Text';
                  }
                  return null;
                  },
                onChanged: (value){
                  setState(() {
                    name=value;
                  });
                },

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(

                    border: OutlineInputBorder(),
                    labelText: "Email"
                ),
                validator: (value){
                  return validateEmail(value);
                },
                onChanged: (value)=>email=value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,

                keyboardType: TextInputType.text,
                decoration: InputDecoration(

                    border: OutlineInputBorder(),
                    labelText: "Password",
                    helperText: " Min 8 Char, atleast one Upper case, one Lower Case, \n one number and one special character ",


                ),
                validator: (value){
                  return validatePassword(value);
                },
                onChanged: (value)=>password=value,

              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text('Validate'),
                color: Colors.green,
                onPressed: (){
                  if(_formKey.currentState.validate()) {
                  print("validate");
                  _formKey.currentState.reset();


                 // print(_formKey.currentWidget.toString());
                    print(name);
                    print(email);
                    print(password);

                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


String  validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if ((!regex.hasMatch(value))&&(value.length>=8))
    return 'Enter Valid Email';
  else
    return null;
}

String  validatePassword(String value) {
  Pattern pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid password';
  else
    return null;
}