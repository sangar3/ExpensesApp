import './widgets/user_transaction.dart';

import './constants.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
 
 
  
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Flutter App'),
      ),
      body: Column
        (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        
          children: <Widget>
          [
            Container
            (
              width: double.infinity,
              child: Card
              (
                color: kPrimaryColor,
                child: Container
                (
                  width: 100,
                  child: Text("CHART!")
                ),
                elevation: 5,
              ),
            ),
            UserTransactions()
          ],
        ),
      );
  }
}
