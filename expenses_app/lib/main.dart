import './transaction.dart';
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
  final List<Transaction> transactions= [
    Transaction
    (
      id: 't1', 
      title: "Bitcoin", 
      amount:50.99, 
      date:DateTime.now() 
    ),
    Transaction
    (
      id: 't1', 
      title: "ethereum", 
      amount:50.99, 
      date:DateTime.now() 
    )
  ];
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
        
          children: <Widget>
          [
            Container
            (
              width: double.infinity,
              child: Card
              (
                color: Colors.blue,
                child: Container
                (
                  width: 100,
                  child: Text("CHART!")
                ),
                elevation: 5,
              ),
            ),
            Card
            (
              color: Colors.red,
              child: Text("List of Text"),
            ),
          ],
        ),
      );
  }
}
