import 'package:flutter/material.dart';
import 'package:formvalidator/FormPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.green,
          elevation: 0,
          title: Text('Form Validator Example'),
        ),
        body: FormPage()
      ),
    );
  }
}
